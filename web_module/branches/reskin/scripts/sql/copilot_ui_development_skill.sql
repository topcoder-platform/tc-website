SELECT m.user_id, CURRENT AS earned_date
FROM table(multiset(
SELECT ri.value::INTEGER AS user_id, p.project_id
FROM 
    resource r
    JOIN resource_info ri ON ri.resource_id = r.resource_id
	JOIN project AS p ON r.project_id = p.project_id
WHERE 
    ri.resource_info_type_id = 1 AND
    r.resource_role_id = 14 AND
    p.project_status_id = 7 AND
    p.project_category_id IN (19, 24, 35)
)) as m group by m.user_id
HAVING COUNT(*) >= 15
