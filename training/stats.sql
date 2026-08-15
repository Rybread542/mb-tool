------------------------------------------------------------------------
-- SCALAR COUNTS: single tag, albums
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many albums have the shoegaze tag
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['shoegaze'];

--how many dream pop albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['dream pop'];

--count of krautrock albums
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['krautrock'];

--number of bossa nova albums
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['bossa nova'];

--how many ambient releases are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['ambient'];

--how many metal albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%');

--how many house releases are in the database
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%');



------------------------------------------------------------------------
-- SCALAR COUNTS: tag combinations, albums
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many albums have the instrumental and rock tags
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags @> array['instrumental', 'rock'];

--how many albums are tagged both jazz and funk
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags @> array['jazz', 'funk'];

--count of albums with both ambient and techno tags
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags @> array['ambient', 'techno'];

--how many albums are tagged folk or country
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['folk', 'country'];

--how many albums have the lo-fi tag but not hip hop
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['lo-fi']
AND NOT album.cleaned_tags && array['hip hop'];



------------------------------------------------------------------------
-- SCALAR COUNTS: tag + year/decade, albums
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many 70s soft rock albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['soft rock']
AND album.release_year BETWEEN 1970 AND 1979;

--how many 90s trip hop albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['trip hop']
AND album.release_year BETWEEN 1990 AND 1999;

--count of disco albums from 1979
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['disco']
AND album.release_year = 1979;

--how many synthwave albums came out in the 2010s
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['synthwave']
AND album.release_year BETWEEN 2010 AND 2019;

--how many recent hyperpop albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['hyperpop']
AND album.release_year BETWEEN 2020 AND 2025;

--number of punk albums released in the 80s
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%punk%')
AND album.release_year BETWEEN 1980 AND 1989;



------------------------------------------------------------------------
-- SCALAR COUNTS: release types
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many deep house dj mixes are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['DJ-mix']
AND album.cleaned_tags && array['deep house'];

--how many techno dj mixes are in the database
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['DJ-mix']
AND album.cleaned_tags && array['techno'];

--how many drum and bass EPs are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['EP']
AND album.cleaned_tags && array['drum and bass'];

--how many idm EPs came out in the 90s
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['EP']
AND album.cleaned_tags && array['idm']
AND album.release_year BETWEEN 1990 AND 1999;

--count of new wave singles from the 80s
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['Single']
AND album.cleaned_tags && array['new wave']
AND album.release_year BETWEEN 1980 AND 1989;

--how many house single remixes are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type @> array['Single', 'Remix']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%');

--how many live jazz albums are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['Live']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%');

--how many soundtracks are in the database
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.release_type && array['Soundtrack'];

--how many compilations are there
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.release_type && array['Compilation'];

--how many demos are in the database
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.release_type && array['Demo'];

--number of black metal demos
SELECT

COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['Demo']
AND album.cleaned_tags && array['black metal'];



------------------------------------------------------------------------
-- SCALAR COUNTS: artists
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many kpop artists are there
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['k-pop'];

--how many shoegaze artists are in the database
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['shoegaze'];

--count of hip hop artists
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%');

--how many artists are tagged both jazz and electronic
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags @> array['jazz', 'electronic'];

--how many german techno artists are there
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['techno']
AND artist.nationality = 'Germany';

--how many french artists are in the database
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'France';

--how many artists are in the database
SELECT

COUNT(*) AS nbr

FROM artist

WHERE artist.name NOT IN ('Various Artists', '[unknown]');



------------------------------------------------------------------------
-- SCALAR COUNTS: tracks
-- Output: single count (nbr)
------------------------------------------------------------------------

--how many shoegaze tracks are there
SELECT

COUNT(*) AS nbr

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['shoegaze'];

--how many doom metal songs are in the database
SELECT

COUNT(*) AS nbr

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['doom metal'];

--count of 80s synth-pop tracks
SELECT

COUNT(*) AS nbr

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['synth-pop']
AND album.release_year BETWEEN 1980 AND 1989;

--how many tracks are in the database
SELECT

COUNT(*) AS nbr

FROM track

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical;



------------------------------------------------------------------------
-- TAG EXPLORATION: pattern matching on tag names
-- Output: tag rows (tag, nbr)
------------------------------------------------------------------------

--how many tags like progressive are there
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%progressive%'
GROUP BY tag
ORDER BY nbr DESC;

--what metal subgenres are there
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%metal%'
GROUP BY tag
ORDER BY nbr DESC;

--list all tags containing house with counts
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%house%'
GROUP BY tag
ORDER BY nbr DESC;

--show me every punk tag and how common each is
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%punk%'
GROUP BY tag
ORDER BY nbr DESC;

--what jazz subgenres exist besides plain jazz
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%jazz%'
AND tag != 'jazz'
GROUP BY tag
ORDER BY nbr DESC;

--how many distinct tags are in the database
SELECT

COUNT(DISTINCT tag) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL;



