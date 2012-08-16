SELECT userid::INTEGER AS user_id, CURRENT AS earned_date
FROM studio_jive:jivemessage
GROUP BY userid
HAVING COUNT(*) >= 1000
