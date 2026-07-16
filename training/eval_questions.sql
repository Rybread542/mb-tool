--[exact] How many albums did Pink Floyd release?
SELECT

COUNT(*)

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_type = array['Album']
AND artist.name_search = 'pinkfloyd';


--[exact] List every Radiohead studio album by release year.
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
AND artist.name_search = 'radiohead'
 
ORDER BY album.release_year;

--[exact] What is the longest Tool album by total runtime?
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
    AND album.release_year IS NOT NULL 
    AND artist.name_search = 'tool'
    
    GROUP BY album.title, artist.name, album.release_year
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


--[shape] Which 5 jazz artists released the most albums in the 1990s?
SELECT

artist.name AS artist_name,
COUNT(*) as nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND album.release_year BETWEEN 1990 AND 1999

GROUP BY artist_name
ORDER BY COUNT(*) DESC
LIMIT 5;

--[exact] How many tracks are on the canonical edition of Kid A?
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
AND album.title_search = 'kida'
AND artist.name_search = 'radiohead';

--[shape] Find me 10 obscure Krautrock albums.
SELECT

album.gid,
album.title AS album_title,
artist.name AS artist_name,
album.release_year AS released,
album.cleaned_tags AS tags

FROM 
album

JOIN artist_credit ac ON
album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['krautrock']
ORDER BY RANDOM()

LIMIT 10;

--[exact] Which artist has released the most live albums?
SELECT

artist.name AS artist_name,
COUNT(*) AS nbr

FROM album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Live']

GROUP BY artist.name
ORDER BY COUNT(*) DESC
LIMIT 1;

--[shape] List 5 French rappers active in the 2000s
WITH album_counts AS (
        SELECT
        artist.name AS artist_name,
        COUNT(*) AS nbr,
        artist.cleaned_tags AS tags
        
        FROM album
        
        JOIN artist_credit ac
        ON album.artist_credit = ac.id
        
        JOIN artist
        ON ac.artist_id = artist.id
        
        WHERE artist.cleaned_tags IS NOT NULL
        AND artist.name NOT IN ('Various Artists', '[unknown]')
        AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rap%')
        AND artist.nationality = 'France'
        AND album.release_year BETWEEN 2000 AND 2009
        GROUP BY artist.name, artist.cleaned_tags
)

SELECT

album_counts.artist_name,
album_counts.tags

FROM album_counts

WHERE album_counts.nbr > 0
ORDER BY RANDOM()
LIMIT 5;


--[exact] What was the most common genre tag for albums released in 1985?
SELECT
tag,
COUNT(*) AS nbr

FROM album, unnest(album.cleaned_tags) AS tag

WHERE album.cleaned_tags IS NOT NULL
AND album.release_type = array['Album']
AND album.release_year = 1985

GROUP BY tag
ORDER BY COUNT(*) DESC
LIMIT 1;

--[exact] What is the average track duration on OK Computer, and how many tracks are on it?
WITH avg_album_ms AS(
    SELECT
    
    COUNT(*) AS nbr,
    ROUND(AVG(track.duration)) AS ms
    
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
    AND album.title_search = 'okcomputer'
    AND artist.name_search = 'radiohead'
)

SELECT

(ms / 60000)::int || ':' ||
       lpad(((ms % 60000) / 1000)::int::text, 2, '0') AS avg_duration,
       nbr AS tracks_count
  
  FROM avg_album_ms;

--[shape] Find me some metal albums with the word "Dog" in the title.
SELECT

album.gid,
album.title AS album_title,
artist.name AS artist_name,
album.release_year AS released,
album.cleaned_tags AS tags

FROM 

album

JOIN artist_credit ac
ON album.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album'] 
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.title_search LIKE '%dog%'

ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;

--[shape] Find me some folk rock songs with either banana, orange, or lemon in the title.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
(track.duration / 60000) || ':' || 
  lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['folk rock']
AND (track.title_search LIKE '%banana%' 
    OR track.title_search LIKE '%orange%'
    OR track.title_search LIKE '%lemon%')
    
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--[shape] Recommend me some deep house EPs.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_year BETWEEN 2000 AND 2009
AND album.cleaned_tags IS NOT NULL
AND album.cleaned_tags && array['deep house']
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['EP']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;

--[shape] Show me some chamber pop songs that have really long titles.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
(track.duration / 60000) || ':' ||
  lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration,
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
AND album.cleaned_tags && array['chamber pop']
AND LENGTH(track.title_search) > 30
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;

--[shape] Recommend me some 2000s trance EPs.
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
album.cleaned_tags AS tags

FROM album

JOIN artist_credit ac
ON ac.id = album.artist_credit

JOIN artist
ON ac.artist_id = artist.id

WHERE album.release_year BETWEEN 2000 AND 2009
AND album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
AND album.release_type && array['EP']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;


--[shape] Find 10 songs with a duration ending in 33 seconds, for example 3:33
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
(track.duration / 60000) || ':' ||
  lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration,
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

WHERE
album.cleaned_tags IS NOT NULL
AND track.duration % 60000 = 33000
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;

--[shape] Show me ten korean shoegaze tracks.
SELECT

album.gid,
track.title AS track_title,
artist.name AS artist_name,
album.title AS album_title,
album.release_year AS released,
(track.duration / 60000) || ':' ||
  lpad(((track.duration % 60000) / 1000)::text, 2, '0') AS duration,
album.cleaned_tags AS tags

FROM track

JOIN artist_credit ac
ON track.artist_credit = ac.id

JOIN artist
ON ac.artist_id = artist.id

JOIN album_variations av
ON track.album_id = av.id AND av.is_canonical

JOIN album
ON av.album_group = album.id


WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['shoegaze']
AND artist.nationality = 'South Korea'
ORDER BY RANDOM() * (album.variation_count + 1)
LIMIT 10;