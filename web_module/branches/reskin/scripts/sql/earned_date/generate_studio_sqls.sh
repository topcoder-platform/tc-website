#!/bin/sh
# Copyright (c) 2012 TopCoder, Inc. All rights reserved. 
# Script to generate SQLs for earned date of studio badges having multiple stages.
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
FROM studio_jive:jivemessage
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
        AND pc.project_type_id = 3
        AND p.project_status_id in (1, 7)
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
    pc.project_type_id = 3 AND
    p.project_status_id = 7 AND
    sc.scorecard_type_id = 7
AND ri.value::INTEGER = @userId
ORDER BY rev.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=placement
badge_numbers[$badge_num]="1 25 50 100 250"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
rev.create_date as earned_date
FROM
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
    JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN prize AS pz ON s.prize_id = pz.prize_id
    JOIN review AS rev ON rev.submission_id = s.submission_id
WHERE
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    pz.prize_type_id = 15 AND
    s.submission_type_id = 1 AND
    pc.project_type_id = 3 AND
    pz.place >= 1 AND
    p.project_status_id = 7
AND ri.value::INTEGER = @userId
ORDER BY rev.create_date DESC"
let badge_num+=1
badge_group[$badge_num]=first_win
badge_numbers[$badge_num]="1 25 50 100 250"
badge_sql[$badge_num]="SELECT SKIP @skip LIMIT 1
rev.create_date as earned_date
FROM
    resource_info ri
    JOIN upload AS up ON up.resource_id = ri.resource_id
    JOIN submission AS s ON s.upload_id = up.upload_id
    JOIN project AS p ON up.project_id = p.project_id
    JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
    JOIN prize AS pz ON s.prize_id = pz.prize_id
    JOIN review AS rev ON rev.submission_id = s.submission_id
WHERE
    ri.resource_info_type_id = 1 AND
    up.upload_status_id = 1 AND
    pz.prize_type_id = 15 AND
    s.submission_type_id = 1 AND
    s.submission_status_id <> 5 AND
    pc.project_type_id = 3 AND
    pz.place = 1 AND
    p.project_status_id = 7
    AND ri.value::INTEGER = @userId
ORDER BY rev.create_date DESC"



for ((b=1; b <= $badge_num ; b++)); do
    for i in ${badge_numbers[$b]} ; do
        name=${num_to_text[$i]}_${badge_group[$b]}
        if [ $i -ne 1 ] ; then name=${name}s; fi
        name=studio_${name}.sql
        skip=$i
        let skip-=1
        echo "${badge_sql[$b]/@skip/$skip}" > $name
        echo $name
    done
done
