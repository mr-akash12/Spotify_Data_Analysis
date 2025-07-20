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

