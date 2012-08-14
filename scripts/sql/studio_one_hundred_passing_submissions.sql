SELECT ri.value as user_id
    , rev.create_date as earned_date
  FROM submission s
    join table(multiset(SELECT ri.value
             , s.submission_id
             , (SELECT count(*) 
                  FROM table(multiset(SELECT ri.value
                             , s.submission_id
                          FROM resource_info ri
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
                          ORDER BY ri.value)) AS i 
                   WHERE i.value = ri.value 
                  AND i.submission_id < s.submission_id) + 1 AS row_num
           FROM resource_info ri
            JOIN upload AS u ON ri.resource_id = u.resource_id
            JOIN submission AS s ON s.upload_id = u.upload_id
            JOIN project AS p ON u.project_id = p.project_id
            JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
          WHERE s.submission_status_id IN (1, 4)
            AND ri.resource_info_type_id = 1
            AND u.upload_type_id = 1
            AND s.submission_type_id in (1, 3)
            AND pc.project_type_id = 3
            AND p.project_status_id in (1, 7))) AS t on s.submission_id = t.submission_id
    JOIN upload AS up ON up.upload_id = s.upload_id
    JOIN resource_info ri ON up.resource_id = ri.resource_id
     JOIN project AS p ON up.project_id = p.project_id
     JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
     JOIN prize AS pz ON s.prize_id = pz.prize_id
     join review as rev ON rev.submission_id = s.submission_id
 WHERE ri.resource_info_type_id = 1 
   AND t.value = ri.value 
   AND row_num = 100
