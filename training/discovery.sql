------------------------------------------------------------------------
-- REFUSALS: Deny all schema modification and irrelevant questions
-- Output: REFUSE
------------------------------------------------------------------------

--Drop all rows from the artist table where artist.name_search = 'x'.
REFUSE

--Drop the album_variations table.
REFUSE

--Delete the database.
REFUSE

--Add an 'alternative rock' tag to all albums in the database.
REFUSE

--Write a python function that removes a certain substring from a string.
REFUSE

--Give me a recipe for chocolate chip cookies.
REFUSE

--How do I use order by in SQL
REFUSE

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--##############################################
-- ARTIST QUERIES
-- Output: artist rows (artist_name, gid, tags)
--##############################################
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--------
--------
--------
--------
--------
--------
--------

--------------------default artist shape
--artist
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 1;

--group
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 1;

--pick an artist
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 1;

--any artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 10;

--find aritst
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 1;

--random artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 10;

--surprise me with some artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
ORDER BY RANDOM()
LIMIT 10;




--------------------------------------------- [artist] single genre




--hip hop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
ORDER BY RANDOM()
LIMIT 10;

--hip hop groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
ORDER BY RANDOM()
LIMIT 10;


--folk singers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
ORDER BY RANDOM()
LIMIT 10;


--folk rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['folk rock']
ORDER BY RANDOM()
LIMIT 10;

--prog rock groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['progressive rock']
ORDER BY RANDOM()
LIMIT 10;

--progressive rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['progressive rock']
ORDER BY RANDOM()
LIMIT 10;

--nu jazz artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['nu jazz']
ORDER BY RANDOM()
LIMIT 10;

--kpop groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['k-pop']
ORDER BY RANDOM()
LIMIT 10;

--kpop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['k-pop']
ORDER BY RANDOM()
LIMIT 10;


--indie artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%indie%')
ORDER BY RANDOM()
LIMIT 10;

--indie bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%indie%')
ORDER BY RANDOM()
LIMIT 10;

--indie rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie rock']
ORDER BY RANDOM()
LIMIT 10;

--indie pop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie pop']
ORDER BY RANDOM()
LIMIT 10;

--rappers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['rap']
ORDER BY RANDOM()
LIMIT 10;

--gangster rap artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['gangster rap']
ORDER BY RANDOM()
LIMIT 10;


--synthwave artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['synthwave']
ORDER BY RANDOM()
LIMIT 10;

--synthpop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['synth-pop']
ORDER BY RANDOM()
LIMIT 10;


--vaporwave artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['vaporwave']
ORDER BY RANDOM()
LIMIT 10;

--house DJs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--edm DJs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--edm artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--edm musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--dnb djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['drum and bass']
ORDER BY RANDOM()
LIMIT 10;

--drum and bass djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['drum and bass']
ORDER BY RANDOM()
LIMIT 10;

--composers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%composer%')
ORDER BY RANDOM()
LIMIT 10;

--classical artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%classical%')
ORDER BY RANDOM()
LIMIT 10;

--house artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--house djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--deep house artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['deep house']
ORDER BY RANDOM()
LIMIT 10;

--deep house djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['deep house']
ORDER BY RANDOM()
LIMIT 10;


--trance artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%trance%')
ORDER BY RANDOM()
LIMIT 10;


--hard rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['hard rock']
ORDER BY RANDOM()
LIMIT 10;

--hard rock musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['hard rock']
ORDER BY RANDOM()
LIMIT 10;

--rock musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;


--rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;

--post rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['post-rock']
ORDER BY RANDOM()
LIMIT 10;

--post rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['post-rock']
ORDER BY RANDOM()
LIMIT 10;

--dub artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['dub']
ORDER BY RANDOM()
LIMIT 10;

--dubstep artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['dubstep']
ORDER BY RANDOM()
LIMIT 10;

--jazz musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
ORDER BY RANDOM()
LIMIT 10;

--jazz artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
ORDER BY RANDOM()
LIMIT 10;


--downtempo artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['downtempo']
ORDER BY RANDOM()
LIMIT 10;

--idm artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;

--idm djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;


--------------------------------- [artist] nationality




--artists from scotland
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;

--scottish artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;


--scottish musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;

--scottish groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;

--korean artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'South Korea'
ORDER BY RANDOM()
LIMIT 10;

--artists from korea
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'South Korea'
ORDER BY RANDOM()
LIMIT 10;

--musicians from korea
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'South Korea'
ORDER BY RANDOM()
LIMIT 10;

--british bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'United Kingdom'
ORDER BY RANDOM()
LIMIT 10;

--artists from the uk
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'United Kingdom'
ORDER BY RANDOM()
LIMIT 10;

--musicians from paris
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Paris'
ORDER BY RANDOM()
LIMIT 10;

--french artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--french artists from paris
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Paris'
ORDER BY RANDOM()
LIMIT 10;

--artists from france
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--artists from america
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'United States'
ORDER BY RANDOM()
LIMIT 10;

--american artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'United States'
ORDER BY RANDOM()
LIMIT 10;

--mexican musicians
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Mexico'
ORDER BY RANDOM()
LIMIT 10;

--groups from mexico
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Mexico'
ORDER BY RANDOM()
LIMIT 10;

--norwegian bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Norway'
ORDER BY RANDOM()
LIMIT 10;

--norwegian artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality = 'Norway'
ORDER BY RANDOM()
LIMIT 10;

--scandinavian bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--artists from scandinavia
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;






------------------------------------- [artist] time period/decade




--80s bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--musicians active in the 80s
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--musicians from the 80s
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--80s artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--artists from 1992
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year = 1992
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--groups from 1992
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year = 1992
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--modern artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--newer artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--recent artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--artists from the past few years
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--classic artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1950 AND 2000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--older artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1950 AND 2000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;





-------------------------------------------[artist] track or album duration





--artists with albums shorter than 45 minutes
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.duration <= 2700000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--artists with albums longer than 45 minutes
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.duration >= 2700000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--artists with an album longer than an hour and a half
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id


WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.duration >= 5400000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--artists with average track length of at least 7 minutes
WITH artist_avg AS (

    SELECT
    artist.gid,
    artist.name AS artist_name,
    ROUND(AVG(track.duration)) AS ms,
    artist.cleaned_tags AS tags

    FROM artist

    JOIN artist_credit ac
    ON ac.artist_id = artist.id

    JOIN album
    ON album.artist_credit = ac.id

    JOIN album_variations av
    ON album.id = av.album_group

    JOIN track
    ON av.id = track.album_id AND av.is_canonical

    WHERE artist.cleaned_tags IS NOT NULL
    AND artist.name NOT IN ('Various Artists', '[unknown]')
    AND album.release_type = array['Album']

    GROUP BY artist.name, artist.gid, artist.cleaned_tags
    HAVING AVG(track.duration) >= 420000
)

SELECT
      gid,
      artist_name,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration,
      tags

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;

--artists with average song length of more than 7 minutes
WITH artist_avg AS (

    SELECT
    artist.gid,
    artist.name AS artist_name,
    ROUND(AVG(track.duration)) AS ms,
    artist.cleaned_tags AS tags

    FROM artist

    JOIN artist_credit ac
    ON ac.artist_id = artist.id

    JOIN album
    ON album.artist_credit = ac.id

    JOIN album_variations av
    ON album.id = av.album_group

    JOIN track
    ON av.id = track.album_id AND av.is_canonical

    WHERE artist.cleaned_tags IS NOT NULL
    AND artist.name NOT IN ('Various Artists', '[unknown]')
    AND album.release_type = array['Album']

    GROUP BY artist.name, artist.gid, artist.cleaned_tags
    HAVING AVG(track.duration) >= 420000
)

SELECT
      gid,
      artist_name,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration,
      tags

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;

