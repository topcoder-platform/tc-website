SELECT COUNT(*) AS currently_at
FROM algo_rating_history 
WHERE algo_rating_type_id=3
AND rating >= 3000
AND coder_id = @userId

