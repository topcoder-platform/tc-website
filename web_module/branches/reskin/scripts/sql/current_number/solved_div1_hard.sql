SELECT SUM(problems_correct) AS currently_at
FROM coder_level
WHERE level_id = 3
AND division_id = 1
AND algo_rating_type_id = 1
AND coder_id = @userId

