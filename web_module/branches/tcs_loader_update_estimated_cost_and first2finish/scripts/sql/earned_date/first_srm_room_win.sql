SELECT SKIP 0 LIMIT 1
c.date AS earned_date
  FROM round r
     , room_result rr
     , calendar c
 WHERE r.round_id = rr.round_id
   AND c.calendar_id = r.calendar_id
   AND r.round_type_id IN (1,2,10)
   AND rr.attended='Y'
   AND r.rated_ind=1
   AND rr.room_placed=1
   AND rr.coder_id = @userId
 ORDER BY c.date DESC
