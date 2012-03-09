SELECT DISTINCT jm.userid::INTEGER AS user_id 
FROM studio_jive:jivemessage AS jm
GROUP BY jm.userid HAVING COUNT(jm.messageid) >= 10;