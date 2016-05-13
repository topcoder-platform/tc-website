SELECT m.user_id, min(m.earned_date) AS earned_date
FROM table(multiset(
SELECT ri.value::INTEGER AS user_id, CURRENT as earned_date
FROM resource_info AS ri
	JOIN upload AS u ON ri.resource_id = u.resource_id
	JOIN submission AS s ON s.upload_id = u.upload_id
	JOIN project AS p ON u.project_id = p.project_id
	JOIN project_category_lu AS pc ON p.project_category_id = pc.project_category_id
	JOIN project_info pi2 on pi2.project_id = p.project_id and pi2.project_info_type_id = 2
	JOIN project_info pi79 on pi79.project_id = p.project_id and pi79.project_info_type_id = 79 and pi79.value != 'PEER'
	JOIN comp_versions cv on pi2.value = cv.component_id 
	JOIN comp_technology ct on cv.comp_vers_id = ct.comp_vers_id
WHERE s.submission_status_id IN (1, 4)
	AND ri.resource_info_type_id = 1
	AND u.upload_type_id = 1
	AND s.submission_type_id in (1, 3)
	AND pc.project_type_id in (1, 2)
	AND p.project_status_id in (1, 7, 8, 9)
	AND p.project_category_id != 27
	AND ct.technology_type_id in (27426189, 27426196, 19, 27583145, 27610303, 27612606, 27624865, 27610142)
	AND NOT EXISTS (SELECT 'has_eligibility_constraints' FROM contest_eligibility ce
		WHERE ce.contest_id = p.project_id)
)) as m group by m.user_id