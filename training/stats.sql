--Which artists had the most albums released in 1998?
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year = 1998

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 10;




--Which artists had the most Deep House EPs in the 2000s?
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON artist.id = ac.artist_id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['EP']
AND album.cleaned_tags && array['deep house']
AND album.release_year BETWEEN 2000 AND 2009

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 10;



--Which country artists had the most releases during the 60s?
SELECT

artist.gid,
artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON artist.id = ac.artist_id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_year BETWEEN 1960 AND 1969

GROUP BY artist.gid, artist.name
ORDER BY nbr DESC
LIMIT 5;



--List Steely Dan's studio discography in order of release.
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


-- List every Britney Spears single from the 2000s.
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


--Show me the tracklists for all of the fleet foxes' albums.
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



--What is the average length of the tracks on Ok Computer?
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
)

SELECT 
(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration
  
  FROM avg_album_ms;




--What is the average length of the tracks on the canonical version of tango in the night by fleetwood mac?
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
    AND album.title_search = 'tangointhenight'
    AND artist.name_search = 'fleetwoodmac'
)

SELECT 
(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration
  
  FROM avg_album_ms;



--What is the longest Yes album?
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



--What is the shortest Rush album?
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




--In what year did The Rolling Stones release the highest number of live performances?
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


--What year between 2000 and 2020 had the fewest hip hop albums?
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




--How many Phil Collins albums are in the database?
SELECT

COUNT(*)

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album']
AND artist.name_search = 'philcollins';



--How many John Mayer releases are in the database?
SELECT

COUNT(*)

FROM 

album

JOIN artist_credit ac ON album.artist_credit = ac.id
JOIN artist ON ac.artist_id = artist.id

WHERE artist.name_search = 'johnmayer';



--Which 5 jazz artists have the most albums?
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON artist.id = ac.artist_id


WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')

GROUP BY artist.name
ORDER BY nbr DESC
LIMIT 5;


--What are the top 10 longest songs released in 1973?
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
AND track.duration BETWEEN 10000 AND 7200000
ORDER BY track.duration DESC
LIMIT 10;


--Track the trend of disco music releases over time and tell me roughly when the world became sick of disco.
SELECT

album.release_year AS released,
COUNT(*) AS nbr

FROM album

WHERE album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['disco']
AND album.release_year IS NOT NULL

GROUP BY album.release_year
ORDER BY album.release_year;



--What are the top 20 most common genre tags across all albums?
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
GROUP BY tag
ORDER BY nbr DESC
LIMIT 20;



--What are the top 10 genre tags from releases in the 1970s?
SELECT

tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_year BETWEEN 1970 AND 1979
GROUP BY tag
ORDER BY nbr DESC
LIMIT 10;



--What was the most popular subgenre of rock in 1994?
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


--What was the most popular album tag in 2000?
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



--For each decade from the 1960s through the 2010s, show the single most common genre tag and how many releases had it.
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