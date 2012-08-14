SELECT tm.user_id, min(tm.earned_date)
FROM table(multiset(SELECT ri.value as user_id
    , rev.create_date as earned_date
  FROM resource_info ri
    join table(multiset(SELECT ri.value
             , ri.resource_id
             , (SELECT count(*) 
                  FROM table(multiset(SELECT ri.value
                             , ri.resource_id
                             FROM resource_info ri
                             JOIN upload AS up ON up.resource_id = ri.resource_id
                            JOIN submission AS s ON s.upload_id = up.upload_id
                            JOIN project AS p ON up.project_id = p.project_id
                            JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
                            JOIN prize AS pz ON s.prize_id = pz.prize_id
                          WHERE ri.resource_info_type_id = 1 AND
                                up.upload_status_id = 1 AND
                                pz.prize_type_id = 15 AND
                                s.submission_type_id = 1 AND
                                s.submission_status_id <> 5 AND
                                pc.project_type_id in (1, 2) AND
                                pz.place = 1 AND
                                p.project_status_id = 7
                          ORDER BY ri.value)) AS i 
                WHERE i.value = ri.value 
                  AND i.resource_id < ri.resource_id) + 1 AS row_num
            FROM resource_info ri
             JOIN upload AS up ON up.resource_id = ri.resource_id
            JOIN submission AS s ON s.upload_id = up.upload_id
            JOIN project AS p ON up.project_id = p.project_id
            JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
            JOIN prize AS pz ON s.prize_id = pz.prize_id
            WHERE ri.resource_info_type_id = 1 AND
                up.upload_status_id = 1 AND
                pz.prize_type_id = 15 AND
                s.submission_type_id = 1 AND
                s.submission_status_id <> 5 AND
                pc.project_type_id in (1, 2) AND
                pz.place = 1 AND
                p.project_status_id = 7)) AS t on ri.resource_id = t.resource_id 
     JOIN upload AS up ON up.resource_id = ri.resource_id
     JOIN submission AS s ON s.upload_id = up.upload_id
     JOIN project AS p ON up.project_id = p.project_id
     JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
     JOIN prize AS pz ON s.prize_id = pz.prize_id
     join review as rev ON rev.submission_id = s.submission_id
     JOIN scorecard as sc ON rev.scorecard_id = sc.scorecard_id
 WHERE ri.resource_info_type_id = 1 
   AND t.value = ri.value 
   AND sc.scorecard_type_id = 2
   AND row_num = 100)) AS tm
GROUP BY tm.user_id
