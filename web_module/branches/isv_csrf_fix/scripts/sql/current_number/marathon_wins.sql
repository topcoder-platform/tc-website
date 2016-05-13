SELECT COUNT(*) AS currently_at
FROM long_comp_result lcr
    , round r
WHERE placed = 1
AND lcr.round_id = r.round_id
AND r.round_type_id in (13, 19)
WHERE coder_id = @userId

