select COUNT(*) AS currently_at
  from division_winners
 where division_id = 2
   and round_type_id = 1
   and coder_id = @userId

