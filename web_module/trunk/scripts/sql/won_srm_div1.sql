select coder_id as user_id, CURRENT as date_earned
  from division_winners
 where division_id = 1
   and round_type_id = 1
group by coder_id
