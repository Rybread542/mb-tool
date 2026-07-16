------------------------------------------------------------------------
-- ARTIST QUERIES
-- Output: artist rows (artist_name, gid, tags)
------------------------------------------------------------------------

--Show me some French hip hop artists.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;


--Find some soul musicians named David.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%soul%')
AND artist.name_search LIKE 'david%'
ORDER BY RANDOM()
LIMIT 10;


--Show me some prog rock artists with an album that is at least an hour and a half long.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id


WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['progressive rock']
AND album.duration >= 5400000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--Show me some jazz artists with albums shorter than 45 minutes.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND album.duration < 2700000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--Find me some 80s progressive rock artists.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--Find me some 2010s progressive rock artists like dream theater.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 2010 AND 2019
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'dreamtheater' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--Recommend some cool jazz artists active in the 2010s
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['cool jazz']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--Recommend some folk singers from the 50s.
SELECT

artist.name AS artist_name,
artist.gid,
artist.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.release_year BETWEEN 1950 AND 1959
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--List 10 artists with an average track length of at least 7 minutes.
WITH artist_avg AS (

     SELECT
        artist.name AS artist_name,
        artist.gid,
        artist.cleaned_tags AS tags,
        ROUND(AVG(track.duration)) AS ms

     FROM track

     JOIN album_variations av
     ON track.album_id = av.id AND av.is_canonical

     JOIN album
     ON av.album_group = album.id

     JOIN artist_credit ac
     ON album.artist_credit = ac.id

     JOIN artist
     ON ac.artist_id = artist.id

     WHERE artist.cleaned_tags IS NOT NULL
     AND artist.name NOT IN ('Various Artists', '[unknown]')
     AND album.release_type = array['Album']

     GROUP BY artist.name, artist.gid, artist.cleaned_tags
     HAVING AVG(track.duration) >= 420000
)

SELECT
      artist_name,
      gid,
      tags,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;


--List some rock artists with an average song duration of at least 7 minutes.
WITH artist_avg AS (

     SELECT
        artist.name AS artist_name,
        artist.gid,
        artist.cleaned_tags AS tags,
        ROUND(AVG(track.duration)) AS ms

     FROM track

     JOIN album_variations av
     ON track.album_id = av.id AND av.is_canonical

     JOIN album
     ON av.album_group = album.id

     JOIN artist_credit ac
     ON album.artist_credit = ac.id

     JOIN artist
     ON ac.artist_id = artist.id

     WHERE artist.cleaned_tags IS NOT NULL
     AND artist.name NOT IN ('Various Artists', '[unknown]')
     AND album.release_type = array['Album']
     AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
     GROUP BY artist.name, artist.gid, artist.cleaned_tags
     HAVING AVG(track.duration) >= 420000
)

SELECT
      artist_name,
      gid,
      tags,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;


------------------------------------------------------------------------
-- ALBUM QUERIES
-- Output: album rows (gid, artist_name, album_title, released, duration, tags)
------------------------------------------------------------------------

--Show me ten albums by any artist named Megan.
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
AND artist.name_search LIKE 'megan%'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me ten jazz albums by artists named Stan.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.name_search LIKE 'stan%'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me ten albums by jazz artists named Stan.
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
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.name_search LIKE 'stan%'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some jazz fusion albums.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%fusion%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some jazz fusion albums similar to herbie hancock.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%fusion%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'herbiehancock' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some rock albums that are not metal.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find albums tagged with both ambient and techno.
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
AND album.cleaned_tags @> array['ambient','techno']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Recommend some albums for people who like Bonobo.
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'bonobo' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some 90s pop albums like Michael Jackson.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'michaeljackson' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some hard rock albums from the 80s.
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
AND album.cleaned_tags && array['hard rock']
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some 80s hard rock albums similar to Steppenwolf.
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
AND album.cleaned_tags && array['hard rock']
AND album.release_year BETWEEN 1980 AND 1989
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'steppenwolf' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find some live Canadian folk performances from the 80s.
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
AND album.release_type && array['Live']
AND artist.nationality = 'Canada'
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some soul albums with 'sun' or 'moon' in the title.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%soul%')
AND (album.title_search LIKE '%sun%' OR album.title_search LIKE '%moon%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Recommend me some 2000s trance EPs.
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
AND album.release_type && array['EP']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--List some 2000s pop albums that are less than 35 minutes long.
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.duration < 2100000

ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 5;


--Find me some albums with the word strange in the title.
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
AND album.title_search LIKE '%strange%'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find 5 albums with a total duration of at least 67 minutes.
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
AND album.duration >= 4020000

ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 5;


--Find 5 deep house DJ sets that are at least an hour long
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
AND album.release_type && array['DJ-mix']
AND album.duration >= 3600000

ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 5;


--Show me some live albums from the 70s.
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
AND album.release_type @> array['Album', 'Live']
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some funk albums from the 70s.
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
AND album.cleaned_tags && array['funk']
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some electronic remix albums.
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
AND album.release_type @> array['Album', 'Remix']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find some live EPs by indie rock bands.
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
AND album.release_type @> array['EP', 'Live']
AND album.cleaned_tags && array['indie rock']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some new wave compilations.
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
AND album.release_type && array['Compilation']
AND album.cleaned_tags && array['new wave']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some soundtracks from the 90s.
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
AND album.release_type && array['Soundtrack']
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some hip hop mixtapes from the 2000s.
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
AND album.release_type && array['Mixtape/Street']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find some early demos by punk bands.
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
AND album.release_type && array['Demo']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%punk%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some fantasy audiobooks.
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
AND album.release_type && array['Audiobook']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%fantasy%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


------------------------------------------------------------------------
-- TRACK QUERIES
-- Output: track rows (gid, track_title, artist_name, album_title, released, duration, tags)
------------------------------------------------------------------------

--Find me some deep house remixes from the 2010s
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Remix']
AND album.cleaned_tags && array['deep house']
AND album.release_year BETWEEN 2010 AND 2019
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find me some long prog rock songs from the 90s.
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1990 AND 1999
AND track.duration > 480000
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find 10 post rock songs that are at least 30 minutes long.
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%post%rock%')
AND track.duration >= 1800000
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Find 10 songs with a duration ending in 33 seconds, for example 3:33
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND track.duration % 60000 = 33000
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me some folk songs from the 2010s.
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.release_year BETWEEN 2010 AND 2019
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--List ten pop singles from 1987.
SELECT

  album.gid,
  track.title AS track_title,
  artist.name AS artist_name,
  album.release_year AS released,
  to_char((track.duration || ' milliseconds')::interval, 'HH24:MI:SS') AS duration,
  album.cleaned_tags AS tags

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Single']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year = 1987
AND track.position = 1

ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--List 10 progressive house songs with 'love you' in the title.
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['progressive house']
AND track.title_search LIKE '%loveyou%'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me ten American psychedelic rock tracks from the 70s that have either the word 'peace' or 'love' in the title.
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id


WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['psychedelic rock']
AND album.release_year BETWEEN 1970 AND 1979
AND artist.nationality = 'United States'
AND (track.title_search LIKE '%peace%' OR track.title_search LIKE '%love%')
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--Show me 20 songs named 'Carolina on my mind'
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
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND track.title_search = 'carolinaonmymind'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 20;