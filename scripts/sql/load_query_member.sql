SELECT  
    p.project_id as contest_id,
    rri.value::int as registrant_id,
    (SELECT COUNT(*) > 0 
     FROM upload u 
     WHERE u.resource_id = rr.resource_id 
     AND u.project_id = p.project_id 
     AND u.upload_type_id = 1 
     AND u.upload_status_id = 1) as is_submitter,
    (SELECT COUNT(*) > 0 
     FROM prize pr
     INNER JOIN submission s ON pr.prize_id = s.prize_id
     INNER JOIN upload u ON u.upload_id = s.upload_id
     WHERE pr.place = 1
     AND pr.prize_type_id = 14
     AND s.submission_type_id = 3 
     AND s.submission_status_id != 5
     AND u.resource_id = rr.resource_id
     AND u.project_id = p.project_id 
     AND u.upload_type_id = 1 
     AND u.upload_status_id = 1) AS is_milestone_winner,
    (SELECT COUNT(*) > 0 
     FROM prize pr
     INNER JOIN submission s ON pr.prize_id = s.prize_id
     INNER JOIN upload u ON u.upload_id = s.upload_id
     WHERE pr.place = 1 
     AND pr.prize_type_id = 15
     AND s.submission_type_id = 1 
     AND s.submission_status_id != 5
     AND u.resource_id = rr.resource_id
     AND u.project_id = p.project_id 
     AND u.upload_type_id = 1 
     AND u.upload_status_id = 1) AS is_final_winner,
    addr.country_code as country_id,
    cntry.country_name
FROM
    project p 
    INNER JOIN resource rr ON p.project_id = rr.project_id 
    INNER JOIN resource_info rri ON rr.resource_id = rri.resource_id 
    LEFT JOIN common_oltp:user_address_xref uax ON uax.user_id = rri.value::int 
    LEFT JOIN common_oltp:address addr ON addr.address_id = uax.address_id 
    LEFT JOIN common_oltp:country cntry ON addr.country_code = cntry.country_code 
WHERE rr.resource_role_id=1
AND rri.resource_info_type_id=1 
AND p.project_status_id not in (2,3) 
AND p.project_category_id not in (27)
