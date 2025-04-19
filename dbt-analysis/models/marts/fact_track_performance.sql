{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

SELECT
  t.track_id,
  t.track_name,
  t.primary_artist,
  t.primary_genre,
  t.popularity_score,
  t.danceability,
  t.energy,
  -- Composite score (adjust weights as needed)
  (0.6 * t.popularity_score) + 
  (0.2 * t.danceability) + 
  (0.2 * t.energy) AS commercial_score,
  -- Add dimension keys
  a.artist_category,
  g.energy_profile AS genre_energy
FROM {{ ref('stg_spotify_tracks') }} t
LEFT JOIN {{ ref('dim_artists') }} a 
  ON t.primary_artist = a.primary_artist
LEFT JOIN {{ ref('dim_genres') }} g 
  ON t.primary_genre = g.genre_name