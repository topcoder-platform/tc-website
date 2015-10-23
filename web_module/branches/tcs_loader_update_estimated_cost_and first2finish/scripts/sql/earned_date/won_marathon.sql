SELECT min(c.date) as earned_date
FROM long_comp_result lcr
    , round r
    , calendar c
WHERE placed = 1
AND c.calendar_id = r.calendar_id
AND lcr.round_id = r.round_id
AND r.round_type_id in (13, 19)
AND coder_id = @userId
