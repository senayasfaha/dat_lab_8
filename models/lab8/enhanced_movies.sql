WITH movies AS (
    SELECT * FROM {{ ref('stg_movies') }}
),
popularity AS (
    SELECT * FROM {{ ref('movie_popularity') }}
)
SELECT 
    movies.movie_id,
    movies.title,
    movies.genre,
    movies.release_year,
    movies.runtime_minutes,
    COALESCE(popularity.view_count, 0) AS view_count,
    COALESCE(popularity.like_count, 0) AS like_count,
    COALESCE(popularity.avg_rating, 0) AS avg_rating
FROM movies
LEFT JOIN popularity ON movies.movie_id = popularity.movie_id