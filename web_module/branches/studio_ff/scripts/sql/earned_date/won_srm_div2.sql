select min(c.date) as earned_date
  from division_winners dw, calendar c
 where dw.calendar_id = c.calendar_id
   and division_id = 2
   and round_type_id = 1
   and coder_id = @userId