------------------------------------------------------------------------
-- TAG CO-OCCURRENCE: what appears alongside a tag
-- Output: tag rows (tag, nbr)
------------------------------------------------------------------------

--what tags most often appear with shoegaze
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['shoegaze']
AND tag != 'shoegaze'
GROUP BY tag
ORDER BY nbr DESC
LIMIT 15;

--which tags show up alongside dungeon synth
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['dungeon synth']
AND tag != 'dungeon synth'
GROUP BY tag
ORDER BY nbr DESC
LIMIT 15;

--most common tags on albums tagged city pop
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['city pop']
AND tag != 'city pop'
GROUP BY tag
ORDER BY nbr DESC
LIMIT 15;



------------------------------------------------------------------------
-- TAG RANKINGS: top tags overall / by year / by decade
-- Output: tag rows (tag, nbr)
------------------------------------------------------------------------

--top 20 most common album tags
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
GROUP BY tag
ORDER BY nbr DESC
LIMIT 20;

--top 10 tags from the 70s
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_year BETWEEN 1970 AND 1979
GROUP BY tag
ORDER BY nbr DESC
LIMIT 10;

--most popular rock subgenre in 1994
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND tag LIKE '%rock%'
AND tag != 'rock'
AND album.release_year = 1994
GROUP BY tag
ORDER BY nbr DESC
LIMIT 1;

--most common album tag in 2000
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.release_year = 2000
GROUP BY tag
ORDER BY nbr DESC
LIMIT 1;

--top 10 tags on EPs
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['EP']
GROUP BY tag
ORDER BY nbr DESC
LIMIT 10;

--most common tags on dj mixes
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type && array['DJ-mix']
GROUP BY tag
ORDER BY nbr DESC
LIMIT 10;

--most common tag per decade from the 60s through the 2010s
WITH decade_tag_counts AS (
    SELECT 
    (album.release_year / 10 * 10) AS decade,
    tag,
    COUNT(*) AS nbr,
    ROW_NUMBER() OVER (PARTITION BY (album.release_year / 10 * 10) ORDER BY COUNT(*) DESC) AS rnk
    
    FROM
    album, unnest(album.cleaned_tags) AS tag
    WHERE album.cleaned_tags IS NOT NULL
    AND album.release_year BETWEEN 1960 AND 2019
    GROUP BY decade, tag
)

SELECT decade, tag, nbr
FROM decade_tag_counts
WHERE rnk = 1
ORDER BY decade;

--top 10 most common artist tags
SELECT

tag,
COUNT(*) AS nbr

FROM artist, unnest(artist.cleaned_tags) AS tag

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
GROUP BY tag
ORDER BY nbr DESC
LIMIT 10;



------------------------------------------------------------------------
-- RELEASE TYPE DISTRIBUTIONS
-- Output: release type rows (release_type, nbr)
------------------------------------------------------------------------

--breakdown of release types in the database
SELECT

rt AS release_type,
COUNT(*) AS nbr

FROM album, unnest(album.release_type) AS rt

GROUP BY rt
ORDER BY nbr DESC;

--release type breakdown for aphex twin
SELECT

rt AS release_type,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

CROSS JOIN unnest(album.release_type) AS rt

WHERE artist.name_search = 'aphextwin'
GROUP BY rt
ORDER BY nbr DESC;

--what release types do ambient releases come in
SELECT

rt AS release_type,
COUNT(*) AS nbr

FROM album

CROSS JOIN unnest(album.release_type) AS rt

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['ambient']
GROUP BY rt
ORDER BY nbr DESC;



------------------------------------------------------------------------
-- TRENDS: tag counts over time
-- Output: year rows (released, nbr) or single year
------------------------------------------------------------------------

--disco releases per year over time
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['disco']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY album.release_year;

--vaporwave albums per year
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['vaporwave']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY album.release_year;

--italo-disco releases by decade
SELECT

(album.release_year / 10 * 10) AS decade,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['italo-disco']
AND album.release_year IS NOT NULL

GROUP BY decade
ORDER BY decade;

--what year had the most grunge albums
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['grunge']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY nbr DESC
LIMIT 1;

--peak year for dubstep
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['dubstep']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY nbr DESC
LIMIT 1;

--year between 2000 and 2020 with the fewest hip hop albums
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND album.release_year BETWEEN 2000 AND 2020

GROUP BY album.release_year
ORDER BY COUNT(*) ASC
LIMIT 1;

--earliest year with a synthwave release
SELECT

MIN(album.release_year) AS first_year

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['synthwave']
AND album.release_year IS NOT NULL;

--when did the first drum and bass album come out
SELECT

MIN(album.release_year) AS first_year

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.cleaned_tags && array['drum and bass']
AND album.release_year IS NOT NULL;



------------------------------------------------------------------------
-- ARTIST LEADERBOARDS: which artists have the most X
-- Output: artist rows (artist_name, nbr)
------------------------------------------------------------------------

--artists with the most albums in 1998
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year = 1998

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 10;

