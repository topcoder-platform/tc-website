SELECT jm.userid::INTEGER AS user_id, extend(dbinfo("UTC_TO_DATETIME",min(jm.creationdate)/1000), year to fraction) AS earned_date
FROM jive:jivemessage AS jm
GROUP BY jm.userid