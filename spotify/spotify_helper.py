# spotify_helper.py
# Optional Spotify lookups (links + artist images) via the Client Credentials
# flow. Safe to import even if spotipy isn't installed or creds aren't set:
# every function then just returns "nothing found".
#
# Setup:
#   pip install spotipy
#   export SPOTIPY_CLIENT_ID=...        (from the Spotify developer dashboard)
#   export SPOTIPY_CLIENT_SECRET=...
#
# Results are cached to disk (keyed by a stable identifier) so we don't
# re-query Spotify for the same entity. Delete spotify_cache.json to reset.

import json
import os
import threading
from pathlib import Path

try:
    import spotipy
    from spotipy.oauth2 import SpotifyClientCredentials
except ImportError:
    spotipy = None

_CACHE_PATH = Path(os.environ.get("SPOTIFY_CACHE", "spotify_cache.json"))
_lock = threading.Lock()
_cache = {}
_client = None
_init_done = False


def _load_cache():
    global _cache
    if _CACHE_PATH.exists():
        try:
            _cache = json.loads(_CACHE_PATH.read_text())
        except Exception:
            _cache = {}


def _save_cache():
    try:
        _CACHE_PATH.write_text(json.dumps(_cache))
    except Exception:
        pass


def _client_or_none():
    """Lazily build the Spotify client once. Returns None if unavailable."""
    global _client, _init_done
    if _init_done:
        return _client
    _init_done = True
    cid = os.environ.get("SPOTIPY_CLIENT_ID")
    secret = os.environ.get("SPOTIPY_CLIENT_SECRET")
    if spotipy and cid and secret:
        try:
            auth = SpotifyClientCredentials(client_id=cid, client_secret=secret)
            _client = spotipy.Spotify(auth_manager=auth, requests_timeout=8, retries=2)
            _load_cache()
        except Exception:
            _client = None
    return _client


def _cached(key, fetch):
    """Return cached value, else call fetch(). Caches found AND not-found
    results, but NOT transient errors (those raise and are skipped)."""
    with _lock:
        if key in _cache:
            return _cache[key]
    try:
        val = fetch()
    except Exception:
        return None  # transient (timeout, 429, etc.) — don't poison the cache
    with _lock:
        _cache[key] = val
        _save_cache()
    return val


def _clean(s):
    # Strip quotes so they don't break the search query syntax.
    return (s or "").replace('"', "").strip()


def album_link(title, artist):
    sp = _client_or_none()
    title, artist = _clean(title), _clean(artist)
    if not sp or not title:
        return None
    key = f"album|{artist.lower()}|{title.lower()}"

    def fetch():
        q = f'album:"{title}"' + (f' artist:"{artist}"' if artist else "")
        items = sp.search(q=q, type="album", limit=1).get("albums", {}).get("items", [])
        return items[0]["external_urls"].get("spotify") if items else None

    return _cached(key, fetch)


def track_link(track, artist):
    sp = _client_or_none()
    track, artist = _clean(track), _clean(artist)
    if not sp or not track:
        return None
    key = f"track|{artist.lower()}|{track.lower()}"

    def fetch():
        q = f'track:"{track}"' + (f' artist:"{artist}"' if artist else "")
        items = sp.search(q=q, type="track", limit=1).get("tracks", {}).get("items", [])
        return items[0]["external_urls"].get("spotify") if items else None

    return _cached(key, fetch)


def artist_info(name, gid=None):
    """Return {'link': url|None, 'image': url|None} for an artist."""
    sp = _client_or_none()
    name = _clean(name)
    if not sp or not name:
        return {"link": None, "image": None}
    key = f"artist|{gid or name.lower()}"

    def fetch():
        items = sp.search(q=f'artist:"{name}"', type="artist", limit=1).get("artists", {}).get("items", [])
        if not items:
            return {"link": None, "image": None}
        a = items[0]
        img = a["images"][0]["url"] if a.get("images") else None
        return {"link": a["external_urls"].get("spotify"), "image": img}

    return _cached(key, fetch)