SELECT COUNT(*) AS currently_at
FROM studio_jive:jivemessage AS jm
WHERE jm.userid = @userId

