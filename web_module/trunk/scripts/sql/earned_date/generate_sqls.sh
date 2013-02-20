#!/bin/sh
# Copyright (c) 2012 TopCoder, Inc. All rights reserved. 
# Script to generate SQLs for earned date of badges having multiple stages.
# Author: TrePe
source num_to_text.sh
declare -a badge_group
declare -a badge_numbers
badge_num=0

let badge_num+=1
badge_group[$badge_num]=forum_post
badge_numbers[$badge_num]="1 100 500 1000 5000"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
extend(dbinfo(\"UTC_TO_DATETIME\", creationdate/1000), year to fraction) AS earned_date
FROM jive:jivemessage
WHERE userid = @userId
ORDER BY creationdate DESC"
let badge_num+=1
badge_group[$badge_num]=passing_submission
badge_numbers[$badge_num]="1 50 100 250 500"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
s.create_date AS earned_date
FROM resource_info AS ri
        JOIN upload AS u ON ri.resource_id = u.resource_id
        JOIN submission AS s ON s.upload_id = u.upload_id
        JOIN project AS p ON u.project_id = p.project_id
        JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
WHERE s.submission_status_id IN (1, 4)
        AND ri.resource_info_type_id = 1
        AND u.upload_type_id = 1
        AND s.submission_type_id in (1, 3)
        AND pc.project_type_id in (1, 2)
        AND p.project_status_id in (1, 7)
        AND p.project_category_id != 27
        AND NOT EXISTS (SELECT 'has_eligibility_constraints' FROM contest_eligibility ce
                WHERE ce.contest_id = p.project_id)
AND ri.value::INTEGER = @userId
ORDER BY s.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=milestone_prize
badge_numbers[$badge_num]="1 50 100 250 500"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
rev.create_date AS earned_date
FROM
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
    JOIN prize AS pz ON pz.prize_id = s.prize_id
    JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN review AS rev ON rev.submission_id = s.submission_id
    JOIN scorecard as sc ON rev.scorecard_id = sc.scorecard_id
WHERE
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    s.submission_status_id = 1 AND
    pz.prize_type_id = 14 AND
    pc.project_type_id in( 1,2) AND
    p.project_status_id = 7 AND
    sc.scorecard_type_id = 7
AND ri.value::INTEGER = @userId
ORDER BY rev.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=placement
badge_numbers[$badge_num]="1 25 50 100 250"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
pr.create_date as earned_date
FROM
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
    JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN project_result as pr on p.project_id = pr.project_id and ri.value = pr.user_id
WHERE
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    s.submission_type_id = 1 AND
    pc.project_type_id in ( 1,2) AND
    pr.placed >= 1 AND
    p.project_status_id = 7
    AND p.project_category_id != 27
    AND NOT EXISTS (SELECT 'has_eligibility_constraints' FROM contest_eligibility ce
        WHERE ce.contest_id = p.project_id)
AND ri.value::INTEGER = @userId
ORDER BY pr.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=first_win
badge_numbers[$badge_num]="1 25 50 100 250"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
pr.create_date as earned_date
FROM
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
    JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN project_result as pr on p.project_id = pr.project_id and ri.value = pr.user_id
WHERE
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    s.submission_type_id = 1 AND
    s.submission_status_id <> 5 AND
    pc.project_type_id in(1,2) AND
    pr.placed = 1  AND
    p.project_status_id = 7
    AND p.project_category_id != 27
    AND NOT EXISTS (SELECT 'has_eligibility_constraints' FROM contest_eligibility ce
        WHERE ce.contest_id = p.project_id)
    AND ri.value::INTEGER = @userId
ORDER BY pr.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=rated_algorithm_participation
badge_numbers[$badge_num]="1 5 25 100 300"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
c.date AS earned_date
  FROM round r
     , room_result rr
     , calendar c
 WHERE r.round_id = rr.round_id
   AND c.calendar_id = r.calendar_id
   AND r.round_type_id IN (1,2,10,20)
   AND rr.attended='Y'
   AND r.rated_ind=1
   AND rr.coder_id = @userId
 ORDER BY c.date DESC"
let badge_num+=1
badge_group[$badge_num]=srm_room_win
badge_numbers[$badge_num]="1 5 20 50 100"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
c.date AS earned_date
  FROM round r
     , room_result rr
     , calendar c
 WHERE r.round_id = rr.round_id
   AND c.calendar_id = r.calendar_id
   AND r.round_type_id IN (1,2,10)
   AND rr.attended='Y'
   AND r.rated_ind=1
   AND rr.room_placed=1
   AND rr.coder_id = @userId
 ORDER BY c.date DESC"
let badge_num+=1
badge_group[$badge_num]=srm_solved_problem
badge_numbers[$badge_num]="1 10 50 200 500"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
extend(dbinfo(\"UTC_TO_DATETIME\",cp.submit_time/1000), year to fraction) AS earned_date
  FROM coder_problem cp, round r
  WHERE cp.round_id = r.round_id
    AND r.round_type_id IN (1,2,10)
    AND cp.final_points > 0
    AND cp.coder_id = @userId
ORDER BY cp.submit_time DESC"
let badge_num+=1
badge_group[$badge_num]=successful_challenge
badge_numbers[$badge_num]="1 5 25 100 250"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
extend(dbinfo(\"UTC_TO_DATETIME\",c.submit_time/1000), year to fraction) AS earned_date
  FROM challenge c, round r
  WHERE c.round_id = r.round_id
    AND r.round_type_id IN (1,2,10)
    AND c.succeeded = 1
    AND c.challenger_id = @userId
ORDER BY c.submit_time DESC"
let badge_num+=1
badge_group[$badge_num]=marathon_participation
badge_numbers[$badge_num]="1 3 10 20 50"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
c.date as earned_date
  FROM long_comp_result lcr
     , round r
     , calendar c
 WHERE lcr.round_id = r.round_id
   AND c.calendar_id = r.calendar_id
   AND lcr.attended = 'Y'
   AND lcr.coder_id = @userId
ORDER BY c.date DESC"
let badge_num+=1
badge_group[$badge_num]=top5_marathon
badge_numbers[$badge_num]="1 2 4 8 16"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
c.date as earned_date
FROM long_comp_result lcr
    , round r
    , calendar c
WHERE placed <= 5
  AND lcr.round_id = r.round_id
  AND c.calendar_id = r.calendar_id
  AND r.round_type_id in (13, 19)
  AND lcr.coder_id = @userId
ORDER BY c.date DESC"


for ((b=1; b <= $badge_num ; b++)); do
    for i in ${badge_numbers[$b]} ; do
        name=${num_to_text[$i]}_${badge_group[$b]}
        if [ $i -ne 1 ] ; then name=${name}s; fi
        name=${name}.sql
        skip=$i
        let skip-=1
        echo "${badge_sql[$b]/@skip/$skip}" > $name
        echo $name
    done
done
