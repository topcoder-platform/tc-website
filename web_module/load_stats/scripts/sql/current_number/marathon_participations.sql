SELECT COUNT(*) AS currently_at
  FROM long_comp_result lcr
     , round r
 WHERE lcr.round_id = r.round_id
   AND lcr.attended = 'Y'
WHERE lcr.coder_id = @userId

