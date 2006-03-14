 
--Query: open_projects original: 
select cv.version,
         cvd.posting_date,
         cvd.initial_submission_date,
         cvd.aggregation_complete_date winner_announced_date,
         cvd.final_submission_date,
         cvd.estimated_dev_date,
         cvd.price,
         cd.document_id,
         cvd.status_id,
         cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.phase_id,
         cl.description,
         cv.comp_vers_id,
         pcat.category_name catalog_name,
         count(distinct ci.user_id) total_inquiries
    from comp_versions cv,
         comp_version_dates cvd,
         OUTER component_inquiry ci,
         comp_documentation cd,
         comp_catalog cc,
         comp_level cl,
         comp_categories ccat,
         categories cat,
         categories pcat
   where cvd.comp_vers_id = cv.comp_vers_id
     and cvd.phase_id = cv.phase_id
     and cv.phase_id = ci.phase
     and cvd.level_id = cl.level_id
     and cc.component_id = ci.component_id
     and cv.version = ci.version
     and ci.rating > 0
     and cd.document_type_id = 0
     and cv.phase_id in (112,113)
     and cc.component_id = cv.component_id
     and cc.status_id = 102
     and cd.comp_vers_id = cvd.comp_vers_id
     and cvd.posting_date <= EXTEND(CURRENT, YEAR TO DAY)
     and cvd.initial_submission_date >= EXTEND(CURRENT, YEAR TO DAY)
     and ccat.component_id = cc.component_id
     and cat.category_id = ccat.category_id
     and pcat.category_id = cat.parent_category_id
group by cv.version,
         cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.comp_vers_id,
         cv.phase_id,
         cvd.posting_date,
         cvd.initial_submission_date,
         aggregation_complete_date,
         cvd.final_submission_date,
         cvd.estimated_dev_date,
         cvd.price,
         cvd.status_id,
         cl.description,
         cd.document_id,
         pcat.category_name
order by cvd.initial_submission_date, cc.component_name








--Query: open_projects new: 
select cv.version,
         pi1.start_date posting_date,
         pi1.end_date initial_submission_date,
         pi5.end_date winner_announced_date,
         pi6.end_date final_submission_date,
         pi8.end_date estimated_dev_date,
         cvd.price,
         cd.document_id,
         cvd.status_id,
         cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.phase_id,
         cl.description,
         cv.comp_vers_id,
         pcat.category_name catalog_name,
         count(distinct rur.login_id) total_inquiries
    from comp_versions cv,
         comp_version_dates cvd,
         comp_documentation cd,
         comp_catalog cc,
         comp_level cl,
         comp_categories ccat,
         categories cat,
         categories pcat,
         project p,
         OUTER r_user_role rur,
         phase_instance pi1,
         phase_instance pi5,
         phase_instance pi6,
         phase_instance pi8
   where cv.comp_vers_id = p.comp_vers_id
     and cv.phase_id-111 = p.project_type_id
     and p.cur_version = 1
     and rur.cur_version = 1
     and rur.project_id = p.project_id
     and rur.r_role_id = 1
     and cvd.comp_vers_id = cv.comp_vers_id
     and cvd.phase_id = cv.phase_id
     and cvd.level_id = cl.level_id
     and cd.document_type_id = 0
     and cv.phase_id in (112,113)
     and cc.component_id = cv.component_id
     and cc.status_id = 102
     and cd.comp_vers_id = cvd.comp_vers_id
     and pi1.start_date <= EXTEND(CURRENT, YEAR TO DAY) -- cvd.posting_date
     and pi1.end_date >= EXTEND(CURRENT, YEAR TO DAY) -- cvd.initial_submission_date
     and ccat.component_id = cc.component_id
     and cat.category_id = ccat.category_id
     and pcat.category_id = cat.parent_category_id
     and pi1.project_id = p.project_id
     and pi1.phase_id = 1
     and pi1.cur_version = 1
     and pi5.project_id = p.project_id
     and pi5.phase_id = 5
     and pi5.cur_version = 1
     and pi6.project_id = p.project_id
     and pi6.phase_id = 6
     and pi6.cur_version = 1
     and pi8.project_id = p.project_id
     and pi8.phase_id = 8
     and pi8.cur_version = 1
group by cv.version,
         cc.component_name,
         cc.component_id,
         cv.comp_vers_id,
         cv.comp_vers_id,
         cv.phase_id,
         pi1.start_date,
         pi1.end_date,
         pi5.end_date,
         pi6.end_date,
         pi8.end_date,
         cvd.price,
         cvd.status_id,
         cl.description,
         cd.document_id,
         pcat.category_name
order by initial_submission_date, cc.component_name
;


--Query: project_status original: 
select cc.component_name,
       cc.component_id,
       cv.version,
       cvd.initial_submission_date,
       cvd.aggregation_complete_date review_complete_date,
       cvd.phase_complete_date,
       cvd.phase_id,
       cvd.final_submission_date,
       pcat.category_name catalog_name
  from comp_catalog cc,
       comp_version_dates cvd,
       comp_versions cv,
       comp_categories ccat,
         categories cat,
         categories pcat
 where cv.comp_vers_id = cvd.comp_vers_id
   and cc.component_id = cv.component_id
   and cvd.initial_submission_date < EXTEND(CURRENT, YEAR TO DAY)
   and cvd.PHASE_COMPLETE_DATE >= EXTEND(CURRENT, YEAR TO DAY)
   and cvd.review_complete_date is not NULL
   and cv.phase_id = cvd.phase_id
   and cv.phase_id in (113,112)
   and ccat.component_id = cc.component_id
   and cat.category_id = ccat.category_id
   and pcat.category_id = cat.parent_category_id
order by cc.component_name


--Query: project_status new: 
select cc.component_name,
       cc.component_id,
       cv.version,
       pi1.end_date initial_submission_date,
       pi5.end_date review_complete_date,
       pi7.end_date phase_complete_date,
       cv.phase_id,
       pi6.end_date final_submission_date,
       pcat.category_name catalog_name
  from comp_catalog cc,
       comp_versions cv,
       comp_categories ccat,
       categories cat,
       categories pcat,
       project p,
       phase_instance pi1,
       phase_instance pi3,
       phase_instance pi5,
       phase_instance pi6,
       phase_instance pi7
 where cv.comp_vers_id = p.comp_vers_id
   and cv.phase_id-111 = p.project_type_id
   and p.cur_version = 1
   and cc.component_id = cv.component_id
   and pi1.end_date < EXTEND(CURRENT, YEAR TO DAY)
   and pi7.end_date >= EXTEND(CURRENT, YEAR TO DAY)
   and pi3.end_date is not NULL
   and cv.phase_id in (113,112)
   and ccat.component_id = cc.component_id
   and cat.category_id = ccat.category_id
   and pcat.category_id = cat.parent_category_id
   and pi1.project_id = p.project_id
   and pi1.phase_id = 1
   and pi1.cur_version = 1
   and pi3.project_id = p.project_id
   and pi3.phase_id = 3
   and pi3.cur_version = 1
   and pi5.project_id = p.project_id
   and pi5.phase_id = 5
   and pi5.cur_version = 1
   and pi6.project_id = p.project_id
   and pi6.phase_id = 6
   and pi6.cur_version = 1
   and pi7.project_id = p.project_id
   and pi7.phase_id = 7
   and pi7.cur_version = 1
order by cc.component_name
;