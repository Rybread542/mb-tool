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
import uuid
from concurrent.futures import ThreadPoolExecutor
 
import pandas as pd
import chainlit as cl
from vanna_setup import get_vn
from spotify import spotify_helper as spotify

from log import init_logging, format_table, session_header, log_query

log = init_logging()
vn = get_vn()
 
MAX_DISPLAY_ROWS = 25
MAX_CARDS = 30
 
CAA_ENTITY = "release-group"   # or "release" if covers don't load
CAA_SIZE = "500"
 
UUID_RE = re.compile(
    r"^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", re.I
)
 
LABEL = {"tracks": "track", "albums": "album", "artists": "artist"}
 
# --- rerun plumbing --------------------------------------------------------
RERUN_ACTION = "rerun_sql"
RERUN_ICON = "refresh-cw"          
RERUN_TOOLTIP = "Resubmit this request for new results"
MAX_TRACKED_QUERIES = 50          
 
 
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
    ("tracks", "Prog epics", "Prog rock songs that are over 20 minutes long."),
    ("tracks", "Indie folk discovery", "Indie folk tracks from the 2010s."),
    ("tracks", "Focus playlist", "Long ambient tracks from after 2000."),
    ("tracks", "Themed titles", "Pop rock songs with either 'sun' or 'moon' in the title."),
    ("tracks", "World discovery", "Brazilian classical songs."),
    ("tracks", "Alors on danse", "French house tracks."),
    ("tracks", "Chill remixes", "Downtempo remixes."),
    ("tracks", "Heavy Scandinavian", "Doom metal songs from Scandinavia."),
    ("tracks", "Boomer tunes", "40s swing songs."),
    ("tracks", "Live jams", "Late 70s long live rock songs."),

    # --- discovery: albums ---
    ("albums", "Deep house mixes", "Deep house dj mixes."),
    ("albums", "Dead & Company", "Live psychedelic rock albums from the 70s."),
    ("albums", "Simon music", "Experimental albums that are longer than 2 hours."),
    ("albums", "Shoegaze, but Korean", "Korean Shoegaze albums from the 2010s."),
    ("albums", "A little soul", "Soul albums from the 80s."),
    ("albums", "Daniel's finest jazz", "Albums by jazz artists named Daniel."),
    ("albums", "Indie pop fever", "Indie pop albums from the last few years."),
    ("albums", "Rap classics", "Classic rap albums."),
    ("albums", "Beach bossa", "Bossa nova albums."),
    ("albums", "I love the Smiths!", "Indie rock albums similar to The Smiths."),
    ("albums", "Miles ahead", "Cool jazz albums like Miles Davis."),

    # --- discovery: artists ---
    ("artists", "Nu jazz musicians", "Nu jazz artists"),
    ("artists", "90s death metal bands", "Death metal bands active in the 90s."),
    ("artists", "Post-punk acts", "Post-punk groups from the 80s."),
    ("artists", "Smooth singers", "70s soft rock artists."),
    ("artists", "Indie electronic artists like Phantogram.", "70s soft rock artists."),

    # --- info / DB questions ---
    ("info", "Quietest hip hop year", "What year between 2000 and 2020 had the fewest hip hop albums?"),
    ("info", "Most prolific artist", "Which artist has released the most albums?"),
    ("info", "Albums per decade", "How many albums were released per decade since the 1960s?"),
    ("info", "92's longest work", "What was the longest album released in 1992?"),
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
# SQL registry  (per-session: query id -> {question, sql})
# ===========================================================================
 
def _registry():
    reg = cl.user_session.get("sql_registry")
    if reg is None:
        reg = {}
        cl.user_session.set("sql_registry", reg)
    return reg
 
 
def register_sql(question, sql):
    """Store a generated query and return the id used by the rerun button."""
    reg = _registry()
    qid = uuid.uuid4().hex[:12]
    reg[qid] = {"question": question, "sql": sql}
    # trim oldest entries (dicts preserve insertion order)
    while len(reg) > MAX_TRACKED_QUERIES:
        reg.pop(next(iter(reg)))
    return qid
 
 
def get_sql(qid):
    entry = _registry().get(qid)
    return entry if entry else None
 
 
