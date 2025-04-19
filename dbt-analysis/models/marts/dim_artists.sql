{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

WITH artist_stats AS (
  SELECT
    primary_artist,  -- This matches your staging table's column name
    COUNT(DISTINCT track_id) AS track_count,
    AVG(popularity_score) AS avg_popularity,
    AVG(danceability) AS avg_danceability
  FROM {{ ref('stg_spotify_tracks') }}
  GROUP BY 1
)

SELECT
  primary_artist,  -- Changed from artist_name to primary_artist
  track_count,
  avg_popularity,
  avg_danceability,
  CASE
    WHEN track_count >= 20 THEN 'Prolific'
    WHEN track_count >= 10 THEN 'Active'
    ELSE 'Emerging'
  END AS artist_category
FROM artist_stats