SELECT SUM(challenges_made_successful) AS currently_at
  FROM coder_level
  WHERE algo_rating_type_id = 1
  AND coder_id = @userId

