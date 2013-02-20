SELECT SKIP 19 LIMIT 1
c.date as earned_date
  FROM long_comp_result lcr
     , round r
     , calendar c
 WHERE lcr.round_id = r.round_id
   AND c.calendar_id = r.calendar_id
   AND lcr.attended = 'Y'
   AND lcr.coder_id = @userId
ORDER BY c.date DESC
