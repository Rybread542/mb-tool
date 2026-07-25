# chat.py
# Chainlit UI over the Vanna pipeline. Results auto-render as track, album, or
# artist cards (DiscoveryCards), enriched with Spotify links / artist images,
# with an in-place toggle to the raw table. The empty screen shows rotating
# starter prompts (3 discovery : 1 info).
#
# Run with:   chainlit run chat.py -w
# Requires public/elements/DiscoveryCards.jsx, spotify_helper.py, and the
# starter icons in public/ (mic.svg, record.svg, note.svg, question.svg).

import random
import re
from concurrent.futures import ThreadPoolExecutor

import pandas as pd
import chainlit as cl
from vanna_setup import get_vn
from spotify import spotify_helper as spotify

vn = get_vn()

MAX_DISPLAY_ROWS = 25
MAX_CARDS = 30

CAA_ENTITY = "release-group"   # or "release" if covers don't load
CAA_SIZE = "500"

UUID_RE = re.compile(
    r"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", re.I
)

LABEL = {"tracks": "track", "albums": "album", "artists": "artist"}


# ===========================================================================
# STARTERS  (edit the pool freely; the rotation handles the rest)
# ===========================================================================

# Category -> icon file in /public. artists=mic, albums=record, tracks=note,
# info=question.
STARTER_ICONS = {
    "artists": "/public/mic.svg",
    "albums": "/public/record.svg",
    "tracks": "/public/note.svg",
    "info": "/public/question.svg",
}

# (category, short label, full prompt sent on click)
STARTER_POOL = [
    # --- discovery: tracks ---
    ("tracks", "Prog epics", "Show me some prog rock songs that are over 20 minutes long."),
    ("tracks", "Indie folk discovery", "Recommend a few indie folk tracks from the 2010s."),
    ("tracks", "Focus playlist", "Find some long ambient tracks from after 2000."),
    ("tracks", "Themed titles", "Show me some pop rock songs with either 'sun' or 'moon' in the title."),
    ("tracks", "World discovery", "Recommend me some brazilian folk songs."),
    ("tracks", "Chill remixes", "Show me some downtempo remixes."),
    # --- discovery: albums ---
    
    ("albums", "Deep house mix", "Find me some deep house dj mixes."),
    ("albums", "Dead & Company", "Recommend me some live psychedelic rock albums from the 70s."),
    ("albums", "Simon music", "Show me some drone albums that are longer than 2 hours."),
    ("albums", "Shoegaze, but Korean", "Find me some Korean Shoegaze albums from the 2010s."),
    ("albums", "A little soul", "Show me some soul albums from the 80s."),
    ("albums", "Daniel's finest jazz", "Find me some albums by jazz artists named Daniel"),
    # --- discovery: artists ---
    ("artists", "Nu jazz musicians", "Show me some nu jazz artists"),
    ("artists", "90s death metal bands", "List some death metal artists active in the 90s."),
    ("artists", "Post-punk acts", "List some post-punk artists from the 80s."),
    ("artists", "Smooth singers", "Recommend some 70s soft rock artists."),
    # --- info / DB questions ---
    ("info", "Quietest hip hop year", "What year between 2000 and 2020 had the fewest hip hop albums?"),
    ("info", "Most prolific artist", "Which artist has released the most albums?"),
    ("info", "Albums per decade", "How many albums were released per decade since the 1960s?"),
]

DISCOVERY_CATS = {"artists", "albums", "tracks"}


@cl.set_starters
async def set_starters():
    """Pick 3 random discovery prompts + 1 random info prompt each session."""
    discovery = [s for s in STARTER_POOL if s[0] in DISCOVERY_CATS]
    info = [s for s in STARTER_POOL if s[0] == "info"]
    chosen = random.sample(discovery, min(3, len(discovery)))
    chosen += random.sample(info, min(1, len(info)))
    random.shuffle(chosen)  # so the info prompt isn't always in the same slot
    return [
        cl.Starter(label=label, message=message, icon=STARTER_ICONS[cat])
        for (cat, label, message) in chosen
    ]


