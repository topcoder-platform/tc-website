java com.topcoder.utilities.QueryLoader TC_EMAIL 50 "Query_Metadata" 0 0 "
SELECT i.input_id AS input_id,
i.input_code AS input_code,
i.input_desc AS input_desc
FROM command_query_xref AS cq,
query_input_xref AS qi,
input_lu AS i
WHERE cq.query_id = qi.query_id
AND qi.input_id = i.input_id
AND cq.command_id = @ci@
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 51 "Email_Queries" 0 0 "
SELECT c.command_id AS command_id,
c.command_desc AS command_desc
FROM command AS c
WHERE c.command_group_id = 1 AND
c.command_id >
(SELECT c2.command_id
FROM command AS c2
WHERE c2.command_desc = 'email_queries')
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 52 "Recent_Jobs" 0 0 "
SELECT sched_job_id,
start_after_date
FROM sched_job
WHERE start_after_date > DATETIME (@sd@) YEAR TO DAY
ORDER BY start_after_date DESC
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 53 "Jobs_By_Date" 0 0 "
SELECT sched_job_id,
start_after_date
FROM sched_job
WHERE start_after_date > DATETIME(@sd@) YEAR TO DAY
AND start_after_date < DATETIME(@ed@) YEAR TO DAY
ORDER BY start_after_date DESC
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 54 "Jobs_By_Sender" 0 0 "
SELECT sched_email_job_id
FROM sched_email_job
WHERE from_address='@email@'
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 55 "Jobs_By_Subject" 0 0 "
SELECT sched_email_job_id
FROM sched_email_job
WHERE subject LIKE '%@subject@%'
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 56 "Query_Description" 0 0 "
SELECT command_desc
FROM command
WHERE command_id = @ci@
"
java com.topcoder.utilities.QueryLoader TC_EMAIL 57 "Job_Log" 0 0 "
SELECT sched_job_detail_status_name,
reason,
sched_job_detail_id
FROM sched_job_detail sjd,
sched_job_detail_status_lu sjdslu
WHERE sjd.sched_job_detail_status_id = sjdslu.sched_job_detail_status_id
AND sched_job_id = @ji@
"

java com.topcoder.utilities.QueryLoader TC_EMAIL 58 "Next Competition" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder_notify n
WHERE
  u.user_id = n.coder_id
  AND u.status = 'A'
  AND n.notify_id = 1
ORDER BY
  1"


java com.topcoder.utilities.QueryLoader TC_EMAIL 59 "Member Development or Employment Opportunities" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder c
  ,coder_notify n
WHERE
  u.user_id = n.coder_id
  AND u.user_id = c.coder_id
  AND u.status = 'A'
  AND n.notify_id = 4
  AND c.country_code = '840'
ORDER BY
  1"



java com.topcoder.utilities.QueryLoader "OLTP" 60 "Authenticate_Data_User" 0 0 "
SELECT 'yep'
  FROM sector s
       ,permission p
 WHERE s.sector_desc = '@sector@'
   AND s.sector_id = p.sector_id
   AND p.secure_object_id = @cr@
"


java com.topcoder.utilities.QueryLoader TC_EMAIL 61 "Competition Results" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder_notify n
WHERE
  u.user_id = n.coder_id
  AND u.status = 'A'
  AND n.notify_id = 2
ORDER BY
  1"


java com.topcoder.utilities.QueryLoader TC_EMAIL 62 "TopCoder News and Events" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder_notify n
WHERE
  u.user_id = n.coder_id
  AND u.status = 'A'
  AND n.notify_id = 5
ORDER BY
  1"

java com.topcoder.utilities.QueryLoader "OLTP" 63 "School_Membership" 0 0 "
SELECT cs.school_name as school_name
       ,count(*) as number_of_students
       ,sum(r.rating)/sum(case when r.rating > 0 then 1 else 0 end) as avg_rating
       ,sum(r.num_ratings) as num_ratings
  FROM user u
       ,coder c
       ,rating r
       ,current_school cs
 WHERE u.user_id = r.coder_id
   AND r.coder_id = cs.coder_id
   AND c.coder_id = u.user_id
   AND u.status = 'A'
   AND c.coder_type_id = 1
   AND cs.school_name <> ''  
 GROUP BY cs.school_name
HAVING count(*) > 30
 ORDER BY 2 DESC
"

java com.topcoder.utilities.QueryLoader "OLTP" 64 "Prize Winner" 0 0 "
SELECT
  u.email as email_address
  ,c.name as contest_name
  ,u.handle
  ,r.name as round_name
  ,rr.room_placed
  ,rm.unrated
  ,rm.division_id
  ,rp.payment_type_id
  ,rp.paid
FROM
  user u
  ,room_result rr
  ,round_payment rp
  ,round r
  ,contest c
  ,room rm
WHERE
  rm.round_id = @rd@
  AND rp.paid > 0
  AND u.user_id = rr.coder_id
  AND u.user_id = rp.coder_id
  AND rr.coder_id = rp.coder_id
  AND rr.round_id = rp.round_id
  AND rr.round_id = r.round_id
  AND rr.round_id = rm.round_id
  AND rp.round_id = r.round_id
  AND rp.round_id = rm.round_id
  AND r.contest_id = c.contest_id
  AND r.round_id = rm.round_id
  AND rr.room_id = rm.room_id
"