--artists with the most deep house EPs in the 2000s
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['EP']
AND album.cleaned_tags && array['deep house']
AND album.release_year BETWEEN 2000 AND 2009

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 10;

--country artists with the most releases in the 60s
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_year BETWEEN 1960 AND 1969

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 5;

--top 5 jazz artists by album count
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 5;

--which artist has released the most dj mixes
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['DJ-mix']

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 1;

--which black metal artist has the most demos
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Demo']
AND album.cleaned_tags && array['black metal']

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 1;

--top 10 artists by total release count
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 10;



------------------------------------------------------------------------
-- ARTIST-SPECIFIC COUNTS AND DISCOGRAPHIES
-- Output: single count or album rows
------------------------------------------------------------------------

--how many phil collins albums are there
SELECT

COUNT(*) AS nbr

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE album.release_type = array['Album']
AND artist.name_search = 'philcollins';

--how many john mayer releases are in the database
SELECT

COUNT(*) AS nbr

FROM 

album

JOIN artist_credit ac ON album.artist_credit = ac.id
JOIN artist ON ac.artist_id = artist.id

WHERE artist.name_search = 'johnmayer';

--how many beatles singles are there
SELECT

COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type && array['Single']
AND artist.name_search = 'thebeatles';

--how many live albums does pearl jam have
SELECT

COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type && array['Live']
AND artist.name_search = 'pearljam';

--steely dan studio discography in release order
SELECT

album.gid,
album.title AS album_title,
artist.name AS artist_name,
album.release_year AS released

FROM

album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album']
AND artist.name_search = 'steelydan'
ORDER BY album.release_year ASC;

--all britney spears singles from the 2000s
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

WHERE album.release_type && array['Single']
AND artist.name_search = 'britneyspears'
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY album.release_year ASC;

--tracklists for all fleet foxes albums
SELECT
  album.title       AS album_title,
  artist.name      AS artist_name,
  album.release_year AS released,
  track.position  AS track_pos,
  track.title     AS track_title,
  (track.duration / 60000) || ':' ||
    lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration

FROM 

track

JOIN album_variations av 
ON track.album_id = av.id AND av.is_canonical

JOIN album 
ON av.album_group = album.id

JOIN artist_credit ac 
ON album.artist_credit = ac.id

JOIN artist 
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album'] 
AND artist.name_search = 'fleetfoxes'

ORDER BY album.release_year, track.position;

--year the rolling stones released the most live albums
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM

album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type && array['Live'] 
AND artist.name_search = 'therollingstones'
GROUP BY album.release_year
ORDER BY nbr DESC
LIMIT 1;



------------------------------------------------------------------------
-- DURATION STATS
-- Output: duration values or album/track rows
------------------------------------------------------------------------

--average track length on ok computer
WITH avg_album_ms AS(
    SELECT
    
    ROUND(AVG(track.duration)) AS ms
    
    FROM track
    
    JOIN album_variations av
    ON track.album_id = av.id 
    AND av.is_canonical
    
    JOIN album
    ON av.album_group = album.id
    
    WHERE album.release_type = array['Album'] 
    AND album.title_search = 'okcomputer'
    AND track.duration IS NOT NULL
)

SELECT 
(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration
  
  FROM avg_album_ms;

--average track length on tango in the night by fleetwood mac
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
    AND track.duration IS NOT NULL
    AND album.title_search = 'tangointhenight'
    AND artist.name_search = 'fleetwoodmac'
)

SELECT 
(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration
  
  FROM avg_album_ms;

--longest yes album
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
    AND artist.name_search = 'yes'
    AND album.duration IS NOT NULL
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

--shortest rush album
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
    AND artist.name_search = 'rush'
    AND track.duration IS NOT NULL
    GROUP BY album.gid, album.title, artist.name, album.release_year
    ORDER BY ms ASC
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

--10 longest songs from 1973
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
(track.duration / 60000) || ':' || 
  lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration,
album.tags

FROM track

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id


WHERE album.release_year = 1973
AND track.duration IS NOT NULL
ORDER BY track.duration DESC
LIMIT 10;

--longest album released in 1992
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
AND album.release_year = 1992
AND album.duration IS NOT NULL
ORDER BY album.duration DESC
LIMIT 1

--average track length for drone albums
WITH tagged_tracks AS (
    SELECT
    
    track.duration AS ms
    
    FROM track
    
    JOIN album_variations av
    ON track.album_id = av.id AND av.is_canonical
    
    JOIN album
    ON av.album_group = album.id
    
    WHERE album.cleaned_tags IS NOT NULL
    AND album.release_type = array['Album']
    AND album.cleaned_tags && array['drone']
    AND track.duration IS NOT NULL
)

SELECT
(ROUND(AVG(ms)) / 60000)::int || ':' ||
   lpad(((ROUND(AVG(ms))::bigint % 60000) / 1000)::int::text, 2, '0') AS avg_duration

FROM tagged_tracks;