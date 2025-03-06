WITH raw_activity AS (
    SELECT user_id, movie_id, action, rating, timestamp
    FROM {{ source('public', 'user_activity') }}
)
SELECT * FROM raw_activity