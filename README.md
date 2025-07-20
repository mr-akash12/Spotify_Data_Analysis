# 🎧 Spotify Advanced SQL Analysis & Optimization Project

## 📌 Overview

This project involves analyzing a Spotify dataset containing various attributes about tracks, albums, and artists using **PostgreSQL**. The project covers the complete process from **data normalization**, **querying at multiple difficulty levels**, to **query optimization**. The primary goal is to practice advanced SQL skills and derive meaningful insights from the dataset.

---

## 📂 Dataset Structure

The dataset contains the following key attributes:

- `artist`: Name of the performer
- `track`: Track name
- `album`: Album title
- `album_type`: Type of album (e.g., "single", "album")
- Track metrics: `danceability`, `energy`, `loudness`, `tempo`, etc.
- Streaming & Engagement Metrics: `views`, `likes`, `comments`, `streams`
- Boolean flags: `licensed`, `official_video`

---

## 🧭 Project Workflow

### 1. Data Exploration
Understanding all attributes and types to identify how they relate to each other.

### 2. Table Creation

```sql
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


Project Steps
1. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:

Artist: The performer of the track.
Track: The name of the song.
Album: The album to which the track belongs.
Album_type: The type of album (e.g., single or album).
Various metrics such as danceability, energy, loudness, tempo, and more.

4. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into easy, medium, and advanced levels to help progressively develop SQL proficiency.

Easy Queries
Simple data retrieval, filtering, and basic aggregations.
Medium Queries
More complex queries involving grouping, aggregation functions, and joins.
Advanced Queries
Nested subqueries, window functions, CTEs, and performance optimization.
5. Query Optimization
In advanced stages, the focus shifts to improving query performance. Some optimization strategies include:

Indexing: Adding indexes on frequently queried columns.
Query Execution Plan: Using EXPLAIN ANALYZE to review and refine query performance.
15 Practice Questions
Easy Level
Retrieve the names of all tracks that have more than 1 billion streams.
List all albums along with their respective artists.
Get the total number of comments for tracks where licensed = TRUE.
Find all tracks that belong to the album type single.
Count the total number of tracks by each artist.
Medium Level
Calculate the average danceability of tracks in each album.
Find the top 5 tracks with the highest energy values.
List all tracks along with their views and likes where official_video = TRUE.
For each album, calculate the total views of all associated tracks.
Retrieve the track names that have been streamed on Spotify more than YouTube.
Advanced Level
Find the top 3 most-viewed tracks for each artist using window functions.
Write a query to find tracks where the liveness score is above the average.
Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH cte
AS
(SELECT 
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM spotify
GROUP BY 1
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC
Find tracks where the energy-to-liveness ratio is greater than 1.2.
Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
Here’s an updated section for your Spotify Advanced SQL Project and Query Optimization README, focusing on the query optimization task you performed. You can include the specific screenshots and graphs as described.

Query Optimization Technique
To improve query performance, we carried out the following optimization process:

Initial Query Performance Analysis Using EXPLAIN

We began by analyzing the performance of a query using the EXPLAIN function.
The query retrieved tracks based on the artist column, and the performance metrics were as follows:
Execution time (E.T.): 7 ms
Planning time (P.T.): 0.17 ms
Below is the screenshot of the EXPLAIN result before optimization: EXPLAIN Before Index
Index Creation on the artist Column

To optimize the query performance, we created an index on the artist column. This ensures faster retrieval of rows where the artist is queried.
SQL command for creating the index:
CREATE INDEX idx_artist ON spotify_tracks(artist);
Performance Analysis After Index Creation

After creating the index, we ran the same query again and observed significant improvements in performance:
Execution time (E.T.): 0.153 ms
Planning time (P.T.): 0.152 ms
Below is the screenshot of the EXPLAIN result after index creation: EXPLAIN After Index
Graphical Performance Comparison

A graph illustrating the comparison between the initial query execution time and the optimized query execution time after index creation.
Graph view shows the significant drop in both execution and planning times: Performance Graph Performance Graph Performance Graph
This optimization shows how indexing can drastically reduce query time, improving the overall performance of our database operations in the Spotify project.
Technology Stack
Database: PostgreSQL
SQL Queries: DDL, DML, Aggregations, Joins, Subqueries, Window Functions
Tools: pgAdmin 4 (or any SQL editor), PostgreSQL (via Homebrew, Docker, or direct installation)
How to Run the Project
Install PostgreSQL and pgAdmin (if not already installed).
Set up the database schema and tables using the provided normalization structure.
Insert the sample data into the respective tables.
Execute SQL queries to solve the listed problems.
Explore query optimization techniques for large datasets.
Next Steps
Visualize the Data: Use a data visualization tool like Tableau or Power BI to create dashboards based on the query results.
Expand Dataset: Add more rows to the dataset for broader analysis and scalability testing.
Advanced Querying: Dive deeper into query optimization and explore the performance of SQL queries on larger datasets.
Contributing
If you would like to contribute to this project, feel free to fork the repository, submit pull requests, or raise issues.

License
This project is licensed under the MIT License.



