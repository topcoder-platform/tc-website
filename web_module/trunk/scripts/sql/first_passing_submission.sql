SELECT DISTINCT ri.value::INTEGER AS user_id 
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