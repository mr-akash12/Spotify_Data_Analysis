-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);


-- EDA -- 
select * from spotify 
limit 2;


select count(*) from spotify;

select count(DISTINCT artist) from spotify; -- 2074 artist--

select DISTINCT album_type from spotify;


select max( duration_min) as maxium from spotify;


select min( duration_min) as maxium from spotify;


-- lets delte thiscoulmn where min duration 0 

delete from spotify
where duration_min=0;

select count(* ) from spotify;

--*
-----------------------------------
-- DATA ANALYS  EASY CATEGORY

-------------------------------

--Easy Level
--Retrieve the names of all tracks that have more than 1 billion streams.
--List all albums along with their respective artists.
--Get the total number of comments for tracks where licensed = TRUE.
--Find all tracks that belong to the album type single.
--Count the total number of tracks by each artist.

--Q1:- Retrieve the names of all tracks that have more than 1 billion streams.
select * from spotify
where stream >1000000000 ; -- 385 stream who has 1 b 



-- Q2:List all albums along with their respective artists.

  select album ,artist from spotify 
  group by  album ,artist;

  --Q3---Get the total number of comments for tracks where licensed = TRUE.

  SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;


-- Q4---Find all tracks that belong to the album type single.
select * from spotify;
select track  from spotify 
where album_type ='single';


--Q5---Count the total number of tracks by each artist.

select artist ,count(*) as total_no_track
from spotify
group by artist ;


/*---------------------
---Medium Level----
-----------------
Calculate the average danceability of tracks in each album.
Find the top 5 tracks with the highest energy values.
List all tracks along with their views and likes where official_video = TRUE.
For each album, calculate the total views of all associated tracks.
Retrieve the track names that have been streamed on Spotify more than YouTube.
*/

--Q6:-Calculate the average danceability of tracks in each album.
select * from spotify;

select album ,avg(danceability ) as avg_danceability  from spotify
group by album ;

--Q7:-Find the top 5 tracks with the highest energy values
select track, avg(energy) as highest_energy 
from spotify 
group by 1
order by highest_energy 
limit 5;


--Q8:-List all tracks along with their views and likes where official_video = TRUE.
  select track ,sum(views) as total_views,
  sum(likes) as total_likes  from spotify
  where official_video = TRUE
  group by 1 

 --9:-For each album, calculate the total views of all associated tracks.
 select album,track ,
 sum(views) as total_views from spotify 
 group by album ,track;


 -- 10:-Retrieve the track names that have been streamed on Spotify more than YouTube.

  
SELECT * 
FROM (
    SELECT 
        track,
        COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) AS streamed_on_youtube,
        COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) AS streamed_on_spotify
    FROM spotify
    GROUP BY track
) AS mq
WHERE streamed_on_spotify > streamed_on_youtube 
    and streamed_on_youtube <>0;



	/*------------------------------------------------------------------
	Advanced Level

-------------------------------------------------------------------------
Find the top 3 most-viewed tracks for each artist using window functions.
Write a query to find tracks where the liveness score is above the average.
Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
-----------------------------------------------------------------------------*/

--Q11:-Find the top 3 most-viewed tracks for each artist using window functions.

SELECT *
FROM (
    SELECT 
        track,
        artist,
        stream,
      
		DENSE_RANK() OVER (PARTITION BY artist ORDER BY stream DESC) AS Ranked
    FROM spotify
) AS ranked
WHERE Ranked<= 3;

--Q12:-Write a query to find tracks where the liveness score is above the average.

select * from spotify 
where liveness >(
select avg(liveness) from spotify);

--Q13:-Use a WITH clause to calculate the difference between the highestand lowest energy values for tracks in each album.

with cte 
as ( 
select album,max(energy) as maxium_energy ,
min(energy) as min_energy 
from spotify 
group by album )select album ,
(maxium_energy-min_energy) as diff_energy 
from cte  
order by 2 desc ;


-- Query Optimization--


EXPLAIN ANALYZE -- Et:-3.821ms  pt:-0.497ms
SELECT 
  artist,
  track,
  views
FROM spotify
WHERE artist = 'Gorillaz'
  AND most_played_on = 'Youtube'
ORDER BY stream DESC
LIMIT 25;

create index artist_index on spotify(artist);
