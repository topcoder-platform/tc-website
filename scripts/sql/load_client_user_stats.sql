SELECT cal.year,
       cal.month_numeric month_number,
       cc.client_id,
       cc.name,
       min(cal.date) date_starting,
       max(cal.date) date_ending,
       count(UNIQUE handle) as users_number
FROM tt_client cc, USER uu, calendar cal,
  ( SELECT UNIQUE u.user_id,
                  ttc.client_id,
                  max(p.create_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND (p.create_user = u.user_id)
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY u.user_id,
            ttc.client_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           max(p.modify_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND (p.modify_user = u.user_id)
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY u.user_id,
            ttc.client_id
   
   UNION ALL 
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           max(tdp.create_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND tdp.user_id = u.user_id
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY ttc.client_id,
            u.user_id
   
   UNION ALL 
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           max(pa.create_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         project_audit pa
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND pa.create_user = u.user_id
     AND pa.project_id = p.project_id
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY ttc.client_id,
            u.user_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           max(pa.action_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         project_info_audit pa
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND pa.action_user_id = u.user_id
     AND pa.project_id = p.project_id
     AND pa.project_id = p.project_id
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY ttc.client_id,
            u.user_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           millis_to_time((max(m.modificationdate))) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         project_info pi4,
                                                                                                                         jivecategory c,
                                                                                                                         jiveforum f,
                                                                                                                         jivemessage m,
                                                                                                                         project_category_lu pcl
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND pi4.project_id = p.project_id
     AND pi4.project_info_type_id = 4
     AND c.categoryid = pi4.value
     AND c.categoryid = f.categoryid
     AND m.forumid = f.forumid
     AND m.userid = u.user_id
     AND pcl.project_category_id = p.project_category_id
     AND pcl.project_type_id != 3
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
   GROUP BY ttc.client_id,
            u.user_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           millis_to_time((max(m.modificationdate)))AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         studio_jive:jivemessage m,
                                                                                                                                                 project_info pi4,
                                                                                                                                                 project_category_lu pcl
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND pi4.project_id = p.project_id
     AND pi4.project_info_type_id = 4
     AND m.forumid = pi4.value
     AND m.userid = u.user_id
     AND pcl.project_category_id = p.project_category_id
     AND pcl.project_type_id = 3
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY ttc.client_id,
            u.user_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           millis_to_time((max(m.modificationdate))) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         jivecategory c,
                                                                                                                         jiveforum f,
                                                                                                                         jivemessage m
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND c.categoryid = tdp.project_forum_id
     AND c.categoryid = f.categoryid
     AND m.forumid = f.forumid
     AND m.userid = u.user_id
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
   GROUP BY u.user_id,
            ttc.client_id
   
   UNION ALL
   
   SELECT UNIQUE u.user_id,
                           ttc.client_id,
                           max(r.modify_date) AS time
   FROM project_info pi32, tt_project ttp, tt_client_project ttcp, tt_client ttc, tc_direct_project tdp, project p, USER u,
                                                                                                                         resource r,
                                                                                                                         resource_info ri
   WHERE pi32.value=ttp.project_id
     AND ttp.project_id = ttcp.project_id
     AND ttcp.client_id = ttc.client_id
     AND p.project_id = pi32.project_id
     AND pi32.project_info_type_id = 32
     AND p.tc_direct_project_id = tdp.project_id
     AND ri.value = u.user_id
     AND resource_role_id IN (17,
                              20,
                              4)
     AND ri.resource_id = r.resource_id
     AND ri.resource_info_type_id = 1
     AND r.project_id = p.project_id
     AND u.user_id IN
       (SELECT user_id
        FROM user_permission_grant
        WHERE resource_id =tdp.project_id)
     AND u.user_id IN
       (SELECT value
        FROM resource r,
             resource_info ri
        WHERE r.project_id = p.project_id
          AND r.resource_role_id = 12
          AND ri.resource_id = r.resource_id
          AND ri.resource_info_type_id = 1)
     AND u.user_id NOT IN
       (SELECT login_id
        FROM user_role_xref
        WHERE login_id = u.user_id
          AND role_id = 2087)
     AND u.user_id NOT IN
       (SELECT user_id
        FROM copilot_project cp,
             copilot_profile cpp
        WHERE cp.copilot_profile_id=cpp.copilot_profile_id
          AND cpp.user_id = u.user_id)
   GROUP BY ttc.client_id,
            u.user_id ) b
WHERE b.client_id = cc.client_id
  AND uu.user_id = b.user_id
  AND uu.user_id NOT IN (22841596,
                         20076717,
                         151634,
                         22627755)
  AND date(time) = cal.date
  AND cal.date >= ?
GROUP BY 1,
         2,
         3,
         4
ORDER BY YEAR DESC, month_number DESC, cc.name