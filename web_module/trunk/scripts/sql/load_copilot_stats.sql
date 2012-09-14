SELECT
     r1.copilot_profile_id AS copilot_profile_id
   , r1.user_id AS user_id
   , r1.copilot_handle AS copilot_handle
   , total_projects_number AS projects_count
   , total_contests_number AS contests_count
   , reposted_contests_number AS reposts_count
   , failed_contests_number AS failures_count
   , r2.current_projects_number AS current_projects_count
   , current_contests_number AS current_contests_count
   , r3.registrations_count AS registrations_count
   , r4.submissions_count AS submissions_count
   , (NVL((SELECT SUM(total_amount)
           FROM informixoltp:payment_detail pmd
           INNER JOIN informixoltp:payment pm ON pm.most_recent_detail_id = pmd.payment_detail_id 
           WHERE pm.user_id = r1.user_id 
           AND pmd.installment_number = 1
           AND pmd.payment_type_id = 45
           AND NOT pmd.payment_status_id IN (65, 68, 69)), 0)) AS total_earnings
FROM 

TABLE(
    MULTISET(
      SELECT cp.user_id,
          cp.copilot_profile_id,
          u.handle AS copilot_handle,
          COUNT(DISTINCT p.tc_direct_project_id) AS total_projects_number, 
          COUNT(p.project_id) AS total_contests_number, 
          SUM(CASE WHEN p.project_status_id IN (4, 5, 6, 11) THEN 1 ELSE 0 END) AS failed_contests_number,
          SUM(CASE WHEN EXISTS (SELECT source_project_id 
                                FROM linked_project_xref lp
                                WHERE p.project_id = lp.source_project_id 
                                AND lp.link_type_id = 5) 
                   THEN 1 ELSE 0
              END) AS reposted_contests_number,
          SUM(CASE WHEN p.project_status_id = 1 THEN 1 ELSE 0 END) AS current_contests_number
      FROM project p
      INNER JOIN resource r ON r.project_id = p.project_id AND r.resource_role_id = 14 AND p.project_status_id != 3 AND p.project_status_id != 2 AND p.project_category_id != 27
      INNER JOIN resource_info ri ON ri.resource_id = r.resource_id AND ri.resource_info_type_id = 1
      INNER JOIN copilot_profile cp ON cp.user_id = ri.value
      INNER JOIN user u ON cp.user_id = u.user_id
      GROUP BY cp.user_id, cp.copilot_profile_id, u.handle
    )
) AS r1
LEFT OUTER JOIN 
TABLE(
    MULTISET(
      SELECT cp.user_id, 
      COUNT(DISTINCT p.tc_direct_project_id) AS current_projects_number
      FROM project p
      INNER JOIN resource r on r.project_id = p.project_id AND r.resource_role_id = 14 AND p.project_status_id = 1 AND p.project_category_id != 27
      INNER JOIN resource_info ri ON ri.resource_id = r.resource_id AND ri.resource_info_type_id = 1
      INNER JOIN copilot_profile cp ON cp.user_id = ri.value
      GROUP BY cp.user_id
    )
) AS r2
ON r2.user_id = r1.user_id
LEFT OUTER JOIN 
TABLE(
    MULTISET(
      SELECT cp.user_id, 
      COUNT(r.resource_id) AS registrations_count
      FROM project p
      INNER JOIN resource r on r.project_id = p.project_id
      INNER JOIN resource_info ri ON ri.resource_id = r.resource_id
      INNER JOIN copilot_profile cp ON cp.user_id = ri.value
      WHERE r.resource_role_id = 1 
      AND p.project_category_id = 29
      AND ri.resource_info_type_id = 1
      GROUP BY cp.user_id
    )
) AS r3
ON r3.user_id = r1.user_id
LEFT OUTER JOIN 
TABLE(
    MULTISET(
      SELECT cp.user_id, 
      COUNT(r.resource_id) AS submissions_count
      FROM project p
      INNER JOIN resource r on r.project_id = p.project_id
      INNER JOIN resource_info ri ON ri.resource_id = r.resource_id
      INNER JOIN copilot_profile cp ON cp.user_id = ri.value
      INNER JOIN upload u ON r.resource_id = u.resource_id
      WHERE r.resource_role_id = 1 
      AND p.project_category_id = 29
      AND ri.resource_info_type_id = 1
      AND u.project_id = p.project_id
      AND u.upload_type_id = 1
      AND u.upload_status_id <> 2 
      GROUP BY cp.user_id
    )
) AS r4
ON r4.user_id = r1.user_id
