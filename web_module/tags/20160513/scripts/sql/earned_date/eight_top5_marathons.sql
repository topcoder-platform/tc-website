SELECT SKIP 7 LIMIT 1
c.date as earned_date
FROM long_comp_result lcr
    , round r
    , calendar c
WHERE placed <= 5
  AND lcr.round_id = r.round_id
  AND c.calendar_id = r.calendar_id
  AND r.round_type_id in (13, 19)
  AND lcr.coder_id = @userId
ORDER BY c.date DESC
