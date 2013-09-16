SELECT lcr.coder_id as user_id, CURRENT as earned_date
  FROM long_comp_result lcr
     , round r
 WHERE lcr.round_id = r.round_id
   AND lcr.attended = 'Y'
GROUP BY lcr.coder_id
HAVING COUNT(*) >= 50