# ===========================================================================
# URL builders
# ===========================================================================

def cover_url(gid):
    if not gid or not UUID_RE.match(str(gid)):
        return None
    suffix = f"-{CAA_SIZE}" if CAA_SIZE else ""
    return f"https://coverartarchive.org/{CAA_ENTITY}/{gid}/front{suffix}"


def mb_url(gid, entity):
    if not gid or not UUID_RE.match(str(gid)):
        return None
    return f"https://musicbrainz.org/{entity}/{gid}"


# ===========================================================================
# Column resolution
# ===========================================================================

def pick(df, candidates):
    lower = {c.lower(): c for c in df.columns}
    for cand in candidates:
        if cand in lower:
            return lower[cand]
    return None


def find_gid_column(df):
    named = pick(df, ["gid", "mbid", "album_gid", "artist_gid"])
    if named:
        return named
    for col in df.columns:
        non_null = df[col].dropna()
        if len(non_null) and UUID_RE.match(str(non_null.iloc[0])):
            return col
    return None


def classify(df):
    track_col = pick(df, ["track_title", "track", "song_title"])
    album_col = pick(df, ["album_title", "album"])
    artist_col = pick(df, ["artist_name", "artist"])

    cols = {
        "gid": find_gid_column(df),
        "track": track_col,
        "album": album_col,
        "artist": artist_col,
        "year": pick(df, ["released", "release_year", "year"]),
        "duration": pick(df, ["duration", "length", "runtime"]),
        "nationality": pick(df, ["nationality", "country"]),
        "tags": pick(df, ["tags", "cleaned_tags", "genres"]),
    }

    if track_col and cols["gid"]:
        return "tracks", cols
    if album_col and cols["gid"]:
        return "albums", cols
    if artist_col and not album_col and not track_col:
        return "artists", cols
    return "table", cols


# ===========================================================================
# Cell helpers
# ===========================================================================

def _val(row, col):
    if not col or col not in row:
        return None
    v = row[col]
    if v is None or (isinstance(v, float) and pd.isna(v)):
        return None
    s = str(v).strip()
    return s if s else None


def _year(row, col):
    s = _val(row, col)
    if s is None:
        return None
    try:
        return int(float(s))
    except (ValueError, TypeError):
        return s


def _tags(row, col):
    if not col or col not in row:
        return []
    v = row[col]
    if v is None:
        return []
    if isinstance(v, (list, tuple)):
        return [str(t).strip() for t in v if t is not None and str(t).strip()]
    s = str(v).strip().strip("{}")
    if not s:
        return []
    return [p.strip().strip('"') for p in s.split(",") if p.strip()]


def _cell(v):
    if v is None or (isinstance(v, float) and pd.isna(v)):
        return ""
    if isinstance(v, (list, tuple)):
        return ", ".join(str(x) for x in v if x is not None)
    return str(v)


def build_table(df):
    sub = df.head(MAX_DISPLAY_ROWS)
    return {
        "columns": [str(c) for c in sub.columns],
        "rows": [[_cell(r[c]) for c in sub.columns] for _, r in sub.iterrows()],
        "total": int(len(df)),
        "truncated": len(df) > MAX_DISPLAY_ROWS,
    }


# ===========================================================================
# Item builders
# ===========================================================================

def build_albums(df, cols):
    seen, out = set(), []
    for _, r in df.iterrows():
        gid = _val(r, cols["gid"])
        if gid and gid in seen:
            continue
        if gid:
            seen.add(gid)
        out.append({
            "title": _val(r, cols["album"]) or "Untitled",
            "artist": _val(r, cols["artist"]) or "Unknown artist",
            "year": _year(r, cols["year"]),
            "duration": _val(r, cols["duration"]) or "",
            "cover": cover_url(gid),
            "mbUrl": mb_url(gid, CAA_ENTITY),
            "spotifyUrl": None,
            "tags": _tags(r, cols["tags"]),
        })
        if len(out) >= MAX_CARDS:
            break
    return out


