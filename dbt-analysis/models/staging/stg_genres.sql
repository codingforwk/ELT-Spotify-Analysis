{{ config(materialized="table", schema="staging") }}

select
    track_genre as genre_name,
    -- Audio feature averages by genre
    avg(danceability) as avg_danceability,
    avg(energy) as avg_energy,
    avg(tempo) as avg_tempo,
    -- Popularity metrics
    avg(popularity) as avg_popularity,
    count(distinct track_id) as track_count
from {{ source("spotify_dataset", "spotify_songs") }}
where track_genre is not null
group by 1
