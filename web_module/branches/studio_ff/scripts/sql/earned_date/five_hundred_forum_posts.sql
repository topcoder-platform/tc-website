SELECT SKIP 499 LIMIT 1
extend(dbinfo("UTC_TO_DATETIME", creationdate/1000), year to fraction) AS earned_date
FROM jive:jivemessage
WHERE userid = @userId
ORDER BY creationdate DESC
