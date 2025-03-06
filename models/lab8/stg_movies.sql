WITH raw_movies AS (
    SELECT movie_id, title, genre, release_year, runtime_minutes
    FROM {{ source('public', 'movies') }}
)
SELECT * FROM raw_movies