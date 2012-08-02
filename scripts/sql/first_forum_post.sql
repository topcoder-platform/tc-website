SELECT jm.userid::INTEGER AS user_id, extend(dbinfo("UTC_TO_DATETIME",min(jm.creationdate)), year to fraction) AS earned_date
FROM jive:jivemessage AS jm
GROUP BY jm.userid