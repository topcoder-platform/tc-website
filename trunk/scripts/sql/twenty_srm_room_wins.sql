SELECT rr.coder_id as user_id, CURRENT AS earned_date
  FROM round r
     , room_result rr
 WHERE r.round_id = rr.round_id
   AND r.round_type_id IN (1,2,10)
   AND rr.attended='Y'
   AND r.rated_ind=1
   AND rr.room_placed=1
GROUP BY rr.coder_id
HAVING COUNT(*) >= 20
