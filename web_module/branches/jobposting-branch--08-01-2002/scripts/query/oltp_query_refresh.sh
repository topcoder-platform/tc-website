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

java com.topcoder.utilities.QueryLoader "OLTP" 65 "Demographic_Graph" 0 0 "
SELECT demographic_answer_text as answer
       ,sort as sort
       ,COUNT(*) as count
  FROM coder c
       ,user u
       ,rating cr
       ,demographic_response dr
       ,demographic_answer da
 WHERE c.coder_type_id = @ct@
   AND dr.demographic_question_id = @dq@
   AND c.coder_id = dr.coder_id
   AND c.coder_id = cr.coder_id
   AND u.user_id = c.coder_id 
   AND u.handle not like 'guest%'
   AND u.status = 'A'
   AND u.email not like '%topcoder.com%'
   AND dr.demographic_answer_id = da.demographic_answer_id
   AND NOT EXISTS
       (SELECT *
          FROM group_user gu
         WHERE gu.user_id = c.coder_id
           AND gu.group_id = 13)
GROUP BY demographic_answer_text, sort
ORDER BY sort
"

java com.topcoder.utilities.QueryLoader "OLTP" 66 "Referral_Graph" 0 0 "
SELECT r.referral_desc as referral_type
       ,COUNT(*) as count
  FROM coder c
       ,user u
       ,referral r
       ,coder_referral cr
 WHERE c.coder_type_id = @ct@
   AND c.coder_id = cr.coder_id
   AND c.coder_id = cr.coder_id
   AND u.user_id = c.coder_id 
   AND u.handle not like 'guest%'
   AND u.status = 'A'
   AND u.email not like '%topcoder.com%'
   AND r.referral_id = cr.referral_id
   AND NOT EXISTS
       (SELECT *
          FROM group_user gu
         WHERE gu.user_id = c.coder_id
           AND gu.group_id = 13)
GROUP BY r.referral_desc
"

java com.topcoder.utilities.QueryLoader "OLTP" 67 "State_List" 0 0 "
SELECT state_code
  FROM state
"

java com.topcoder.utilities.QueryLoader "OLTP" 68 "Country_List" 0 0 "
SELECT country_code, country_name
  FROM country
"

java com.topcoder.utilities.QueryLoader "OLTP" 69 "Profile_List" 0 0 "
SELECT u.user_id
       ,u.handle
       ,u.email
       ,c.first_name
       ,c.last_name
       ,c.address1
       ,c.address2
       ,c.city
       ,c.state_code
       ,c.zip
       ,c.relocate
       ,co.country_name
       ,ct.coder_type_desc
       ,r.rating
       ,r.num_ratings
       ,(SELECT demographic_answer_text
           FROM demographic_response dr1 
                ,demographic_answer da1
          WHERE dr1.coder_id = c.coder_id
            AND dr1.coder_id = u.user_id
            AND dr1.demographic_question_id = 18
            AND dr1.demographic_answer_id = da1.demographic_answer_id
            AND dr1.demographic_question_id = da1.demographic_question_id
            AND da1.demographic_answer_text::DECIMAL >= @gn@
            AND da1.demographic_answer_text::DECIMAL <= @gx@) as grad_year
       ,(SELECT demographic_answer_text
           FROM demographic_response dr6
                ,demographic_answer da6
          WHERE dr6.coder_id = c.coder_id
            AND dr6.coder_id = u.user_id
            AND dr6.demographic_question_id = 4
            AND dr6.demographic_answer_id = da6.demographic_answer_id
            AND dr6.demographic_question_id = da6.demographic_question_id
            AND da6.demographic_answer_id IN (@ais@)) as relocate
       ,dr2.demographic_response as company
       ,da3.demographic_answer_text as looking_for_job
       ,cs.school_name as known_school_name
       ,da4.demographic_answer_text as other_school_name
       ,da5.demographic_answer_text as degree
       ,rs.start_time as last_rated_event
       ,LOWER(u.handle)
  FROM user u
       ,coder c    
       ,coder_type ct
       ,rating r
       ,country co 
       ,round_segment rs
       ,OUTER demographic_response dr2 
       ,OUTER (demographic_response dr3, OUTER demographic_answer da3)
       ,OUTER (demographic_response dr4, OUTER demographic_answer da4)
       ,OUTER (demographic_response dr5, OUTER demographic_answer da5)
       ,OUTER current_school cs 
 WHERE c.coder_id = u.user_id
   AND ct.coder_type_id = c.coder_type_id
   AND ct.coder_type_id in (@cts@)
   AND r.coder_id = u.user_id
   AND r.round_id = rs.round_id
   AND rs.segment_id = 2
   AND co.country_code = c.country_code
   AND dr2.coder_id = c.coder_id
   AND dr2.demographic_question_id = 15
   AND dr3.coder_id = c.coder_id
   AND dr3.demographic_question_id = 3
   AND dr3.demographic_answer_id = da3.demographic_answer_id
   AND dr3.demographic_question_id = da3.demographic_question_id
   AND dr4.coder_id = c.coder_id
   AND dr4.demographic_question_id = 20
   AND dr4.demographic_answer_id <> 0
   AND dr4.demographic_answer_id = da4.demographic_answer_id
   AND dr4.demographic_question_id = da4.demographic_question_id
   AND dr5.coder_id = c.coder_id
   AND dr5.demographic_question_id = 16
   AND dr5.demographic_answer_id = da5.demographic_answer_id
   AND dr5.demographic_question_id = da5.demographic_question_id
   AND cs.coder_id = c.coder_id
   AND LOWER(u.handle) like LOWER('@ha@')
   AND LOWER(c.first_name) like LOWER('@fn@')
   AND LOWER(c.last_name) like LOWER('@ln@')
   AND c.state_code in (@scs@)
   AND r.rating >= @rn@
   AND r.rating <= @rx@
   AND r.num_ratings >= @nrn@
   AND r.num_ratings <= @nrx@
 ORDER BY 24 ASC
