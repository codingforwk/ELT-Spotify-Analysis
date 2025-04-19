{{
  config(
    materialized='table',
    schema='staging'
  )
}}

-- Explode artist arrays into one row per artist-track pair
WITH exploded_artists AS (
  SELECT
    track_id,
    TRIM(artist) AS artist_name
  FROM {{ source('spotify_dataset', 'spotify_songs') }},
  UNNEST(SPLIT(artists, ';')) AS artist
)

SELECT
  artist_name,
  COUNT(DISTINCT track_id) AS track_count,
  -- Will be joined back to tracks later
  CURRENT_TIMESTAMP() AS processed_at  
FROM exploded_artists
GROUP BY 1