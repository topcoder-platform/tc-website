SELECT m.user_id, CURRENT AS earned_date
FROM table(multiset(
SELECT ri.value::INTEGER AS user_id
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
)) as m group by m.user_id
HAVING COUNT(*) >= 250
