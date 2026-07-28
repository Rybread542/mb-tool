initial = """
You are a PostgreSQL expert who will aid the user in retrieving information from 
a music database. Universal rules for all input, delimited:
- All requests to modify, update, delete, or otherwise perform write actions
on the database in any way must ALWAYS be answered with: REFUSE
- All inputs unrelated to requests for music or music data must ALWAYS be answered with: REFUSE
valid queries will request music or music data from the database. therefore, all unrelated 
inputs must be refused.
- The three types of output are artist, album, and track. Each has required column outputs 
when displaying a general list:
artist:
artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

album:
album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

track:
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

- ensure album tags are displayed for tracks AND albums: album.cleaned_tags IS NOT NULL
- ensure artist tags are displayed: AND artist.cleaned_tags IS NOT NULL
- ensure placeholder artists are filtered: AND artist.name NOT IN ('Various Artists', '[unknown]')
- shuffle music discovery results: ORDER BY RANDOM()
- vague user queries that request music, but do not explicitly request either artist, album or track, must always default
to returning studio albums with whatever criteria, if any, the user gives.
- default number of results to return is 10 unless number is specified by user. 'an album' 'an artist' 'a song' -> LIMIT 1
- vocab shortcuts for artist, album, and track:
'group', 'musician', 'artist', 'band', 'singer', 'dj' -> artist
'album', 'record', 'music', -> album
'track', 'song', 'piece' -> track

""" 

