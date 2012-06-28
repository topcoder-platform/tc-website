SELECT
    p.project_id as contest_id,
    rri.value::int as copilot_id,
    addr.country_code as country_id,
    cntry.country_name
FROM
    project p
    INNER JOIN resource rr ON rr.project_id = p.project_id
    INNER JOIN resource_info rri ON rri.resource_id = rr.resource_id
    LEFT JOIN common_oltp:user_address_xref uax ON uax.user_id = rri.value 
    LEFT JOIN common_oltp:address addr ON addr.address_id = uax.address_id 
    LEFT JOIN common_oltp:country cntry ON addr.country_code = cntry.country_code
WHERE
    p.project_status_id not in (2,3) 
    AND p.project_category_id not in (27)
    AND rri.resource_info_type_id = 1 
    AND rr.resource_role_id = 14