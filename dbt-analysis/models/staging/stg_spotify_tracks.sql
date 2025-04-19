{{
  config(
    materialized='table',
    schema='staging'
  )
}}

SELECT
  -- Identifiers
  track_id,
  -- Clean artist data (extract first artist if multiple)
  TRIM(SPLIT(artists, ';')[OFFSET(0)]) AS primary_artist,
  -- Track metadata
  track_name,
  album_name,
  -- Normalized metrics (0-1 where applicable)
  popularity / 100.0 AS popularity_score,
  SAFE_DIVIDE(duration_ms, 60000) AS duration_minutes,
  -- Audio features
  danceability,
  energy,
  loudness,
  speechiness,
  -- Categorical conversions
  CASE 
    WHEN explicit THEN 'Explicit' 
    ELSE 'Clean' 
  END AS content_rating,
  -- Genre handling
  track_genre AS primary_genre
FROM {{ source('spotify_dataset', 'spotify_songs') }}
WHERE
  track_id IS NOT NULL
  AND popularity IS NOT NULL