docs_arr = [
    # --- Schema ---
    """
    The database has six tables:
    - album: top-level, deduplicated releases. One row per canonical album, does not include rereleases or special editions.
    - album_variations: Individual releases of an album. Regional releases, special editions. This table is necessary when joining tracks to albums.
    - artist: top-level musicians and groups, including nationality.
    - artist_credit: the complete artist credit on a given release. album_variations joins directly with this table to match artist credit with a single release. 
    Each artist_credit row has a single principal artist it relates to in the artist table similarly to how album_variations joins to album.
    Additionally, artist_credit can be either a single artist name, or a delimited list of many artists who contributed. 
    - similar_artist: stores similar neighbors for a large number of artists. Each artist can have up to 100 neighbors based on user listening data.
    - track: individual songs. MUST be joined directly to album_variations and artist_credit to link one track to artist or album.
    Do not join track directly to album, the schema has no edge for this.

    Important joins (atomic):
    - artist_credit.artist_id = artist.id   (credit -> artist)
    - album_variations.album_group = album.id   (variation -> canonical album)
    - track.album_id = album_variations.id   (track -> variation)
    - track.artist_credit = artist_credit.id   (track -> credit)
    - album.artist_credit = artist_credit.id   (album -> credit)
    - artist.gid = sa.similar_artist_mbid (artist -> similar artists)

    Common composed walks:
    - track to its canonical album: track -> album_variations -> album
    - track to its canonical artist: track -> artist_credit -> artist
    - album to its canonical artist: album -> artist_credit -> artist
    """,

    # --- Genre substrings ---
    """
    When searching for albums, artists, and tracks with a genre given by the user,
    matching genre tags depends on the scope of the genre asked for by the user.
    Determining the genre involves two steps:

    1. Delimit: treat the longest running set of adjacent genre words as a SINGLE genre.
    NEVER split multi-word genre phrases into individual genres.
        'indie pop albums' -> single genre 'indie pop'
        'pop rock songs' -> single genre 'pop rock'
        'folk rock artists' -> single genre 'folk rock'
    two or more distinct genres can ONLY exist if the user joins them with 'and', 'or', 'both x and y', 'plus', 'also'
        'jazz and fusion albums' -> two genres 'jazz', 'fusion'
        'rock or pop songs' -> two genres 'rock', 'pop'

    
    2. Classify each word from step 1 as BROAD or SPECIFIC.
    A phrase is only BROAD if the full phrase appears in the BROAD list. Any phrase of two or more words
    is SPECIFIC, even if it is made up of words in the BROAD list. Any single word that does not appear
    in the BROAD list is always SPECIFIC.

    BROAD words include:
    'rock', 'pop', 'metal', 'jazz', 
    'blues', 'folk', 'house', 'techno', 
    'trance', 'ambient', 'soul', 'disco', 
    'indie', 'funk', 'country', 'r&b', 
    'classical', 'symphonic', 'orchestral'

    - A BROAD word must be substring matched to include subgenres:
    AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')

    - A SPECIFIC word must be EXACTLY matched using overlap:
        AND album.cleaned_tags && array['krautrock']
        AND album.cleaned_tags && array['shoegaze']
        AND album.cleaned_tags && array['psychedelic rock']
        AND album.cleaned_tags && array['indie pop']
        AND album.cleaned_tags && array['folk rock']

    Do not substring match on a SPECIFIC genre. This will produce unrelated tags and must be avoided:
    User asks for "indie pop albums"
    WRONG:
        AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%indie%')
        AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
    RIGHT:
        AND album.cleaned_tags && array['indie pop']

    TRAPS - these look like broad genres, but substring-matching them produces wrong
    results:
    - 'dub' substring-matches 'dubstep' (unrelated). Always SPECIFIC.
    - 'wave' covers 'new wave', 'vaporwave', 'dark wave', 'synthwave' —
    all unrelated. Always SPECIFIC for any 'wave' subgenre.
    - 'hardcore' spans punk and electronic families. Always SPECIFIC.
    - 'experimental' is a descriptor across genres, always SPECIFIC.
    - 'rap' matches to trap. always SPECIFIC even though there are subgenres.

    Vocab matching shortcuts, all SPECIFIC:
    prog, prog rock -> 'progressive rock'
    prog metal -> 'progressive metal'
    bossa -> 'bossa nova'
    alt rock -> 'alternative rock'
    psych, psychedelia -> 'psychedelic'
    post rock -> 'post-rock'
    synthpop, synth pop -> 'synth-pop'
    kpop -> 'k-pop'

    EXCEPTIONS:
    'hiphop' 'hip hop' is an exact special case. there is data with both 'hip hop' and 'hip-hop'. therefore, always use the following:
    AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
    """,

    # --- Nationality ---
    """
    When querying based on nationality:
    artist.nationality contains a single location string per artist. 
    The majority of values are countries ('United States', 'South Korea') but the data includes, 
    much less frequently, cities and regions ('London', 'New York', 'Los Angeles'). 
    Because of this, match the user's term literally:
    - "French artists" - WHERE artist.nationality = 'France'
    - "Artists from Paris" - WHERE artist.nationality = 'Paris'
    Because of this limitation, do not attempt to roll cities into their respective countries. The user asking for 
    "American artists" should recive results tagged 'United States'
    rather than trying to include all cities.
    Important nationality shortcuts:
    "british" "english" "uk" -> United Kingdom
    "korean" -> South Korea
    "american" -> United States
    "aussie" -> Australia
    "spanish" -> Spain
    "scandinavia" "scandinavian" -> artist.nationality IN ('Sweden', 'Finland', 'Norway')
    """,

    # --- Release type ---
    """
    When querying for albums, the release_type filter is required. 
    album.release_type is a text array of one or more types, including the following: 
    Album, Compilation, Single, Live, Soundtrack, EP, Remix, Demo, DJ-mix, Mixtape/Street.
    Each album can have one or more of these types. When filtering for release type, use the following conventions:
    - Always default to studio albums if no release type is requested. 
    Studio albums will always have a release_type of exactly ['Album']. 
    Therefore, filter WHERE album.release_type = array['Album'] for studio albums

    - If a type is requested, e.g. 'live performances' 'remixes', etc, add a relevant release_type filter. 
    Compilations, Singles, Live albums, Soundtracks, EPs, Remixes, Demos and DJ-mixes can all have one or more release type. This has two main filter conventions:
        1. "house EPs" -> WHERE album.release_type && array['EP'] returns all albums with at least the EP type
        2. "house single remixes" -> WHERE album.release_type @> array['Single', 'Remix'] returns albums with at least the Single AND Remix type
    """,

    # --- Release year constraints ---
    """
    When filtering by release year, the date range of data is between 1890 and 2025.
    Vocab conventions:
    "modern", "neo" -> WHERE album.release_year BETWEEN 2000 AND 2025
    "new", "newer", "recent", "last few years", "2020s" -> WHERE album.release_year BETWEEN 2020 AND 2025
    "older", "classic", "old" -> WHERE album.release_year BETWEEN 1950 AND 2000
    "aughts", "oughts", "2000s" -> WHERE album.release_year BETWEEN 2000 AND 2009
    """,

    # --- Artist similarity search ---
    """
    When querying for similar artists, for example:
    'ten rock albums like john lennon', 'tracks by artists like Prince', 'artists similar to Sufjan Stevens'
    The similar_artist table must always be joined to artist: 
    JOIN similar_artist sa ON artist.gid = sa.similar_artist_mbid.
    Additionally, the following small subquery model is *required on all similarity queries* in this exact convention:
    WHERE sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = '<artist>' ORDER BY artist.id ASC LIMIT 1)
    This join and WHERE statement allow results to be filtered only to artists that are neighbors of the user's given artist, allowing for rough similarity
    discovery searches.
    """,

    # --- Name search ---
    """
    When querying by artist name, album title, or track title, always filter by the search columns: artist.name_search, album.title_search, track.title_search.
    These columns are normalized versions of artist.name, album.title, and track.title respectively. i.e. lowercase, punctuation and whitespace removed.
    Example: for "Guns N' Roses", filter WHERE artist.name_search = 'gunsnroses'. Always use album.title, artist.name, and track.title for display output.
    Never use the search columns for display output.
    Similarly, name_search can be used to search for substrings or other string values:
    - "Tracks with 'blue' in the title" -> WHERE track.title_search LIKE '%blue%'
    - "Tracks named 'True Love'" -> WHERE track.title_search = 'truelove'
    - "Albums with exactly 15 characters in the title" -> WHERE LENGTH(album.title_search) = 15
    - "Artists named Michael" -> WHERE artist.name_search LIKE 'michael%'
    IMPORTANT: always normalize and remove spaces from user title/name requests. for example: 
    "find me songs with 'part 1' or 'part 2' in the title" -> WHERE (track.title_search LIKE %part1% OR track.title_search LIKE %part2%)
    album_variations does not have a title_search column and should never be used for title matching. Always use album.title_search for title matching.
    """,

    # --- Exact searches ---
    """
    When the user names exact artists, albums or tracks, album.title_search and artist.name_search can be leveraged for an exact match:
    - "How many tracks are on the album 'The Stranger' by Billy Joel? -> WHERE artist.name_search = 'billyjoel' AND album.title_search = 'thestranger'
    """,

    # --- Track position ---
    """
    When querying for tracklists, use the track.position column. This column indicates the position of the track on a given release.
    Conventions:
    - When searching for specifically a-side singles, WHERE track.position = 1
    - When listing album tracklists or discographies, ORDER BY album.release_year, track.position
    - First track of an album, WHERE track.position = 1
    """,

    # --- Variation count ---
    """
    When counting releases or album variations, use the album.variation_count column. Variation count is the total number of editions/releases from the album_variations table
    for a single canonical album in the album table.
    """,

     # --- is canonical ---
    """
    album_variations.is_canonical is a boolean flag which determines whether a given row in album_variations corresponds to the "canonical" album in the album table.
    If true, that row in album_variations is the canonical variation of the album whose id equals this row's album_group. For this reason, when querying for track information, we join on:
    album_variations.album_group = album.id AND album_variations.is_canonical. Otherwise, there will be a duplicate row for each instance of the track.
    """,

    # --- Converting to hours:minutes:seconds ---
    """
    When displaying lengths or durations of tracks and albums, always convert milliseconds
    to HH:MM:SS for display using this model:
    to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration
    The same model works for album.duration and for aggregated millisecond values
    (e.g. a SUM or ROUND(AVG(...)) result from a CTE):
    to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS duration
    Always use HH24, never HH or MI alone: HH24 displays the full hour count, while
    other patterns silently truncate durations of an hour or more.
    Never use this conversion in WHERE clauses. All duration filtering is done in
    raw milliseconds: WHERE track.duration >= 480000
    'long' tracks -> track.duration >= 480000
    'long' albums -> album.duration >= 3600000
    """,
]