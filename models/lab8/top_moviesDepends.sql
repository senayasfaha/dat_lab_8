WITH ranked_movies AS (
    SELECT *, 
           RANK() OVER (ORDER BY avg_rating DESC, view_count DESC) AS rank
    FROM {{ ref('enhanced_movies') }}
)
SELECT * FROM ranked_movies WHERE rank <= 3