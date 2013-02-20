SELECT SKIP 199 LIMIT 1
extend(dbinfo("UTC_TO_DATETIME",cp.submit_time/1000), year to fraction) AS earned_date
  FROM coder_problem cp, round r
  WHERE cp.round_id = r.round_id
    AND r.round_type_id IN (1,2,10)
    AND cp.final_points > 0
    AND cp.coder_id = @userId
ORDER BY cp.submit_time DESC