# ===========================================================================
# Result rendering  (shared by the message handler and the rerun callback)
# ===========================================================================
 
async def _detach_previous_button():
    """Remove the rerun button from whatever message currently owns it."""
    prev = cl.user_session.get("active_rerun_action")
    if prev is None:
        return
    try:
        await prev.remove()
    except Exception:
        # The message may already be gone (session restore, cleared chat, etc.)
        pass
    cl.user_session.set("active_rerun_action", None)
 
 
async def send_result(content, qid, elements=None):
    
    await _detach_previous_button()
 
    action = cl.Action(
        name=RERUN_ACTION,
        payload={"qid": qid},
        icon=RERUN_ICON,
        tooltip=RERUN_TOOLTIP,
    )
    await cl.Message(
        content=content, elements=elements or [], actions=[action]
    ).send()
    cl.user_session.set("active_rerun_action", action)
 
 
async def render_results(df, qid, header=None):
    """Turn a dataframe into cards (or a markdown table)"""
    if df is None or len(df) == 0:
        await send_result(
            "No results found. If this is surprising, you may want to rephrase "
            "or check the readme for language guidelines.",
            qid,
        )
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
            prefix = f"{header} " if header else ""
            await send_result(
                f"{prefix}Found {len(items)} {LABEL[kind]}(s):", qid, elements=[el]
            )
            return
 
    body = df.head(MAX_DISPLAY_ROWS).to_markdown(index=False)
    suffix = (
        f"\n\n_(showing first {MAX_DISPLAY_ROWS} of {len(df)} rows)_"
        if len(df) > MAX_DISPLAY_ROWS
        else ""
    )
    prefix = f"{header}\n\n" if header else ""
    await send_result(f"{prefix}{body}{suffix}", qid)
 
 
async def execute_sql(sql, step_name):
    """Run SQL inside a Chainlit step. Returns (df, ok)."""
    async with cl.Step(name=step_name, type="tool") as step:
        step.input = f"```sql\n{sql}\n```"
        try:
            df = await cl.make_async(vn.run_sql)(sql)
        except Exception as e:
            step.output = f"Error: {e}"
            await cl.Message(content=f"Query failed: `{e}`").send()
            log.error("Query execution failed", exc_info=True)
            return None, False
        step.output = f"Found {len(df)} result(s)."
        log.info(f"RESULTS: ({0 if df is None else len(df)} rows):\n"
             f"{format_table(df, max_rows=MAX_DISPLAY_ROWS)}\n")  
        
        return df, True
 
 
# ===========================================================================
# Chainlit handlers
# ===========================================================================
 
@cl.on_chat_start
async def on_chat_start():
    session_header()

@cl.on_message
async def handle_message(message: cl.Message):
    question = message.content.strip()
    if not question:
        return

    log_query(question)
    
    async with cl.Step(name="Thinking about the request", type="llm") as step:
        try:
            sql = await cl.make_async(vn.generate_sql)(question)
            if sql == "REFUSE":
                step.output = "Query refused"
                log.info("REFUSED")
                await cl.Message(
                    content="The bot rejected your prompt. This can happen if irrelevant or unfamiliar language is used; " \
                    "check the readme in the top right for guidelines on how to word prompts."
                ).send()
                return
        except Exception as e:
            step.output = f"Error: {e}"
            log.error("SQL generation failed", exc_info=True)
            await cl.Message(content=f"SQL generation failed: `{e}`").send()
            return
        step.output = f"```sql\n{sql}\n```"

        log.info(f"Model SQL:\n{sql}")
 
    qid = register_sql(question, sql)
 
    df, ok = await execute_sql(sql, "Searching")
    if not ok:
        return
 
    await render_results(df, qid)
 
 
@cl.action_callback(RERUN_ACTION)
async def on_rerun(action: cl.Action):
    """
    Re-execute a stored query verbatim.
    """
    log.info('----------------REROLLED QUERY...')
    qid = (action.payload or {}).get("qid")
    entry = get_sql(qid)
    if not entry:
        await cl.Message(
            content="That query is no longer available in this session."
        ).send()
        return
 
    df, ok = await execute_sql(entry["sql"], "Rerolling...")
    if not ok:
        return
    
    await render_results(df, qid, header="Done.")