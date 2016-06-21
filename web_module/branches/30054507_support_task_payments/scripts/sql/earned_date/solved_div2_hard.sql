SELECT min(cp.submit_time) AS earned_date
  FROM coder_problem cp, round r
  WHERE cp.round_id = r.round_id
    AND r.round_type_id IN (1,2,10)
    AND cp.final_points > 0
    AND cp.level_id=3
    AND cp.division_id=2
    AND cp.coder_id = @userId

