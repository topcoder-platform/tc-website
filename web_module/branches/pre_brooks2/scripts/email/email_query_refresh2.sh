java QueryLoader TC_EMAIL 50 "Query_Metadata" 0 0 "
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
java QueryLoader TC_EMAIL 51 "Email_Queries" 0 0 "
SELECT c.command_id AS command_id,
c.command_desc AS command_desc
FROM command AS c
WHERE c.command_group_id = 1 AND
c.command_id >
(SELECT c2.command_id
FROM command AS c2
WHERE c2.command_desc = 'email_queries')
"
java QueryLoader TC_EMAIL 52 "Recent_Jobs" 0 0 "
SELECT sched_job_id,
start_after_date
FROM sched_job
WHERE start_after_date > DATETIME (@sd@) YEAR TO DAY
ORDER BY start_after_date DESC
"
java QueryLoader TC_EMAIL 53 "Jobs_By_Date" 0 0 "
SELECT sched_job_id,
start_after_date
FROM sched_job
WHERE start_after_date > DATETIME(@sd@) YEAR TO DAY
AND start_after_date < DATETIME(@ed@) YEAR TO DAY
ORDER BY start_after_date DESC
"
java QueryLoader TC_EMAIL 54 "Jobs_By_Sender" 0 0 "
SELECT sched_email_job_id
FROM sched_email_job
WHERE from_address='@email@'
"
java QueryLoader TC_EMAIL 55 "Jobs_By_Subject" 0 0 "
SELECT sched_email_job_id
FROM sched_email_job
WHERE subject LIKE '%@subject@%'
"
java QueryLoader TC_EMAIL 56 "Query_Description" 0 0 "
SELECT command_desc
FROM command
WHERE command_id = @ci@
"
java QueryLoader TC_EMAIL 57 "Job_Log" 0 0 "
SELECT sched_job_detail_status_name,
reason,
sched_job_detail_id
FROM sched_job_detail sjd,
sched_job_detail_status_lu sjdslu
WHERE sjd.sched_job_detail_status_id = sjdslu.sched_job_detail_status_id
AND sched_job_id = @ji@
"

java QueryLoader TC_EMAIL 58 "Notify Active" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder c
WHERE
  u.user_id = c.coder_id
  AND u.status = 'A'
  AND c.notify = 'Y'
ORDER BY
  1"


java QueryLoader TC_EMAIL 59 "Notify Active US" 0 0 "
SELECT
  LOWER(u.email) AS email_address
  ,u.handle
FROM
  user u
  ,coder c
WHERE
  u.user_id = c.coder_id
  AND u.status = 'A'
  AND c.notify = 'Y'
  AND c.country_code = '840'
ORDER BY
  1"

