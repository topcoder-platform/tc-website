SELECT min(c.date) as earned_date
  FROM algo_rating_history arh, round r, calendar c
 WHERE algo_rating_type_id=3
   AND arh.round_id=r.round_id
   AND r.calendar_id=c.calendar_id
   AND rating >= 3000
   AND coder_id = @userId
