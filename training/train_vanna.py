from vanna_setup import get_vn
import re
import shutil, os

shutil.rmtree('chrome_db', ignore_errors=True)

vn = get_vn()

df_ddl = vn.run_sql("""
    SELECT table_name,
           'CREATE TABLE ' || table_name || ' (' ||
           string_agg(column_name || ' ' || data_type, ', ') || ');' AS ddl
    FROM information_schema.columns
    WHERE table_schema = 'public'
    GROUP BY table_name
""")

for ddl in df_ddl['ddl']:
    vn.train(ddl=ddl)


docs = [
    # --- Schema notes ---
    """
    The database has six tables:
    - album: top-level, deduplicated releases. One row per canonical album, does not include rereleases or special editions. Questions
    on albums will use this table. Includes duration in ms.
    - album_variations: Individual releases of an album. Regional releases, special editions. This table is necessary when relating tracks to albums.
    Questions about different releases, or questions about track listings utilize this table.
    - artist: top-level musicians and groups, including nationality.
    - artist_credit: the complete artist credit on a given release. album_variations joins directly with this table to match artist credit with a single release. 
    Each artist_credit row has a single principal artist it relates to in the artist table similarly to how album_variations joins to album.
    Additionally, artist_credit can be either a single artist name, or a delimited list of many artists who contributed. 
    - similar_artist: stores similar neighbors for a large number of artists. Each artist can have up to 100 neighbors based on user listening data. This table is
    always used for similarity discover queries.
    - track: individual songs. MUST be joined directly to album_variations and artist_credit to link one track to artist or album.
    Do not join track directly to album, the schema has no edge for this.
    Should be referenced for questions about songs or tracks. includes duration in ms.

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

    # --- gid ---
    """
    ALL queries listing track, album, or artist info must include either artist.gid for artists, or album.gid for tracks and albums. 
    The gid is required for a critical API call after the data is returned to be displayed to the user.
    """,

    # --- album release_type difference ---
    """ 
    When writing and filtering any query having to do with an album, *always* default to the following studio album filter:
    WHERE album.release_type = array['Album']
    Use this always when the user names a specific studio album.
    Always use this filter on the album table unless:
    - The user specifically asks for other release_types such as Live, EP, Single. In this case,
      filter with overlap -> WHERE album.release_type && array['EP'] etc
    - The user asks for all releases. In this case, do not filter release_type.
    """,

    # --- album information ---
    """
    When displaying album information, always display the following columns:
    album.title AS album_title,
    artist.name AS artist_name,
    album.release_year AS released,
    to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
    album.cleaned_tags AS tags
    title, artist, release year, duration and tags are always required on all queries displaying 
    general album lists, as it vastly increases the quality of the data for interpretation.
    """,

    # --- track information --- 
    """
    When displaying track information, always display the following columns:
    track.title AS track_title,
    artist.name AS artist_name,
    album.title AS album_title,
    album.release_year AS released,
    to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
    album.cleaned_tags AS tags
    title, artist, release year, duration and tags are always required on all queries displaying 
    general track lists, as it vastly increases the quality of the data for interpretation.
    """, 

    # --- Placeholder artists ---
    """
    When a query GROUPs BY or aggregates over artist.name (e.g. counting,
    ranking, or listing top artists), the WHERE clause must include:
    AND artist.name NOT IN ('Various Artists', '[unknown]')

    These are MusicBrainz placeholders. 'Various Artists' is used as the
    credit for compilations, which means it accumulates more credits than
    any real artist and will appear at the top of any "most prolific"
    ranking. '[unknown]' is used when an artist could not be identified.
    Both must be excluded from artist aggregations.

    Do not apply this filter when the user names a specific artist
    (e.g. "how many Beatles albums").
    """,

    # --- NULL tags ---
    """
    When filtering or grouping by genre or tags, always require cleaned_tags IS NOT NULL.
    The majority of entries in the database do not have tags, and the ones that do are crowdsourced and general.
    Therefore, for any query having to do with genres or tags, the scope of results should be reduced to rows with tags:
    WHERE album.cleaned_tags IS NOT NULL
    AND album.cleaned_tags && array['<genre>']
    """,

    # --- NULL duration ---
    """
    When querying for general lengths or durations of tracks and albums, always require track.duration IS NOT NULL.
    Many track rows have NULL values for duration, which can hinder general queries about track or album duration such 
    as average length, longest, or shortest.
    When querying for full tracklists, do not filter out null durations. Otherwise:
    WHERE track.duration IS NOT NULL
    """,

    # --- NULL release_year ---
    """
    When filtering or grouping by album release year, always require album.release_year IS NOT NULL.
    Many album rows have NULL values for release_year, which will produce useless aggregations
    when querying for data over a set of years or decades. Therefore, when querying for data over time:
    WHERE album.release_year IS NOT NULL
    """,

    # --- Release year constraints and usage ---
    """
    When filtering on a year range on album.release_year, the date range of useful data is between 1890 and 2025. 
    Never write queries with release_year outside this range. 
    General vocabulary conventions:
    "modern", "neo", "new", "newer", "recent" -> WHERE album.release_year BETWEEN 2020 AND 2025
    "older", "classic", "old" -> WHERE album.release_year BETWEEN 1950 AND 2000

    Never apply a date range based on a genre. For example, "find me some post rock albums" "list some neo folk songs"
    are genres and do not need a date filter.
    """,

    # --- Release year and artists ---
    """
    When querying for artists based on a date or a decade, artists can be deemed "active" if they have any associated rows on album where 
    album.release_year = X or album.release_year BETWEEN X and Y. This must ALWAYS be selected in a subquery using this model:
    SELECT * FROM (SELECT DISTINCT ON (artist.name) artist.name AS artist_name...FROM album...)
    This subquery is mandatory as not selecting distinct artist name rows will cause duplicate rows to appear in the output, which will break the data display.
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
    """,

    # --- Discovery queries ---
    """
    When answering a discovery question, for example:
    'Find me ten X albums', 'Find me some artists like Y', 'Recommend me some Z'
    Rows should be narrowed down to higher quality results. The database contains
    hundreds of thousands of very sparsely populated rows that can be valid results,
    but that are not very useful for music discovery.
    Default filters for discovery queries:
    - album.release_type = array['Album'] required unless the question specifically asks for singles, compilations, EPs, or live recordings.
    - album.cleaned_tags IS NOT NULL *required on ALL album queries*. filtering to only albums with declared tags drastically improves the discovery quality of the data.
    - artist.name NOT IN ('Various Artists', '[unknown]') *required on ALL artist, album, and genre queries*. Filtering out placeholder artists drastically improves
    the quality of the data.
    - Order by RANDOM() * (album.variation_count + 1) weights towards albums with more reissues, which is a soft "popularity" metric

    Discovery questions can be open-ended and want a useful sample of relevant music rather than an exact answer. These filters 
    leverage the database's objective data to produce pseudo-subjective results; useful for music discovery.

    This does not apply to completeness questions ("list all X," "every Y" where the user explicitly wants exhaustive results.
    """,

    # --- Similarity search ---
    """
    When answering a question of similarity, for example:
    'Find me ten rock albums like john lennon', 'Recommend me some tracks by artists like Prince', 'Show me some artists similar to Sufjan Stevens'
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
    When querying for a specific album given by the user, album.title_search and artist.name_search can be leveraged for an exact match:
    - "How many tracks are on the album 'The Stranger' by Billy Joel? -> WHERE artist.name_search = 'billyjoel' AND album.title_search = 'thestranger'
    """,

    # --- Release type ---
    """
    album.release_type is a text array of one or more types, including the following: Album, Compilation, Single, Live, Soundtrack, EP, Remix, Demo, DJ-mix.
    Each album can have one or more of these types. When filtering for release type, use the following conventions:
    - Standard studio albums will always have a release_type of exactly ['Album']. Therefore, filter WHERE album.release_type = array['Album'] for studio albums
    - Compilations, Singles, Live albums, Soundtracks, EPs, Remixes, Demos and DJ-mixes can all have one or more release types. This has two main filter conventions:
        1. "Give me some house EPs" -> WHERE album.release_type && array['EP'] returns all albums with at least the EP type
        2. "Find me some house single remixes" -> WHERE album.release_type @> array['Single', 'Remix'] returns albums with at least the Single AND Remix type
    """,

    # --- Variation count ---
    """
    When counting releases or album variations, use the album.variation_count column. Variation count is the total number of editions/releases from the album_variations table
    for a single canonical album in the album table. This column can also be used as a very soft popularity metric.
    """,

    # --- is canonical ---
    """
    album_variations.is_canonical is a boolean flag which determines whether a given row in album_variations corresponds to the "canonical" album in the album table.
    If true, that row in album_variations is the canonical variation of the album whose id equals this row's album_group. For this reason, when querying for track information, we join on:
    album_variations.album_group = album.id AND album_variations.is_canonical. Otherwise, there will be a duplicate row for each instance of the track.
    """,

    # --- Nationality ---
    """
    artist.nationality contains a single location string per artist. The majority of values are countries ('United States', 'South Korea') but the data includes, 
    much less frequently, cities and regions ('London', 'New York', 'Los Angeles'). 
    Because of this, match the user's term literally:
    - "French artists" - WHERE artist.nationality = 'France'
    - "Artists from Paris" - WHERE artist.nationality = 'Paris'
    Because of this limitation, do not attempt to roll cities into their respective countries. The user asking for "American artists" should recive results tagged 'United States'
    rather than trying to include all cities.
    """,


    # --- Position ---
    """
    When querying for tracklists, utilise the track.position column. This column indicates the position of the track on a given release.
    Conventions:
    - When searching for specifically a-side singles, WHERE track.position = 1
    - When listing album tracklists or discographies, ORDER BY album.release_year, track.position
    - First track of an album, WHERE track.position = 1
    """,

    # --- Tags: Artist vs Album ---
    """
    When querying for artists, relevant genres should be looked up in the artist.cleaned_tags column. For example:
    - "Show me 10 folk artists" -> AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')

    Otherwise, when querying for tracks or albums by genre, tags should be taken from album.cleaned_tags:
    - "Show me 10 folk albums" -> AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
    """,

    # --- Genre substrings ---
    """
    Matching genre tags depends on the scope of the genre asked for by the user: either BROAD or SPECIFIC.
    - BROAD genres should be substring matched to largely include subgenres in result sets:
    AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')

    - SPECIFIC genres should ALWAYS be exactly matched when filtering:
        AND album.cleaned_tags && array['krautrock']
        AND album.cleaned_tags && array['shoegaze']
        AND album.cleaned_tags && array['psychedelic rock']
      Substring matching on a SPECIFIC genre will produce unrelated tags.

    Common BROAD genres include:
    'rock', 'pop', 'metal', 'jazz', 'blues', 'folk', 'house', 'techno', 'trance', 'ambient', 'soul', 'rap', 'disco', 'indie'

    Common SPECIFIC genres include:
    ALL subgenres: 'post rock', 'doom metal', 'progressive house', 'cool jazz', 'folk rock' etc
    Or any genre that is not BROAD

    TRAPS — these look broad but substring-matching them produces wrong
    results:
    - 'dub' substring-matches 'dubstep' (unrelated). Always exact.
    - 'wave' covers 'new wave', 'vaporwave', 'dark wave', 'synthwave' —
    all unrelated. Always exact for any 'wave' subgenre.
    - 'hardcore' spans punk and electronic families. Always exact.
    - 'experimental' is a descriptor across genres, not a coherent
    family. Always exact.
    """,

    # --- Rap/hiphop/post rock ---
    """
    When querying for hip hop OR post rock, always query on the full substring:
    AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%hip%hop%')
    AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%post%rock%')
    These two tags have the majority of results hyphenated. Searching without the hyphen wildcard drastically reduces data quality.
    """,

    # --- Showing tags in results ---
    """
    For all discovery queries "show me" "find me" "recommend me" "list" etc, always
    require that cleaned_tags IS NOT NULL and show the list of cleaned_tags as a column:
    - Artists -> artist.cleaned_tags AS tags
    - Tracks/Songs and albums -> album.cleaned_tags AS tags
    - WHERE <artist/album>.cleaned_tags IS NOT NULL

    This better allows the user to see at a glance what subgenres, if any, the row has,
    drastically increasing the quality of output versus just names or titles.
    """


]

for doc in docs: 
    vn.train(documentation=doc)

# ---------------------------------------------------------------------------
# Question/SQL example loading
#
# Training SQL files follow this layout:
#
#   --------------------------------------   <- separator line (ignored)
#   -- SECTION TITLE                         <- header comment (ignored)
#   -- Output: description of the rows       <- header comment (ignored)
#   --------------------------------------
#
#   --The question text.                     <- question
#   SELECT ...                               <- query body, ends at the next
#   ... ;                                       comment, separator, or EOF
#
# A comment line only becomes a question if SQL actually follows it before
# the next comment/separator, so header text is dropped automatically.
# One caveat: don't put `--` comments inside a query body — they would split
# the query in two.
# ---------------------------------------------------------------------------

SEPARATOR_RE = re.compile(r'^-{4,}\s*$')


def load_examples(path):
    examples = []
    question, sql_lines = None, []

    def flush():
        nonlocal question, sql_lines
        sql = '\n'.join(sql_lines).strip()
        if question and sql:
            examples.append((question, sql))
        question, sql_lines = None, []

    with open(path) as f:
        for raw in f:
            line = raw.rstrip('\n')
            stripped = line.strip()
            if SEPARATOR_RE.match(stripped):
                flush()                      # never a question, ends any pair
            elif stripped.startswith('--'):
                flush()                      # previous pair (if any) is done
                question = stripped.lstrip('-').strip()
            else:
                sql_lines.append(line)
    flush()
    return examples


for path in ('./training/stats.sql', './training/discovery.sql'):
    examples = load_examples(path)
    print(f"{path}: loaded {len(examples)} question/SQL pairs")
    for question, sql in examples:
        vn.train(question=question, sql=sql)

print("Training complete.")
print(vn.get_training_data())