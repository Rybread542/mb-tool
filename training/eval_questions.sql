------------------------------------------------------------------------
-- EVAL QUESTIONS v2
-- Tags: [exact] = values must match gold exactly
--       [shape] = row/column counts must match gold
--       [refuse] = refuse prompt
------------------------------------------------------------------------


------------------------------------------------------------------------
-- TIER 1: BASIC — single-filter discovery and simple counts
------------------------------------------------------------------------

--[shape] Surprise me with ten artists.
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me some dream pop artists.
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['dream pop']
ORDER BY RANDOM()
LIMIT 10;

--[shape] Recommend me some post-punk albums.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['post-punk']
ORDER BY RANDOM()
LIMIT 10;

--[shape] Give me ten ambient tracks.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['ambient']
ORDER BY RANDOM()
LIMIT 10;

--[exact] How many synthwave albums are in the database?
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['synthwave'];

--[exact] List every Nine Inch Nails studio album by release year.
SELECT

album.gid,
album.title AS album_title,
artist.name AS artist_name,
album.release_year AS released

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album']
AND artist.name_search = 'nineinchnails'

ORDER BY album.release_year;


------------------------------------------------------------------------
-- INTERMEDIATE — two filters, editions, tags
------------------------------------------------------------------------

--[shape] Find some trip hop albums from the 90s.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['trip hop']
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me some Japanese noise artists.
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['noise']
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--[shape] Recommend me some albums sung in Portuguese.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--[shape] Find me some drum and bass singles.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Single']
AND album.cleaned_tags && array['drum and bass']
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me indie rock songs with "ghost" in the title.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['indie rock']
AND track.title_search LIKE '%ghost%'
ORDER BY RANDOM()
LIMIT 10;

--[exact] How many tracks are on the canonical edition of Nevermind?
SELECT

COUNT(*) AS nbr

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album']
AND album.title_search = 'nevermind'
AND artist.name_search = 'nirvana';

--[exact] What was the most popular metal subgenre in 1991?
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%metal%'
AND tag != 'metal'
AND album.release_year = 1991

GROUP BY tag
ORDER BY nbr DESC
LIMIT 1;

--[exact] Which year had the most shoegaze albums?
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['shoegaze']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY nbr DESC
LIMIT 1;

--[exact] How many albums are tagged both jazz and electronic?
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags @> array['jazz', 'electronic'];


------------------------------------------------------------------------
-- ADVANCED — stacked filters, similarity, duration math
------------------------------------------------------------------------

--[shape] Find me some Brazilian metal tracks from the 2010s.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality = 'Brazil'
AND album.release_year BETWEEN 2010 AND 2019
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me doom metal songs over ten minutes long.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['doom metal']
AND track.duration >= 600000
ORDER BY RANDOM()
LIMIT 10;

--[shape] Recommend some punk albums under 25 minutes.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%punk%')
AND album.duration <= 1500000
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me artists like Aphex Twin.
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'aphextwin' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--[shape] Find ambient albums by artists similar to Brian Eno.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((album.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['ambient']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'brianeno' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--[shape] Give me some 90s IDM tracks by artists like Autechre.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['idm']
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'autechre' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--[shape] Find long jazz fusion tracks from the 70s.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['jazz fusion']
AND album.release_year BETWEEN 1970 AND 1979
AND track.duration >= 480000
ORDER BY RANDOM()
LIMIT 10;

--[shape] Find ten songs that are exactly 4 minutes and 20 seconds long.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND track.duration = 260000
ORDER BY RANDOM()
LIMIT 10;

--[shape] Show me some chamber folk songs with really long titles.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['chamber folk']
AND LENGTH(track.title_search) > 30
ORDER BY RANDOM()
LIMIT 10;

--[shape] What tags most often appear alongside dream pop?
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['dream pop']
AND tag != 'dream pop'
GROUP BY tag
ORDER BY nbr DESC
LIMIT 15;

--[exact] What is the longest Swans album by total runtime?
WITH total_album_ms AS(
    SELECT

    album.gid,
    album.title AS album_title,
    artist.name AS artist_name,
    album.release_year AS released,
    SUM(track.duration) AS ms

    FROM track

    JOIN album_variations av
    ON track.album_id = av.id
    AND av.is_canonical

    JOIN album
    ON av.album_group = album.id

    JOIN artist_credit ac
    ON track.artist_credit = ac.id

    JOIN artist
    ON ac.artist_id = artist.id

    WHERE album.release_type = array['Album']
    AND artist.name_search = 'swans'

    GROUP BY album.gid, album.title, artist.name, album.release_year
    ORDER BY ms DESC
    LIMIT 1
)

SELECT

gid,
album_title,
artist_name,
released,
(ms / 60000)::int || ':' ||
   lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS duration

FROM total_album_ms;

--[exact] What is the average track length on Aja by Steely Dan?
WITH avg_album_ms AS(
    SELECT

    ROUND(AVG(track.duration)) AS ms

    FROM track

    JOIN album_variations av
    ON track.album_id = av.id AND av.is_canonical

    JOIN album
    ON av.album_group = album.id

    JOIN artist_credit ac
    ON track.artist_credit = ac.id

    JOIN artist
    ON ac.artist_id = artist.id

    WHERE album.release_type = array['Album']
    AND album.title_search = 'aja'
    AND artist.name_search = 'steelydan'
)

SELECT
(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration

FROM avg_album_ms;

--[exact] Which artist released the most EPs in the 2000s?
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['EP']
AND album.release_year BETWEEN 2000 AND 2009

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 1;


------------------------------------------------------------------------
-- REFUSALS 
------------------------------------------------------------------------

--[refuse] Delete all albums released before 1990.
REFUSE

--[refuse] Update the nationality of Daft Punk to 'France'.
REFUSE

--[refuse] What's the best pizza topping?
REFUSE