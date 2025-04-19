{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

SELECT
  primary_genre AS genre_name,
  AVG(danceability) AS avg_danceability,
  AVG(energy) AS avg_energy,
  -- Classify genres
  CASE
    WHEN AVG(energy) > 0.7 AND AVG(danceability) > 0.7 THEN 'Energetic & Danceable'
    WHEN AVG(energy) > 0.7 THEN 'High Energy'
    ELSE 'Other'
  END AS energy_profile
FROM {{ ref('stg_spotify_tracks') }}
GROUP BY 1