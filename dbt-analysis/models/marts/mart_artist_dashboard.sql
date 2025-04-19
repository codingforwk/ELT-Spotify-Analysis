{{
  config(
    materialized='table',
    schema='analytics'
  )
}}

SELECT
  a.primary_artist,
  a.artist_category,
  COUNT(f.track_id) AS track_count,
  AVG(f.commercial_score) AS avg_commercial_score,
  AVG(f.energy) AS avg_energy
FROM {{ ref('fact_track_performance') }} f
JOIN {{ ref('dim_artists') }} a 
  ON f.primary_artist = a.primary_artist
GROUP BY 1, 2
ORDER BY avg_commercial_score DESC