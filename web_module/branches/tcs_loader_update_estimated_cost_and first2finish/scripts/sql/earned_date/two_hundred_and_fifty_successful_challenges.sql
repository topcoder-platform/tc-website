SELECT SKIP 249 LIMIT 1
extend(dbinfo("UTC_TO_DATETIME",c.submit_time/1000), year to fraction) AS earned_date
  FROM challenge c, round r
  WHERE c.round_id = r.round_id
    AND r.round_type_id IN (1,2,10)
    AND c.succeeded = 1
    AND c.challenger_id = @userId
ORDER BY c.submit_time DESC
