WITH activity_counts AS (
    SELECT 
        movie_id,
        COUNT(CASE WHEN action = 'viewed' THEN 1 END) AS view_count,
        COUNT(CASE WHEN action = 'liked' THEN 1 END) AS like_count,
        AVG(CASE WHEN action = 'rated' THEN rating END) AS avg_rating
    FROM {{ ref('stg_user_activity') }}
    GROUP BY movie_id
)
SELECT * FROM activity_counts