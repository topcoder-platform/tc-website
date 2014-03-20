SELECT COUNT(*) AS currently_at
  FROM round r
     , room_result rr
 WHERE r.round_id = rr.round_id
   AND r.round_type_id IN (1,2,10,20)
   AND rr.attended='Y'
   AND r.rated_ind=1
WHERE rr.coder_id = @userId