def build_tracks(df, cols):
    out = []
    for _, r in df.iterrows():
        gid = _val(r, cols["gid"])
        out.append({
            "track": _val(r, cols["track"]) or "Untitled",
            "artist": _val(r, cols["artist"]) or "Unknown artist",
            "album": _val(r, cols["album"]) or "",
            "year": _year(r, cols["year"]),
            "duration": _val(r, cols["duration"]) or "",
            "cover": cover_url(gid),
            "mbUrl": mb_url(gid, CAA_ENTITY),
            "spotifyUrl": None,
            "tags": _tags(r, cols["tags"]),
        })
        if len(out) >= MAX_CARDS:
            break
    return out


def build_artists(df, cols):
    seen, out = set(), []
    for _, r in df.iterrows():
        gid = _val(r, cols["gid"])
        name = _val(r, cols["artist"]) or "Unknown artist"
        key = gid or name
        if key in seen:
            continue
        seen.add(key)
        out.append({
            "artist": name,
            "nationality": _val(r, cols["nationality"]),
            "cover": None,                       # may be filled by Spotify image
            "mbUrl": mb_url(gid, "artist"),
            "spotifyUrl": None,
            "tags": _tags(r, cols["tags"]),
        })
        if len(out) >= MAX_CARDS:
            break
    return out


BUILDERS = {"albums": build_albums, "tracks": build_tracks, "artists": build_artists}


def _enrich_spotify(items, kind):
    if not items:
        return

    def work(it):
        if kind == "albums":
            it["spotifyUrl"] = spotify.album_link(it["title"], it["artist"])
        elif kind == "tracks":
            it["spotifyUrl"] = spotify.track_link(it["track"], it["artist"])
        elif kind == "artists":
            info = spotify.artist_info(it["artist"])
            it["spotifyUrl"] = info["link"]
            if info["image"]:
                it["cover"] = info["image"]

    with ThreadPoolExecutor(max_workers=8) as ex:
        list(ex.map(work, items))


def build_items(df, kind, cols):
    items = BUILDERS[kind](df, cols)
    _enrich_spotify(items, kind)
    return items


# ===========================================================================
# Chainlit handler
# ===========================================================================

@cl.on_message
async def handle_message(message: cl.Message):
    question = message.content.strip()
    if not question:
        return

    async with cl.Step(name="Thinking about the request", type="llm") as step:
        try:
            sql = await cl.make_async(vn.generate_sql)(question)
            if sql == 'REFUSE':
                step.output = 'Query refused'
                await cl.Message(content="Your query was refused by the model, either because it contained destructive instructions or is irrelevant to the database.").send()
                return
                
        except Exception as e:
            step.output = f"Error: {e}"
            await cl.Message(content=f"SQL generation failed: `{e}`").send()
            return
        step.output = f"```sql\n{sql}\n```"

    async with cl.Step(name="Searching", type="tool") as step:
        try:
            df = await cl.make_async(vn.run_sql)(sql)
        except Exception as e:
            step.output = f"Error: {e}"
            await cl.Message(
                content=f"Query failed: `{e}`"
            ).send()
            return
        step.output = f"Found {len(df)} result(s)."

    if df is None or len(df) == 0:
        await cl.Message(
            content=(
                "No results found. If this is surprising, "
                "you may want to rephrase or check the readme for language guidelines."
            )
        ).send()
        return

    kind, cols = classify(df)

    if kind in BUILDERS:
        items = await cl.make_async(build_items)(df, kind, cols)
        if items:
            el = cl.CustomElement(
                name="DiscoveryCards",
                props={"kind": kind, "items": items, "table": build_table(df)},
                display="inline",
            )
            await cl.Message(
                content=f"Found {len(items)} {LABEL[kind]}(s):", elements=[el]
            ).send()
            return

    body = df.head(MAX_DISPLAY_ROWS).to_markdown(index=False)
    suffix = (
        f"\n\n_(showing first {MAX_DISPLAY_ROWS} of {len(df)} rows)_"
        if len(df) > MAX_DISPLAY_ROWS
        else ""
    )
    await cl.Message(content=f"{body}{suffix}").send()