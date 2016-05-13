SELECT coder_id as user_id, CURRENT AS earned_date
  FROM coder_level
  WHERE algo_rating_type_id = 1
GROUP BY coder_id
HAVING SUM(challenges_made_successful) >= 25
