SELECT COUNT(*) AS currently_at
FROM table(multiset(
SELECT ri.value::INTEGER AS user_id,
    rev.create_date as earned_date
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
)) as m 
WHERE m.user_id = @userId

