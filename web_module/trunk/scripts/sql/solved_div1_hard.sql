SELECT coder_id as user_id, CURRENT as earned_date
FROM coder_level
WHERE level_id = 3
AND division_id = 1
AND algo_rating_type_id = 1
GROUP BY coder_id