"

java com.topcoder.utilities.QueryLoader "OLTP" 70 "Top Input Rated" 0 0 "
SELECT FIRST @top@ 
  u.email as email_address
  ,u.handle 
  ,c.rating
FROM
  user u
  ,rating c
WHERE
  u.user_id = c.coder_id
ORDER BY
  3 DESC
"

java com.topcoder.utilities.QueryLoader "OLTP" 71 "Profile_Detail" 0 0 "
 SELECT u.user_id
 ,r.rating
 ,r.num_ratings
 ,r.last_rated_event
 ,c.member_since
 ,c.first_name
 ,c.middle_name
 ,c.last_name
 ,u.email
 ,c.address1
 ,c.address2
 ,c.city
 ,c.state_code
 ,c.zip
 ,c.home_phone
 ,c.work_phone
 ,re.referral_desc
 ,ct.coder_type_desc
 ,u.handle
 ,rs.start_time
 ,c.notify
 ,CASE WHEN cref.referral_id = 6 THEN (SELECT name 
                                         FROM school
                                        WHERE school_id = cref.reference_id)
       WHEN cref.referral_id = 10 THEN cref.other
       WHEN cref.referral_id = 40 THEN (SELECT handle
                                          FROM user
                                         WHERE user_id = cref.reference_id)
       ELSE '' END as referral_type
 ,us.user_status_desc
 FROM user u
 JOIN coder c ON u.user_id = c.coder_id
 JOIN rating r ON r.coder_id = c.coder_id  
 JOIN coder_referral cref ON cref.coder_id = c.coder_id
 JOIN referral re ON re.referral_id = cref.referral_id
 JOIN coder_type ct ON c.coder_type_id = ct.coder_type_id
 JOIN user_status_lu us ON u.status = us.user_status_id
 JOIN round_segment rs ON rs.round_id = r.round_id
  AND rs.segment_id = 2
WHERE u.user_id = @cr@
"

java com.topcoder.utilities.QueryLoader "OLTP" 72 "Relocate_Answers" 0 0 "
SELECT demographic_answer_id as answer_id
       ,demographic_answer_text as answer_text
  FROM demographic_answer 
 WHERE demographic_question_id = 4
"

java com.topcoder.utilities.QueryLoader "OLTP" 73 "Email All TopCoder Members" 0 0 "
SELECT LOWER(u.email) AS email_address,u.handle
FROM user u
WHERE u.status = 'A'
AND handle not like '%guest%'
ORDER BY 1
"

java com.topcoder.utilities.QueryLoader "OLTP" 1000 "TCES_Company_Name" 0 0 "
SELECT com.company_name
  FROM contact con,
       company com
 WHERE con.contact_id = @uid@
   AND com.company_id = con.company_id
"

java com.topcoder.utilities.QueryLoader "OLTP" 1001 "TCES_Campaign_List" 0 0 "
SELECT c.campaign_id,
       c.campaign_name,
       c.start_date,
       c.end_date,
       slu.status_desc
  FROM contact con,
       campaign c,
       status_lu slu
 WHERE con.contact_id = @uid@
   AND c.company_id = con.company_id
   AND slu.status_id = c.status_id
"

java com.topcoder.utilities.QueryLoader "OLTP" 1100 "TCES_User_And_Password" 0 0 "
SELECT u.user_id, u.password
  FROM user u
       ,contact c
 WHERE c.contact_id = u.user_id
   AND u.handle = @hn@
"