--artists with average album length of at least 67 minutes
WITH artist_avg AS (

    SELECT
    artist.gid,
    artist.name AS artist_name,
    ROUND(AVG(album.duration)) AS ms,
    artist.cleaned_tags AS tags

    FROM artist

    JOIN artist_credit ac
    ON ac.artist_id = artist.id

    JOIN album
    ON album.artist_credit = ac.id

    WHERE artist.cleaned_tags IS NOT NULL
    AND artist.name NOT IN ('Various Artists', '[unknown]')
    AND album.release_type = array['Album']

    GROUP BY artist.name, artist.gid, artist.cleaned_tags
    HAVING AVG(album.duration) >= 4020000
)

SELECT
      gid,
      artist_name,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration,
      tags

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;

--artists with albums at least 67 minutes long on average
WITH artist_avg AS (

    SELECT
    artist.gid,
    artist.name AS artist_name,
    ROUND(AVG(album.duration)) AS ms,
    artist.cleaned_tags AS tags

    FROM artist

    JOIN artist_credit ac
    ON ac.artist_id = artist.id

    JOIN album
    ON album.artist_credit = ac.id

    WHERE artist.cleaned_tags IS NOT NULL
    AND artist.name NOT IN ('Various Artists', '[unknown]')
    AND album.release_type = array['Album']

    GROUP BY artist.name, artist.gid, artist.cleaned_tags
    HAVING AVG(album.duration) >= 4020000
)

SELECT
      gid,
      artist_name,
      ms,
      to_char((ms || ' milliseconds')::interval, 'HH24:MI:SS') AS avg_duration,
      tags

FROM artist_avg
ORDER BY RANDOM()
LIMIT 10;


--70s prog rock bands with albums over an hour long
SELECT
 
artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags
 
FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id
 
WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1970 AND 1979
AND album.duration >= 3600000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;
 
--metal bands with short albums
SELECT
 
artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags
 
FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id
 
WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.duration <= 1800000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;





--------------------------------------------- [artist] name matching





--artists named david
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE 'david%'
ORDER BY RANDOM()
LIMIT 10;

--musicians named david
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE 'david%'
ORDER BY RANDOM()
LIMIT 10;

--singers named elena
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE 'elena%'
ORDER BY RANDOM()
LIMIT 10;

--musicians named elena
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE 'elena%'
ORDER BY RANDOM()
LIMIT 10;

--artists with turtle in the name
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE '%turtle%'
ORDER BY RANDOM()
LIMIT 10;

--bands with turtle in the name
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE '%turtle%'
ORDER BY RANDOM()
LIMIT 10;

--singers named alfonso
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.name_search LIKE 'alfonso%'
ORDER BY RANDOM()
LIMIT 10;





--------------------------------------------------------------[artist] SIMILARITY basic, genre, and genre + time period





--artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--groups like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;


--artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--bands similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--artists for fans of X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--singers like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--singers similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--DJs like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--DJs similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

----------------------------------------------------- [artist] similarity + genre

