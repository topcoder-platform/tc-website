SELECT COUNT(*) AS currently_at
FROM jivemessage
WHERE userid = @userId
