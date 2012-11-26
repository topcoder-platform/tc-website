SELECT coder_id as user_id, CURRENT as earned_date
FROM coder_level
WHERE level_id = 3
AND problems_correct > 0
AND division_id = 2
AND algo_rating_type_id = 1
GROUP BY coder_id