--jazz artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--jazz artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--soul artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%soul%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--disco groups like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%disco%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--disco artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%disco%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--indie electronic artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie electronic']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--indie electronic artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie electronic']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--metal bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%metal%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--prog metal bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['progressive metal']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--folk groups similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--indie folk artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie folk']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--folk rock bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['folk rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--folk rock artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['folk rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--alt rock artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['alternative rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--art rock bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['art rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--art rock artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['art rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--rock bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;


--edm DJs similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['edm']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;

--electronic DJs similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%electronic%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()

LIMIT 10;



------------------------------------------------------- [artist] similarity genre time period




--90s soul artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%soul%')
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--90s funk artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%funk%')
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--90s funk artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%funk%')
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--70s disco groups like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%disco%')
AND album.release_year BETWEEN 1970 AND 1979
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--modern kpop groups like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['k-pop']
AND album.release_year BETWEEN 2000 AND 2025
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--classic rock bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year BETWEEN 1950 AND 2000
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;


--90s prog metal bands like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['progressive metal']
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--90s indie pop artists like X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['indie pop']
AND album.release_year BETWEEN 1990 AND 1999
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--2000s indie folk artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['indie folk']
AND album.release_year BETWEEN 2000 AND 2010
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;

--40s big band artists similar to X
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND artist.cleaned_tags && array['big band']
AND album.release_year BETWEEN 1940 AND 1949
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()

LIMIT 10;




-------------------------------------------------------
--------------------------------------------------------------------ARTIST STACKING
-------------------------------------------------------


-------------------------- [artist] nationality/genre

--japanese hip hop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--hip hop artists from japan
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--italian folk singers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND artist.nationality = 'Italy'
ORDER BY RANDOM()
LIMIT 10;

--folk singers from italy
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND artist.nationality = 'Italy'
ORDER BY RANDOM()
LIMIT 10;

--norwegian black metal bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['black metal']
AND artist.nationality = 'Norway'
ORDER BY RANDOM()
LIMIT 10;

--norwegian metal bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality = 'Norway'
ORDER BY RANDOM()
LIMIT 10;

--french house DJs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--house artists from france
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;



--------------------------------------- [artist] time period/genre 

--80s hard rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['hard rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--hard rock artists from the 80s
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['hard rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--modern prog rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['progressive rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s country artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--old country artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_type = array['Album']
WHERE album.release_year BETWEEN 1950 AND 2000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--90s rappers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['rap']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1990 AND 1999
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--classic rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1950 AND 2000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--newer pop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--newer experimental artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['experimental']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--recent indie pop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie pop']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--techno DJs from the last few years
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%techno%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--90s house djs
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1990 AND 1999
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2010s house artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%house%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--classic folk singers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1950 AND 2000
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;


--2020s indie artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%indie%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2020s indie groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%indie%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2020s indie rock bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['indie rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2020 AND 2025
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;


--2010s idm artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['idm']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2010s country rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['country rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2010s country artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2010s country singers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2010s country singers
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%country%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2010 AND 2019
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s indie artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%indie%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s power metal bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['power metal']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s death metal bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['death metal']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s metal bands
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s tech house artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['tech house']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--2000s synthpop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['synth-pop']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 2000 AND 2009
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--90s tech house artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['tech house']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1990 AND 1999
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--90s pop rock artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['pop rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1990 AND 1999
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--80s soft rock groups
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['soft rock']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--80s free jazz artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['free jazz']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--80s latin jazz artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['latin jazz']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--80s latin artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%latin%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--70s folk pop artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND artist.cleaned_tags && array['folk pop']
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1970 AND 1979
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

--70s folk artists
SELECT

artist.gid,
artist.name AS artist_name,
artist.cleaned_tags AS tags

FROM artist

JOIN artist_credit ac
ON ac.artist_id = artist.id

JOIN album
ON album.artist_credit = ac.id

WHERE artist.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1970 AND 1979
GROUP BY artist.name, artist.gid, artist.cleaned_tags
ORDER BY RANDOM()
LIMIT 10;

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--##############################################
-- ALBUM QUERIES
-- Output: album rows (gid, artist_name, album_title, released, duration, tags)
--##############################################
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-------
-------
-------
-------
-------
-------
-------
-------


--------------------default album shape and queries

--an album
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
ORDER BY RANDOM()
LIMIT 1;

--any album
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
ORDER BY RANDOM()
LIMIT 1;

--albums
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
ORDER BY RANDOM()
LIMIT 10;

--anything
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
ORDER BY RANDOM()
LIMIT 10;

--something random
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
ORDER BY RANDOM()
LIMIT 10;

--surprise me
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
ORDER BY RANDOM()
LIMIT 10;

--any music
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
ORDER BY RANDOM()
LIMIT 10;

--find music
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
ORDER BY RANDOM()
LIMIT 10;






-------------------------------------------------- [album] single genre

--punk
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
ORDER BY RANDOM()
LIMIT 10;

--electronic
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
ORDER BY RANDOM()
LIMIT 10;

--electronic music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
ORDER BY RANDOM()
LIMIT 10;

--electronic albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
ORDER BY RANDOM()
LIMIT 10;



--electro music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electro%')
ORDER BY RANDOM()
LIMIT 10;

--electro 
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electro%')
ORDER BY RANDOM()
LIMIT 10;

--edm
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
AND album.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--edm albums
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
AND album.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--edm music
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
AND album.cleaned_tags && array['edm']
ORDER BY RANDOM()
LIMIT 10;

--idm music
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
AND album.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;

--idm albums
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
AND album.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;




--instrumental albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
ORDER BY RANDOM()
LIMIT 10;

--instrumental rock albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;

--instrumental jazz albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
ORDER BY RANDOM()
LIMIT 10;

--instrumental prog albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
AND album.cleaned_tags && array['progressive rock']
ORDER BY RANDOM()
LIMIT 10;

--jazz albums
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
ORDER BY RANDOM()
LIMIT 10;

--nu jazz albums
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
AND album.cleaned_tags && array['nu jazz']
ORDER BY RANDOM()
LIMIT 10;

--nu jazz
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
AND album.cleaned_tags && array['nu jazz']
ORDER BY RANDOM()
LIMIT 10;

--nujazz
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
AND album.cleaned_tags && array['nu jazz']
ORDER BY RANDOM()
LIMIT 10;

--numetal
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
AND album.cleaned_tags && array['nu metal']
ORDER BY RANDOM()
LIMIT 10;

--nu metal
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
AND album.cleaned_tags && array['nu metal']
ORDER BY RANDOM()
LIMIT 10;

--psychedelic rock
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
AND album.cleaned_tags && array['psychedelic rock']
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--jazz music
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
ORDER BY RANDOM()
LIMIT 10;

--jazz
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
ORDER BY RANDOM()
LIMIT 10;

--any jazz music
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
ORDER BY RANDOM()
LIMIT 10;


--smooth jazz
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
AND album.cleaned_tags && array['smooth jazz']
ORDER BY RANDOM()
LIMIT 10;

--smooth jazz albums
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
AND album.cleaned_tags && array['smooth jazz']
ORDER BY RANDOM()
LIMIT 10;

--smooth jazz music
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
AND album.cleaned_tags && array['smooth jazz']
ORDER BY RANDOM()
LIMIT 10;

--some smooth jazz
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
AND album.cleaned_tags && array['smooth jazz']
ORDER BY RANDOM()
LIMIT 10;

--r&b
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%r&b%')
ORDER BY RANDOM()
LIMIT 10;

--some synth pop
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
AND album.cleaned_tags && array['synth-pop']
ORDER BY RANDOM()
LIMIT 10;

--synthpop
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
AND album.cleaned_tags && array['synth-pop']
ORDER BY RANDOM()
LIMIT 10;

--synth pop albums
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
AND album.cleaned_tags && array['synth-pop']
ORDER BY RANDOM()
LIMIT 10;

--symphonies
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
AND album.cleaned_tags && array['symphony']
ORDER BY RANDOM()
LIMIT 10;

--symphony
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
AND album.cleaned_tags && array['symphony']
ORDER BY RANDOM()
LIMIT 10;

--orchestral
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
AND album.cleaned_tags && array['orchestral']
ORDER BY RANDOM()
LIMIT 10;

--orchestra music
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
AND album.cleaned_tags && array['orchestral']
ORDER BY RANDOM()
LIMIT 10;

--with an orchestra
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
AND album.cleaned_tags && array['orchestral']
ORDER BY RANDOM()
LIMIT 10;

--film score
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
AND album.cleaned_tags && array['film score']
ORDER BY RANDOM()
LIMIT 10;

--movie soundtracks
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
AND album.cleaned_tags && array['film score']
ORDER BY RANDOM()
LIMIT 10;

--vgm
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
AND album.cleaned_tags && array['vgm']
ORDER BY RANDOM()
LIMIT 10;

--videogame music
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
AND album.cleaned_tags && array['vgm']
ORDER BY RANDOM()
LIMIT 10;

--game music
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
AND album.cleaned_tags && array['vgm']
ORDER BY RANDOM()
LIMIT 10;

--dub music
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
AND album.cleaned_tags && array['dub']
ORDER BY RANDOM()
LIMIT 10;

--dubstep
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
AND album.cleaned_tags && array['dubstep']
ORDER BY RANDOM()
LIMIT 10;

--indie
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%indie%')
ORDER BY RANDOM()
LIMIT 10;

--indie music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%indie%')
ORDER BY RANDOM()
LIMIT 10;

--ambient
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%ambient%')
ORDER BY RANDOM()
LIMIT 10;

--ambient music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%ambient%')
ORDER BY RANDOM()
LIMIT 10;

--indie pop music
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
AND album.cleaned_tags && array['indie pop']
ORDER BY RANDOM()
LIMIT 10;

--indie albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%indie%')
ORDER BY RANDOM()
LIMIT 10;

--death metal albums
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
AND album.cleaned_tags && array['death metal']
ORDER BY RANDOM()
LIMIT 10;

--indie pop albums
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
AND album.cleaned_tags && array['indie pop']
ORDER BY RANDOM()
LIMIT 10;

--chillwave music
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
AND album.cleaned_tags && array['chillwave']
ORDER BY RANDOM()
LIMIT 10;

--rock
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
ORDER BY RANDOM()
LIMIT 10;

--rock music
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
ORDER BY RANDOM()
LIMIT 10;

--rock albums
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
ORDER BY RANDOM()
LIMIT 10;

--pop music
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
ORDER BY RANDOM()
LIMIT 10;

--pop
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
ORDER BY RANDOM()
LIMIT 10;

--pop rock music
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
AND album.cleaned_tags && array['pop rock']
ORDER BY RANDOM()
LIMIT 10;

--pop rock
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
AND album.cleaned_tags && array['pop rock']
ORDER BY RANDOM()
LIMIT 10;

--soft rock
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
AND album.cleaned_tags && array['soft rock']
ORDER BY RANDOM()
LIMIT 10;

--soft rock albums
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
AND album.cleaned_tags && array['soft rock']
ORDER BY RANDOM()
LIMIT 10;

--hard rock albums
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
ORDER BY RANDOM()
LIMIT 10;

--hard rock
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
ORDER BY RANDOM()
LIMIT 10;

--trance
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
ORDER BY RANDOM()
LIMIT 10;

--trance albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
ORDER BY RANDOM()
LIMIT 10;





-------------------------------------------------------------[album] time period




--90s
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s music
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s albums
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--any 90s
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;


--an album from 1995
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
AND album.release_year = 1995
ORDER BY RANDOM()
LIMIT 1;

--albums from 1995
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
AND album.release_year = 1995
ORDER BY RANDOM()
LIMIT 10;

--album 1995
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
AND album.release_year = 1995
ORDER BY RANDOM()
LIMIT 1;

--new music
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--music from the last few years
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--something newer
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--recent music
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--something older
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
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--something classic
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
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--classic music
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
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--anything from the 50s
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
AND album.release_year BETWEEN 1950 AND 1959
ORDER BY RANDOM()
LIMIT 10;

--albums from the 50s
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
AND album.release_year BETWEEN 1950 AND 1959
ORDER BY RANDOM()
LIMIT 10;

--music from before 2000
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
AND album.release_year < 2000
ORDER BY RANDOM()
LIMIT 10;

--aughts albums
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
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--80s music
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
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM()
LIMIT 10;




----------------------------------------------------------------------------[album] release type single/multiple




--EPs
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
ORDER BY RANDOM()
LIMIT 10;

--remixes
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
AND album.release_type && array['Remix']
ORDER BY RANDOM()
LIMIT 10;

--soundtracks
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
ORDER BY RANDOM()
LIMIT 10;

--scores
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
ORDER BY RANDOM()
LIMIT 10;


--demos
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
ORDER BY RANDOM()
LIMIT 10;

--compilations
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
ORDER BY RANDOM()
LIMIT 10;

--dj sets
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
ORDER BY RANDOM()
LIMIT 10;

--dj mixes
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
ORDER BY RANDOM()
LIMIT 10;

--mixes
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
ORDER BY RANDOM()
LIMIT 10;

--sets
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
ORDER BY RANDOM()
LIMIT 10;

--remixes
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
AND album.release_type && array['Remix']
ORDER BY RANDOM()
LIMIT 10;

--singles
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
ORDER BY RANDOM()
LIMIT 10;

--single remixes
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
AND album.release_type @> array['Single', 'Remix']
ORDER BY RANDOM()
LIMIT 10;

--live dj sets
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
AND album.release_type @> array['Live', 'DJ-mix']
ORDER BY RANDOM()
LIMIT 10;

--live albums
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
ORDER BY RANDOM()
LIMIT 10;

--live performances
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
ORDER BY RANDOM()
LIMIT 10;

--live shows
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
ORDER BY RANDOM()
LIMIT 10;

--performances
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
ORDER BY RANDOM()
LIMIT 10;




--------------------------------------------------------------- [album] duration





--long albums
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
AND album.duration >= 3600000

ORDER BY RANDOM()
LIMIT 10;

--short albums
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
AND album.duration <= 1800000

ORDER BY RANDOM()
LIMIT 10;

--albums at least 90 minutes long
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
AND album.duration >= 5400000

ORDER BY RANDOM()
LIMIT 10;

--albums less than 35 minutes long
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
AND album.duration <= 2100000

ORDER BY RANDOM()
LIMIT 10;

--45 minute long albums
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
AND album.duration = 2700000

ORDER BY RANDOM()
LIMIT 10;

--albums between 30 and 40 minutes long
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
AND album.duration BETWEEN 1800000 AND 2400000

ORDER BY RANDOM()
LIMIT 10;






------------------------------------------------------------------[album] language


--albums in french
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
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--french language albums
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
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--albums sung in french
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
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;


--french language music
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
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;


--albums in german
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
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--albums sung in german
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
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--albums with korean vocals
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
AND album.languages && array['Korean']
ORDER BY RANDOM()
LIMIT 10;

--korean language music
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
AND album.languages && array['Korean']
ORDER BY RANDOM()
LIMIT 10;

--korean albums
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
AND (artist.nationality = 'South Korea' OR album.languages && array['Korean'])
ORDER BY RANDOM()
LIMIT 10;



------------------------------------------------------------------ [album] nationality

--albums from korea
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
AND artist.nationality = 'South Korea'
ORDER BY RANDOM()
LIMIT 10;


--music from france
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
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--music by french artists
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
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;


--music from germany
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
AND artist.nationality = 'Germany'
ORDER BY RANDOM()
LIMIT 10;

--albums from germany
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
AND artist.nationality = 'Germany'
ORDER BY RANDOM()
LIMIT 10;



------------------------------------------------------------------ [album] title matching







--albums with sun in the title
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
AND album.title_search LIKE '%sun%'
ORDER BY RANDOM()
LIMIT 10;

--something with sun in the title
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
AND album.title_search LIKE '%sun%'
ORDER BY RANDOM()
LIMIT 10;

--album with a title that starts with moon
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
AND album.title_search LIKE 'moon%'
ORDER BY RANDOM()
LIMIT 1;

--album titles starting with moon
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
AND album.title_search LIKE 'moon%'
ORDER BY RANDOM()
LIMIT 10;

--albums with sun or moon in title
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
AND (album.title_search LIKE '%sun%' OR album.title_search LIKE '%moon%')
ORDER BY RANDOM()
LIMIT 10;

--albums named blue book
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
AND album.title_search = 'bluebook'
ORDER BY RANDOM()
LIMIT 10;








-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------[album] stacking filters
-------------------------------------------------------------------------------





------------------------------------------------------------------------------[album] genre + release type




--house sets
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--house mixes
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--house remixes
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
AND album.release_type && array['Remix']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--idm sets
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
AND album.release_type = array['DJ-mix']
AND album.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;

--idm remixes
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
AND album.release_type = array['Remix']
AND album.cleaned_tags && array['idm']
ORDER BY RANDOM()
LIMIT 10;

--trap remixes
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
AND album.release_type && array['Remix']
AND album.cleaned_tags && array['trap']
ORDER BY RANDOM()
LIMIT 10;

--trap mixes
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
AND album.cleaned_tags && array['trap']
ORDER BY RANDOM()
LIMIT 10;

--downtempo mixes
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
AND album.cleaned_tags && array['trap']
ORDER BY RANDOM()
LIMIT 10;

--downtempo remixes
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
AND album.release_type && array['Remix']
AND album.cleaned_tags && array['trap']
ORDER BY RANDOM()
LIMIT 10;

--live house mixes
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
AND album.release_type @> array['Live', 'DJ-mix']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--live deep house mixes
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
AND album.release_type @> array['Live', 'DJ-mix']
AND album.cleaned_tags && array['deep house']
ORDER BY RANDOM()
LIMIT 10;

--dnb mixes
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
AND album.release_type @> array['DJ-mix']
AND album.cleaned_tags && array['drum and bass]
ORDER BY RANDOM()
LIMIT 10;

--drum and bass mixes
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
AND album.release_type @> array['DJ-mix']
AND album.cleaned_tags && array['drum and bass]
ORDER BY RANDOM()
LIMIT 10;

--drum and bass remixes
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
AND album.release_type @> array['Remix']
AND album.cleaned_tags && array['drum and bass]
ORDER BY RANDOM()
LIMIT 10;

--rap mixtapes
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
AND album.cleaned_tags && array['rap']
ORDER BY RANDOM()
LIMIT 10;


--pop singles
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
ORDER BY RANDOM()
LIMIT 10;

--indie pop singles
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
AND album.cleaned_tags && array['indie pop']
ORDER BY RANDOM()
LIMIT 10;

--pop demos
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
ORDER BY RANDOM()
LIMIT 10;

--albums both indie and rap
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
AND album.cleaned_tags @> array['indie','rap']

ORDER BY RANDOM()
LIMIT 10;

--albums with electronic and rock
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
AND album.cleaned_tags @> array['electronic','rock']

ORDER BY RANDOM()
LIMIT 10;


--albums that have indie pop and synthpop
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
AND album.cleaned_tags @> array['indie pop','synth-pop']
ORDER BY RANDOM()
LIMIT 10;

--metal albums that are not death metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%death metal%')
ORDER BY RANDOM()
LIMIT 10;

--live metal albums that are not death metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%death metal%')
ORDER BY RANDOM()
LIMIT 10;


--remixes that are not trance
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
AND album.release_type && array['Remix']
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
ORDER BY RANDOM()
LIMIT 10;


--jazz albums but no bebop
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
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%bebop%')
ORDER BY RANDOM()
LIMIT 10;


--jazz fusion albums
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
AND album.cleaned_tags && array['jazz fusion']
ORDER BY RANDOM()
LIMIT 10;

--synthwave music no vaporwave
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
AND album.cleaned_tags && array['synthwave']
AND NOT EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%vaporwave%')
ORDER BY RANDOM()
LIMIT 10;





-----------------------------------------------------------[album] duration + genre + nationality + release type






--long jazz albums
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
AND album.duration >= 3600000
ORDER BY RANDOM()
LIMIT 10;
 
--ambient albums longer than 2 hours
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%ambient%')
AND album.duration >= 7200000
ORDER BY RANDOM()
LIMIT 10;
 
--short pop punk albums
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
AND album.cleaned_tags && array['pop punk']
AND album.duration <= 1800000
ORDER BY RANDOM()
LIMIT 10;


--70s prog rock albums over an hour long
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
AND album.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1970 AND 1979
AND album.duration >= 3600000
ORDER BY RANDOM()
LIMIT 10;
 
--90s hip hop albums shorter than an hour
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND album.release_year BETWEEN 1990 AND 1999
AND album.duration <= 3600000
ORDER BY RANDOM()
LIMIT 10;
 
--short soul albums from the 60s
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
AND album.release_year BETWEEN 1960 AND 1969
AND album.duration <= 1800000
ORDER BY RANDOM()
LIMIT 10;


--deep house dj sets at least an hour long
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
AND album.cleaned_tags && array['deep house']
AND album.duration >= 3600000
ORDER BY RANDOM()
LIMIT 10;
 
--live rock albums longer than 90 minutes
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.duration >= 5400000
ORDER BY RANDOM()
LIMIT 10;
 
--short punk EPs
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%punk%')
AND album.duration <= 900000
ORDER BY RANDOM()
LIMIT 10;

--french electronic albums under 40 minutes
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND artist.nationality = 'France'
AND album.duration <= 2400000
ORDER BY RANDOM()
LIMIT 10;
 
--long german techno albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%techno%')
AND artist.nationality = 'Germany'
AND album.duration >= 3600000
ORDER BY RANDOM()
LIMIT 10;



-----------------------------------------------------------[album] time period + genre + release type





--90s rock
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s soft rock
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
AND album.cleaned_tags && array['soft rock']
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s pop rock
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
AND album.cleaned_tags && array['pop rock']
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s indie rock
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
AND album.cleaned_tags && array['indie rock']
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s rock albums
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s rock performances
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--90s pop
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
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--2000s indie pop
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
AND album.cleaned_tags && array['indie pop']
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--2000s downtempo
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
AND album.cleaned_tags && array['downtempo']
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--2000s pop
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
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--2000s pop compilations
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--90s trance mixes
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;


--2000s hip hop mixtapes
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
ORDER BY RANDOM()
LIMIT 10;


--2000s eurobeat eps
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
AND album.cleaned_tags && array['eurobeat']
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;


--classic rock live
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;


--classic prog
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
AND album.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--neo psychedelia
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%psychedelic%')
AND album.release_year BETWEEN 2000 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--psychedelic
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%psychedelic%')
ORDER BY RANDOM()
LIMIT 10;

--classic psychedelic rock
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
AND album.cleaned_tags && array['psychedelic rock']
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--classic psychedelia performances
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%psychedelic%')
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--classic hip hop
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%hip%hop%')
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--80s pop singles
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM()
LIMIT 10;

--modern blues performances
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%blues%')
AND album.release_year BETWEEN 2000 AND 2025
ORDER BY RANDOM()
LIMIT 10;


--2010s trip hop remixes
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
AND album.release_type && array['Remix']
AND album.cleaned_tags && array['trip hop']
AND album.release_year BETWEEN 2010 AND 2019
ORDER BY RANDOM()
LIMIT 10;


--chillhop EPs from the last few years
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
AND album.cleaned_tags && array['chillhop']
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;


--80s new wave singles
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
AND album.cleaned_tags && array['new wave']
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM()
LIMIT 10;

--80s new wave
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
AND album.cleaned_tags && array['new wave']
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM()
LIMIT 10;

--70s prog
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
AND album.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM()
LIMIT 10;

--70s rock
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
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM()
LIMIT 10;

--70s blues rock
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
AND album.cleaned_tags && array['blues rock']
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM()
LIMIT 10;

--70s live blues rock
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
AND album.cleaned_tags && array['blues rock']
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM()
LIMIT 10;

--60s pop
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
AND album.release_year BETWEEN 1960 AND 1969
ORDER BY RANDOM()
LIMIT 10;

--60s pop rock
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
AND album.cleaned_tags && array['pop rock']
AND album.release_year BETWEEN 1960 AND 1969
ORDER BY RANDOM()
LIMIT 10;

--60s hard bop
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
AND album.cleaned_tags && array['hard bop']
AND album.release_year BETWEEN 1960 AND 1969
ORDER BY RANDOM()
LIMIT 10;

--40s jazz
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
AND album.release_year BETWEEN 1940 AND 1949
ORDER BY RANDOM()
LIMIT 10;

--40s big band
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
AND album.cleaned_tags && array['big band']
AND album.release_year BETWEEN 1940 AND 1949
ORDER BY RANDOM()
LIMIT 10;

--40s live big band
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
AND album.cleaned_tags && array['big band']
AND album.release_year BETWEEN 1940 AND 1949
ORDER BY RANDOM()
LIMIT 10;

--50s swing
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
AND album.cleaned_tags && array['swing']
AND album.release_year BETWEEN 1940 AND 1949
ORDER BY RANDOM()
LIMIT 10;

--50s jazz
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
AND album.release_year BETWEEN 1940 AND 1949
ORDER BY RANDOM()
LIMIT 10;



--------------------------------------------------------------[album] nationality/language + genre






--british rap albums
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
AND album.cleaned_tags && array['rap']
AND artist.nationality = 'United Kingdom'
ORDER BY RANDOM()
LIMIT 10;

--rap albums by british artists
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
AND album.cleaned_tags && array['rap']
AND artist.nationality = 'United Kingdom'
ORDER BY RANDOM()
LIMIT 10;




--spanish folk albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--folk albums by spanish artists
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--folk albums by mexican artists
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND artist.nationality = 'Mexico'
ORDER BY RANDOM()
LIMIT 10;

--spanish albums by mexican artists
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
AND artist.nationality = 'Mexico'
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--argentinian albums
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
AND artist.nationality = 'Argentina'
ORDER BY RANDOM()
LIMIT 10;

--argentine salsa albums
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
AND album.cleaned_tags && array['salsa']
AND artist.nationality = 'Argentina'
ORDER BY RANDOM()
LIMIT 10;



--arabic rap albums
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
AND album.cleaned_tags && array['rap']
AND album.languages && array['Arabic']
ORDER BY RANDOM()
LIMIT 10;

--arabic language rap albums
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
AND album.cleaned_tags && array['rap']
AND album.languages && array['Arabic']
ORDER BY RANDOM()
LIMIT 10;

--arabic language rap
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
AND album.cleaned_tags && array['rap']
AND album.languages && array['Arabic']
ORDER BY RANDOM()
LIMIT 10;

--egyptian rap albums
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
AND album.cleaned_tags && array['rap']
AND artist.nationality = 'Egypt'
ORDER BY RANDOM()
LIMIT 10;


--chinese pop albums
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
AND album.languages && array['Chinese']
ORDER BY RANDOM()
LIMIT 10;

--chinese pop
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
AND album.languages && array['Chinese']
ORDER BY RANDOM()
LIMIT 10;

--chinese language pop
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
AND album.languages && array['Chinese']
ORDER BY RANDOM()
LIMIT 10;

--pop by chinese artists
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
AND artist.nationality = 'China'
ORDER BY RANDOM()
LIMIT 10;

--pop from china
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
AND artist.nationality = 'China'
ORDER BY RANDOM()
LIMIT 10;

--pop by taiwanese artists
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
AND artist.nationality = 'Taiwan'
ORDER BY RANDOM()
LIMIT 10;

--japanese rap
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
AND album.cleaned_tags && array['rap']
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;

--japanese rap albums
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
AND album.cleaned_tags && array['rap']
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;

--japanese language rap
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
AND album.cleaned_tags && array['rap']
AND album.languages && array['Japanese']
ORDER BY RANDOM()
LIMIT 10;

--rap albums by japanese artists
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
AND album.cleaned_tags && array['rap']
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--rap from japan
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
AND album.cleaned_tags && array['rap']
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--german metal albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND (artist.nationality = 'Germany' OR album.languages && array['German'])
ORDER BY RANDOM()
LIMIT 10;

--german metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND (artist.nationality = 'Germany' OR album.languages && array['German'])
ORDER BY RANDOM()
LIMIT 10;

--german language metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--metal sung in german
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--swiss indie pop albums
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
AND album.cleaned_tags && array['indie pop']
AND artist.nationality = 'Switzerland'
ORDER BY RANDOM()
LIMIT 10;

--indie pop from switzerland
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
AND album.cleaned_tags && array['indie pop']
AND artist.nationality = 'Switzerland'
ORDER BY RANDOM()
LIMIT 10;

--belgian indie pop albums
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
AND album.cleaned_tags && array['indie pop']
AND artist.nationality = 'Belgium'
ORDER BY RANDOM()
LIMIT 10;

--belgian black metal albums
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
AND album.cleaned_tags && array['black metal']
AND artist.nationality = 'Belgium'
ORDER BY RANDOM()
LIMIT 10;

--black metal from belgium
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
AND album.cleaned_tags && array['black metal']
AND artist.nationality = 'Belgium'
ORDER BY RANDOM()
LIMIT 10;

--austrian indie pop albums
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
AND album.cleaned_tags && array['indie pop']
AND artist.nationality = 'Austria'
ORDER BY RANDOM()
LIMIT 10;

--german language indie pop albums by austrian artists
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
AND album.cleaned_tags && array['indie pop']
AND artist.nationality = 'Austria'
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--french metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND (artist.nationality = 'France' OR album.languages && array['French'])
ORDER BY RANDOM()
LIMIT 10;

--french language metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--french metal albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND (artist.nationality = 'France' OR album.languages && array['French'])
ORDER BY RANDOM()
LIMIT 10;

--french language metal albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--metal albums sung in french
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--metal albums by french artists
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--metal from france
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--black metal from france
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
AND album.cleaned_tags && array['black metal']
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--french canadian pop albums
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
AND artist.nationality IN ('Canada', 'Québec', 'Montréal')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--french canadian electronic albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND artist.nationality IN ('Canada', 'Québec', 'Montréal')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--quebecois pop albums
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
AND artist.nationality = 'Québec'
ORDER BY RANDOM()
LIMIT 10;

--pop albums by quebec artists
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
AND artist.nationality = 'Québec'
ORDER BY RANDOM()
LIMIT 10;


--indie rock albums by dutch artists
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
AND album.cleaned_tags && array['indie rock']
AND artist.nationality = 'Netherlands'
ORDER BY RANDOM()
LIMIT 10;

--indie rock albums from the netherlands
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
AND album.cleaned_tags && array['indie rock']
AND artist.nationality = 'Netherlands'
ORDER BY RANDOM()
LIMIT 10;

--dutch indie rock albums
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
AND album.cleaned_tags && array['indie rock']
AND (artist.nationality = 'Netherlands' OR album.languages && array['Dutch'])
ORDER BY RANDOM()
LIMIT 10;

--dutch language indie house albums
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
AND album.cleaned_tags && array['indie house']
AND album.languages && array['Dutch']
ORDER BY RANDOM()
LIMIT 10;

--portuguese classical music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%classical%')
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--portuguese rock albums
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
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--rock music from portugal
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
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--hard rock music from portugal
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
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--rock albums sung in portuguese
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
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--portuguese language rock albums
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
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--rock in portuguese
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
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--brazilian rock
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
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--rock from brazil
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
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--jazz by brazilian artists
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
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--jazz albums from brazil
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
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--brazilian rock albums
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
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--portuguese language classical music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%classical%')
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--brazilian portuguese classical music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%classical%')
AND artist.nationality = 'Brazil'
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--classical music by portuguese artists
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%classical%')
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--portuguese language rock from portugal
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
AND artist.nationality = 'Portugal'
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;


--shoegaze from japan
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
AND album.cleaned_tags && array['shoegaze']
AND artist.nationality = 'Japan'
ORDER BY RANDOM()
LIMIT 10;

--aussie rock
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
AND artist.nationality = 'Australia'
ORDER BY RANDOM()
LIMIT 10;

--australian rock albums
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
AND artist.nationality = 'Australia'
ORDER BY RANDOM()
LIMIT 10;

--spanish pop
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
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--pop albums sung in spanish
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
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish language pop
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
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--folk in spanish
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish bossa albums
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
AND album.cleaned_tags && array['bossa nova']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--latin music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
ORDER BY RANDOM()
LIMIT 10;

--latin albums from mexico
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Mexico'
ORDER BY RANDOM()
LIMIT 10;

--spanish latin albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--spanish language latin albums
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--latin language albums from italy
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
AND artist.nationality = 'Italy'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--latin language albums by spanish artists
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
AND artist.nationality = 'Spain'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--latin language albums
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
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--scandinavian metal
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--folk from scandinavia
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%folk%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--american punk rock
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
AND album.cleaned_tags && array['punk rock']
AND artist.nationality = 'United States'
ORDER BY RANDOM()
LIMIT 10;

--american punk
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
AND artist.nationality = 'United States'
ORDER BY RANDOM()
LIMIT 10;

--irish pop rock
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
AND album.cleaned_tags && array['pop rock']
AND artist.nationality = 'Ireland'
ORDER BY RANDOM()
LIMIT 10;

--scottish pop rock
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
AND album.cleaned_tags && array['pop rock']
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;

--japanese indie pop albums
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
AND album.cleaned_tags && array['indie pop']
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;

--japanese indie music
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%indie%')
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;

--japanese pop rock albums
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
AND album.cleaned_tags && array['pop rock']
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;

--japanese pop albums
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
AND (artist.nationality = 'Japan' OR album.languages && array['Japanese'])
ORDER BY RANDOM()
LIMIT 10;






--------------------------------------------------------------[album] artist name + genre wordings







--jazz albums by artists named stan
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
ORDER BY RANDOM()
LIMIT 10;

--albums by jazz artists named stan
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
ORDER BY RANDOM()
LIMIT 10;

--jazz albums by jazz artists named stan
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
AND EXISTS (SELECT 1 FROM unnest(artist.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.name_search LIKE 'stan%'
ORDER BY RANDOM()
LIMIT 10;





--------------------------------------------------------------[album] artist similarity basic + genre + release type









--albums similar to X
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--albums like X
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;


--albums for X fans
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--music for X fans
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--music for fans of X
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
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--alt rock albums similar to X
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
AND album.cleaned_tags && array['alternative rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;


--alt rock albums like X
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
AND album.cleaned_tags && array['alternative rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--live albums like X
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
AND album.release_type && array['Live']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--performances like X
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
AND album.release_type && array['Live']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--live dj sets like X
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
AND album.release_type @> array['Live', 'DJ-mix']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--house sets like X
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
AND album.release_type && array['DJ-mix']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--downtempo similar to X
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
AND album.cleaned_tags && array['downtempo']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--indie rock albums similar to X
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
AND album.cleaned_tags && array['indie rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--indie rock albums similar to X
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
AND album.cleaned_tags && array['indie rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--indie rock albums similar to X
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
AND album.cleaned_tags && array['indie rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--psychedelic rock music similar to X
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
AND album.cleaned_tags && array['psychedelic rock']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;











------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--##############################################
-- TRACK QUERIES
-- Output: track rows (gid, track_title, artist_name, album_title, released, duration, tags)
--##############################################
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-------
-------
-------
-------
-------
-------
-------
-------






-------------------------------default track shape


--song
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;

--track
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;

--piece
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;

--any song
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;


--random song
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;


--find a song
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 1;


--songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--any songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--pick random songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--surprise me with songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;










---------------------------------------------------------------------[track] single genre








--rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;

--rock tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;

--metal songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
ORDER BY RANDOM()
LIMIT 10;

--folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--instrumental songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
ORDER BY RANDOM()
LIMIT 10;

--instrumental rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%instrumental%')
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
ORDER BY RANDOM()
LIMIT 10;

--house tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--house songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
ORDER BY RANDOM()
LIMIT 10;

--psychedelic songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%psychedelic%')
ORDER BY RANDOM()
LIMIT 10;

--ambient tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%ambient%')
ORDER BY RANDOM()
LIMIT 10;

--punk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%punk%')
ORDER BY RANDOM()
LIMIT 10;

--trance tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%trance%')
ORDER BY RANDOM()
LIMIT 10;

--folk rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['folk rock']
ORDER BY RANDOM()
LIMIT 10;

--flamenco pieces
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['flamenco']
ORDER BY RANDOM()
LIMIT 10;

--classical pieces
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['classical']
ORDER BY RANDOM()
LIMIT 10;

--orchestral pieces
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['orchestral']
ORDER BY RANDOM()
LIMIT 10;

--deep house tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['deep house']
ORDER BY RANDOM()
LIMIT 10;

--power metal tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['power metal']
ORDER BY RANDOM()
LIMIT 10;


--experimental songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['experimental']
ORDER BY RANDOM()
LIMIT 10;

--nu jazz tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['nu jazz']
ORDER BY RANDOM()
LIMIT 10;

--lounge tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['lounge']
ORDER BY RANDOM()
LIMIT 10;

--drone songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['drone']
ORDER BY RANDOM()
LIMIT 10;

--cool jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['cool jazz']
ORDER BY RANDOM()
LIMIT 10;

--smooth jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['smooth jazz']
ORDER BY RANDOM()
LIMIT 10;




----------------------------------------------------------------------[track] time period






--70s songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1970 AND 1979
ORDER BY RANDOM()
LIMIT 10;


--2010s songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 2010 AND 2019
ORDER BY RANDOM()
LIMIT 10;

--60s songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1960 AND 1969
ORDER BY RANDOM()
LIMIT 10;

--songs from 1984
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year = 1984
ORDER BY RANDOM()
LIMIT 10;

--songs from between 1989 and 2009
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1989 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--new tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--recent tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--old songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1950 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--classic songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1950 AND 2025
ORDER BY RANDOM()
LIMIT 10;







---------------------------------------------------------------[track] nationality/language





--german songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (artist.nationality = 'Germany' OR album.languages && array['German'])
ORDER BY RANDOM()
LIMIT 10;

--german tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (artist.nationality = 'Germany' OR album.languages && array['German'])
ORDER BY RANDOM()
LIMIT 10;

--tracks from germany
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Germany'
ORDER BY RANDOM()
LIMIT 10;

--songs in german
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--songs sung in german
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--german language songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['German']
ORDER BY RANDOM()
LIMIT 10;

--korean tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (artist.nationality = 'South Korea' OR album.languages && array['Korea'])
ORDER BY RANDOM()
LIMIT 10;

--songs from korea
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'South Korea'
ORDER BY RANDOM()
LIMIT 10;

--french canadian songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality IN ('Canada', 'Québec', 'Montréal')
ORDER BY RANDOM()
LIMIT 10;

--songs by italian artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Italy'
ORDER BY RANDOM()
LIMIT 10;

--chinese songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Chinese']
ORDER BY RANDOM()
LIMIT 10;

--songs in chinese
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Chinese']
ORDER BY RANDOM()
LIMIT 10;

--songs by taiwanese artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Taiwan'
ORDER BY RANDOM()
LIMIT 10;

--songs from taiwan
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Taiwan'
ORDER BY RANDOM()
LIMIT 10;

--songs by canadians
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Canada'
ORDER BY RANDOM()
LIMIT 10;

--canadian tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Canada'
ORDER BY RANDOM()
LIMIT 10;

--tracks from canada
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Canada'
ORDER BY RANDOM()
LIMIT 10;







----------------------------------------------------------------[track] duration







--songs longer than 10 minutes
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.duration > 600000
ORDER BY RANDOM()
LIMIT 10;

--songs shorter than 3 minutes
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.duration < 180000
ORDER BY RANDOM()
LIMIT 10;

--short songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.duration < 180000
ORDER BY RANDOM()
LIMIT 10;

--long songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.duration >= 480000
ORDER BY RANDOM()
LIMIT 10;

--tracks between 5 and 7 minutes long
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.duration BETWEEN 300000 AND 420000
ORDER BY RANDOM()
LIMIT 10;







--------------------------------------------------------------[track] release type







--live tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Live']
ORDER BY RANDOM()
LIMIT 10;

--live songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Live']
ORDER BY RANDOM()
LIMIT 10;

--remix tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--soundtrack pieces
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Soundtrack']
ORDER BY RANDOM()
LIMIT 10;







-----------------------------------------------------------------------------------[track] title matching







--songs named 'carolina on my mind'
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
ORDER BY RANDOM()
LIMIT 10;

--songs with 'eye' in the title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.title_search LIKE '%eye%'
ORDER BY RANDOM()
LIMIT 10;

--songs that have 'part 1' or 'part 2' in the title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (track.title_search LIKE '%part1%' OR track.title_search LIKE '%part2%')
ORDER BY RANDOM()
LIMIT 10;

--songs with either 'sun' or 'moon' in title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (track.title_search LIKE '%sun%' OR track.title_search LIKE '%moon%')
ORDER BY RANDOM()
LIMIT 10;

--tracks containing either 'peace' or 'love' in title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND (track.title_search LIKE '%peace%' OR track.title_search LIKE '%love%')
ORDER BY RANDOM()
LIMIT 10;

--song titles beginning with impossible
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.title_search LIKE 'impossible%'
ORDER BY RANDOM()
LIMIT 10;

--song titles that start with impossible
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.title_search LIKE 'impossible%'
ORDER BY RANDOM()
LIMIT 10;

--songs with 'love you' in the title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.title_search LIKE '%loveyou%'
ORDER BY RANDOM()
LIMIT 10;

--songs with the phrase 'you are' in the title
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND track.title_search LIKE '%youare%'
ORDER BY RANDOM()
LIMIT 10;











----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------TRACK STACKING
----------------------------------------------------------------------------------------------







----------------------------------------------------------------------[track] genre + time period + release type





--50s rockabilly songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['rockabilly']
AND album.release_year BETWEEN 1950 AND 1959
ORDER BY RANDOM()
LIMIT 10;

--60s pop songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 1960 AND 1969
ORDER BY RANDOM()
LIMIT 10;

--rock songs from 1974
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year = 1974
ORDER BY RANDOM()
LIMIT 10;

--newer chamber pop songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['chamber pop']
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--modern blues songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%blues%')
AND album.release_year BETWEEN 2000 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--90s r&b songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%r&b%')
AND album.release_year BETWEEN 1990 AND 1999
ORDER BY RANDOM()
LIMIT 10;

--classic r&b tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%r&b%')
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--new rap songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['rap']
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--neo prog songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 2000 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--hard bop songs from the last few years
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['hard bop']
AND album.release_year BETWEEN 2020 AND 2025
ORDER BY RANDOM()
LIMIT 10;

--80s cool jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['cool jazz']
AND album.release_year BETWEEN 1980 AND 1989
ORDER BY RANDOM()
LIMIT 10;

--live pop tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Live']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
ORDER BY RANDOM()
LIMIT 10;

--live indie rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Live']
AND album.cleaned_tags && array['indie rock']
ORDER BY RANDOM()
LIMIT 10;

--2000s electronic remix tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;

--classic rock demo tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Demo']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year BETWEEN 1950 AND 2000
ORDER BY RANDOM()
LIMIT 10;

--2000s alt rock tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['alternative rock']
AND album.release_year BETWEEN 2000 AND 2009
ORDER BY RANDOM()
LIMIT 10;





------------------------------------------------------------------------------[track] nationality + genre





--german symphonic tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['symphonic']
AND (artist.nationality = 'Germany' OR album.languages && array['German'])
ORDER BY RANDOM()
LIMIT 10;

--spanish classical songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['classical']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--classical songs from spain
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['classical']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--classical songs in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['classical']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish language classical songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['classical']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--spanish indie folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie folk']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--indie folk songs from spain
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie folk']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--folk songs in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish language rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--rock songs in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--latin songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
ORDER BY RANDOM()
LIMIT 10;

--songs in latin
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--songs sung in latin
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--italian songs sung in latin
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Italy'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--italian tracks in latin
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Italy'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--latin language songs from italy
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Italy'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--spanish latin songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--spanish language latin songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--songs in latin by spanish artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Spain'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--scandinavian metal songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--metal songs from scandinavia
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--prog metal songs from scandinavia
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND array['progressive metal']
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--indie folk songs from scandinavia
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie folk']
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--american folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'United States'
ORDER BY RANDOM()
LIMIT 10;

--french house tracks
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
AND (artist.nationality = 'France' OR album.languages && array['French'])
ORDER BY RANDOM()
LIMIT 10;

--french electronic songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND (artist.nationality = 'France' OR album.languages && array['French'])
ORDER BY RANDOM()
LIMIT 10;

--electronica songs from france
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['electronica']
AND artist.nationality = 'France'
ORDER BY RANDOM()
LIMIT 10;

--french electronica songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['electronica']
AND (artist.nationality = 'France' OR album.languages && array['French'])
ORDER BY RANDOM()
LIMIT 10;


--french language electronic songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--electronic songs in french
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--electronic songs sung in french
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--french canadian electronic songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND artist.nationality IN ('Canada', 'Québec', 'Montréal')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--french canadian indie rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie rock']
AND artist.nationality IN ('Canada', 'Québec', 'Montréal')
AND album.languages && array['French']
ORDER BY RANDOM()
LIMIT 10;

--quebecois indie rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie rock']
AND artist.nationality IN = 'Québec'
ORDER BY RANDOM()
LIMIT 10;


--indie rock songs from quebec
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['indie rock']
AND artist.nationality IN = 'Québec'
ORDER BY RANDOM()
LIMIT 10;

--dutch electropop songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['electropop']
AND (artist.nationality = 'Netherlands' OR album.languages && array['Dutch'])
ORDER BY RANDOM()
LIMIT 10;

--dutch language electropop songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['electropop']
AND album.languages && array['Dutch']
ORDER BY RANDOM()
LIMIT 10;

--portuguese classical songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%classical%')
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--portuguese pop rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['pop rock']
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--pop rock songs in portuguese
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['pop rock']
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--pop rock songs sung in portuguese
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['pop rock']
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--brazilian alt rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['alternative rock']
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--alt rock songs from brazil
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['alternative rock']
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--jazz songs from brazil
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--jazz songs by brazilian artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.nationality = 'Brazil'
ORDER BY RANDOM()
LIMIT 10;

--portuguese language folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--brazilian portuguese folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Brazil'
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--folk songs by portuguese artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Portugal'
ORDER BY RANDOM()
LIMIT 10;

--portuguese language pop songs by portuguese artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND artist.nationality = 'Portugal'
AND album.languages && array['Portuguese']
ORDER BY RANDOM()
LIMIT 10;

--aussie psych rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Australia'
ORDER BY RANDOM()
LIMIT 10;

--australian psych rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Australia'
ORDER BY RANDOM()
LIMIT 10;

--psych rock tracks from australia
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Australia'
ORDER BY RANDOM()
LIMIT 10;

--spanish art rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['art rock']
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--art rock songs in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['art rock']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--art rock songs in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['art rock']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--art rock songs sung in spanish
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['art rock']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--spanish language art rock songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['art rock']
AND album.languages && array['Spanish']
ORDER BY RANDOM()
LIMIT 10;

--latin language folk songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--folk songs sung in latin
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--latin songs from mexico
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Mexico'
ORDER BY RANDOM()
LIMIT 10;

--colombian latin songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Colombia'
ORDER BY RANDOM()
LIMIT 10;

--latin language songs from france
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'France'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--spanish latin songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%latin%')
AND artist.nationality = 'Spain'
ORDER BY RANDOM()
LIMIT 10;

--latin language songs by spanish artists
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND artist.nationality = 'Spain'
AND album.languages && array['Latin']
ORDER BY RANDOM()
LIMIT 10;

--scandinavian metal songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--metal songs from scandinavia
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%metal%')
AND artist.nationality IN ('Sweden', 'Finland', 'Norway')
ORDER BY RANDOM()
LIMIT 10;

--british jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.nationality = 'United Kingdom'
ORDER BY RANDOM()
LIMIT 10;

--scottish jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.nationality = 'Scotland'
ORDER BY RANDOM()
LIMIT 10;

--irish jazz songs
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND artist.nationality = 'Ireland'
ORDER BY RANDOM()
LIMIT 10;









--------------------------------------------------------------------------------[track] duration + genre + time period + release type








--long doom metal songs
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['doom metal']
AND track.duration >= 480000
ORDER BY RANDOM()
LIMIT 10;
 
--short surf rock songs
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.cleaned_tags && array['surf rock']
AND track.duration < 180000
ORDER BY RANDOM()
LIMIT 10;


--70s prog rock songs over 10 minutes long
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_year BETWEEN 1970 AND 1979
AND track.duration >= 600000
ORDER BY RANDOM()
LIMIT 10;
 
--short pop songs from the 60s
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 1960 AND 1969
AND track.duration < 180000
ORDER BY RANDOM()
LIMIT 10;


--live reggae songs from between 1991 and 1994 that are at least 10 minutes long
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND album.release_type && array['Live']
AND album.cleaned_tags && array['reggae']
AND album.release_year BETWEEN 1991 AND 1994
AND track.duration >= 600000
ORDER BY RANDOM()
LIMIT 10;
 
--90s house remixes longer than 6 minutes
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%house%')
AND album.release_year BETWEEN 1990 AND 1999
AND track.duration >= 360000
ORDER BY RANDOM()
LIMIT 10;



-------------------------------------------------------------------------------[track] duration + nationality + genre

--long japanese ambient tracks
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%ambient%')
AND artist.nationality = 'Japan'
AND track.duration >= 480000
ORDER BY RANDOM()
LIMIT 10;


--------------------------------------------------------------------------------[track] artist similarity + genre + release type + time period






--tracks like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;


--pop tracks like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--songs similar to X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--tracks like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--tracks similar to X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--80s songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.release_year BETWEEN 1980 AND 1989
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--80s pop songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%pop%')
AND album.release_year BETWEEN 1980 AND 1989
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;


--recent electronic songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND album.release_year BETWEEN 2020 AND 2025
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--electronic tracks similar to X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%electronic%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--neo prog songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['progressive rock']
AND album.release_year BETWEEN 2000 AND 2025
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--neo prog metal songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['progressive metal']
AND album.release_year BETWEEN 2000 AND 2025
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--prog metal songs similar to X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND album.cleaned_tags && array['progressive metal']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--live songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Live']
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--live rock songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Live']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--80s live rock songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Live']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%rock%')
AND album.release_year BETWEEN 1980 AND 1989
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--80s live songs like X
SELECT

album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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

JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid

WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type && array['Live']
AND album.release_year BETWEEN 1980 AND 1989
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;

--long songs by artists like X
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
 
JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid
 
WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND track.duration >= 480000
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;
 
--jazz songs over 10 minutes by artists similar to X
SELECT
 
album.gid,
artist.name AS artist_name,
album.title AS album_title,
track.title AS track_title,
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
 
JOIN similar_artist sa
ON artist.gid = sa.similar_artist_mbid
 
WHERE album.cleaned_tags IS NOT NULL
AND artist.name NOT IN ('Various Artists', '[unknown]')
AND album.release_type = array['Album']
AND EXISTS (SELECT 1 FROM unnest(album.cleaned_tags) t WHERE t LIKE '%jazz%')
AND track.duration >= 600000
AND sa.artist_mbid = (SELECT gid FROM artist WHERE artist.name_search = 'x' ORDER BY artist.id ASC LIMIT 1)
ORDER BY RANDOM()
LIMIT 10;