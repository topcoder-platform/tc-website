--
-- 1. Update "review_board_members" query from TCS Catalog DB in Query Tool as follows
--    to reflect the latest change to logic for referencing the review board types
--    by client request parameters. As of TCS Release 2.2.0 the clients will pass the
--    project type IDs instead of component project phase type IDs when referring
--    to review board types. The deployer also needs to update the query input to
-- replace "ph" parameter with "pt" parameter in Query Tool.

select distinct u.handle
     , u.user_id
     , lower(u.handle) as lower_handle
     , p.path || i.file_name as image_path
  from rboard_user ru
     , user u
     , outer(informixoltp:coder_image_xref cix, informixoltp:image i, informixoltp:path p)
 where ru.user_id = u.user_id
   and ru.status_id = 100
   and ru.project_type_id = @pt@
   and cix.coder_id = u.user_id
   and cix.display_flag = 1
   and cix.image_id = i.image_id
   and i.image_type_id = 1
   and i.path_id = p.path_id
 order by 3 asc


--
-- 2. Update "review_projects" query from TCS Catalog DB in Query Tool as follows to filter the
-- list of retrieved projects based on project category ID mapped to "pt" parameter.
-- As of TCS Release 2.2.0 the clients will pass the project type/category IDs instead of component project phase type
-- IDs when referring to the types of the review projects.
-- Also the deployer needs to update the query input to add new "pt" parameter in Query Tool.

select distinct
  (select count(distinct u.resource_id)
   from upload u, submission s
   where u.project_id = p.project_id
   and s.submission_status_id in (1,2,3,4)
   and u.upload_id = s.upload_id
   and u.upload_type_id = 1)
   as submission_count
   ,
   (select count(distinct u.resource_id)
    from submission s, upload u
    where u.project_id = p.project_id
    and s.upload_id = u.upload_id
    and u.upload_type_id = 1
    and s.submission_status_id in (1,3,4))
   as submission_passed_screening_count
   , c.component_name
   , cat.category_name as catalog
   , cat.category_id
   ,
   (select name
    from project_category_lu
    where project_category_id = p.project_category_id)
   as phase_desc
   , p.project_category_id + 111 as phase_id
   , p.project_id
   , reviewpp.scheduled_start_time as review_start
   , reviewpp.scheduled_end_time as review_end
   , aggreviewpp.scheduled_start_time as agg_review_start
   , aggreviewpp.scheduled_end_time as agg_review_end
   ,
   (select 3-round(count(*))
    from rboard_application
    where project_id = p.project_id)
   as available_spots
   , cvd.status_id
   ,
   (select count(*)
    from rboard_payment
    where project_id = p.project_id)
   as price_changes
   , cvd.level_id
   , cv.version_text as version
   ,
     case
       when
         exists (select * from project_phase where project_id = p.project_id and phase_type_id = 1)
        then
            (select (scheduled_start_time + 12 units hour)
             from project_phase
             where project_id = p.project_id
             and phase_type_id = 1)
        else
            (select (scheduled_start_time + 12 units hour)
             from project_phase
             where project_id = p.project_id
             and phase_type_id = 2)
      end
   as opens_on
   ,
   (select category_id
    from comp_categories
    where component_id = c.component_id
    and category_id = 22774808)
   as aol_brand
   , pi_prize.value::FLOAT AS prize
   , (CASE WHEN pi_is_dr.value = 'On' THEN NVL(pi_dr_points.value, pi_prize.value) ELSE '0' END)::FLOAT AS dr_points
  from project p
     , project_info projinfo
     , comp_versions cv
     , comp_catalog c
     , categories cat
     , project_phase reviewpp
     , project_phase aggreviewpp
     , project_info pi
     , project_phase pp
     , comp_version_dates cvd
     , project_info pi_prize
     , project_info pi_is_dr
     , outer project_info pi_dr_points
 where 1=1
   and projinfo.project_info_type_id = 2
   and projinfo.project_id = p.project_id
   and projinfo.value = cv.component_id
   and cv.phase_id in (112,113)
   and p.project_id = pp.project_id
   and pp.phase_type_id in (1,2,3,4)
   and pp.phase_status_id = 2
   and cvd.comp_vers_id = cv.comp_vers_id
   and cvd.phase_id = cv.phase_id
   and cvd.status_id <> 303
   and c.component_id = cv.component_id
   and c.root_category_id = cat.category_id
   and reviewpp.phase_type_id = 4
   and reviewpp.project_id =  p.project_id
   and aggreviewpp.project_id =  p.project_id
   and aggreviewpp.phase_type_id = 8
   and extend((select scheduled_start_time
          from project_phase
         where project_id = p.project_id
           and phase_type_id = 2), year to hour) <= extend(current, year to hour)
   and c.root_category_id in (select distinct category_id from category_catalog where catalog_id != 4)
   and (((select count(*)
          from rboard_application
         where project_id = p.project_id
           and phase_id = cv.phase_id) < 3)
    or not exists (select '1'
                    from rboard_application
                   where project_id = p.project_id
                     and phase_id = cv.phase_id))
   and pi.project_id = p.project_id
 AND pi.project_info_type_id = 14
 AND pi.value = 'Open'
 AND p.project_status_id = 1
 AND p.project_id = pi_prize.project_id
 AND pi_prize.project_info_type_id = 16
 AND p.project_id = pi_is_dr.project_id
 AND pi_is_dr.project_info_type_id = 26
 AND p.project_id = pi_dr_points.project_id
 AND pi_dr_points.project_info_type_id = 30
 and p.project_category_id = @pt@
order by component_name desc, category_id, price_changes desc


--
-- 3. Update "review_project_detail" query from TCS Catalog DB in Query Tool as follows to retrieve the review
-- project details based on project ID despite of the phase ID. As of TCS Release 2.2.0 the "project"
-- and "comp_versions" tables are joined via "comp_versions.comp_vers_id" column mapped to "project_info.value"
-- column for "project_info.project_info_type_id" column set to 1 (External Reference). Also added
-- p.project_category_id to list of columns for retrieved data.
--
-- The deployer also needs update the query input to remove "ph" parameter in Query Tool.
--
select c.component_name
     , cat.category_name as catalog
     , cat.category_id
     , (select name from project_category_lu where project_category_id = p.project_category_id) as phase_desc
     , p.project_id
     , p.project_category_id
     , p.project_category_id + 111
     	as phase_id
     , pi1.scheduled_start_time as submission_start
     , pi1.scheduled_end_time as submission_end
     , pi2.scheduled_start_time as screening_start
     , pi2.scheduled_end_time as screening_end
     , pi3.scheduled_start_time as review_start
     , pi3.scheduled_end_time as review_end
     , pi4.scheduled_start_time as aggregation_start
     , pi4.scheduled_end_time as aggregation_end
     , pi5.scheduled_start_time as agg_review_start
     , pi5.scheduled_end_time as agg_review_end
     , pi6.scheduled_start_time as final_fix_start
     , pi6.scheduled_end_time as final_fix_end
     , pi7.scheduled_start_time as final_review_start
     , pi7.scheduled_end_time as final_review_end
     , pi8.scheduled_start_time as appeals_start
     , pi8.scheduled_end_time as appeals_end
     , cl.description as level
     , (select count(distinct u.resource_id)
                    from upload u, submission s
                   where u.project_id = p.project_id
                     and s.submission_status_id in (1,2,3,4)
                     and u.upload_id = s.upload_id
                     and u.upload_type_id = 1) as submission_count
     ,(select count(distinct u.resource_id)
		from submission s, upload u
		where u.project_id = p.project_id
		and s.upload_id = u.upload_id
		and u.upload_type_id = 1
		and s.submission_status_id in (1,3,4))
 		as submission_passed_screening_count
     , cvd.level_id
     , cv.version
     , cv.version_text
     , case when
      exists (select * from project_phase where project_id = p.project_id and phase_type_id = 1)
      then (select (scheduled_start_time + 12 units hour)
          from project_phase
         where project_id = p.project_id
           and phase_type_id = 1)
      else
      	(select (scheduled_start_time + 12 units hour)
          from project_phase
         where project_id = p.project_id
           and phase_type_id = 2)
      end as opens_on
     , pi_prize.value::FLOAT AS prize
     , (CASE WHEN pi_is_dr.value = 'On' THEN NVL(pi_dr_points.value, pi_prize.value) ELSE '0' END)::FLOAT AS dr_points
  from project p
     , comp_versions cv
     , project_phase pi1
     , project_phase pi2
     , project_phase pi3
     , project_phase pi4
     , project_phase pi5
     , project_phase pi6
     , project_phase pi7
     , project_phase pi8
     , comp_catalog c
     , categories cat
     , comp_version_dates cvd
     , comp_level cl
     , project_info pinfo
     , project_info pi_prize
     , project_info pi_is_dr
     , outer project_info pi_dr_points
 where p.project_id = pinfo.project_id
   and pinfo.project_info_type_id = 1
   and pinfo.value = cv.comp_vers_id
   and p.project_id = pi1.project_id
   and pi1.phase_type_id = 2
   and p.project_id = pi2.project_id
   and pi2.phase_type_id = 3
   and p.project_id = pi3.project_id
   and pi3.phase_type_id = 4
   and p.project_id = pi4.project_id
   and pi4.phase_type_id = 7
   and p.project_id = pi5.project_id
   and pi5.phase_type_id = 8
   and p.project_id = pi6.project_id
   and pi6.phase_type_id = 9
   and p.project_id = pi7.project_id
   and pi7.phase_type_id = 10
   and p.project_id = pi8.project_id
   and pi8.phase_type_id = 5
   and p.project_id = @pj@
   and c.component_id = cv.component_id
   and c.root_category_id = cat.category_id
   and cvd.comp_vers_id = cv.comp_vers_id
   and cvd.phase_id = cv.phase_id
   and cvd.level_id = cl.level_id
   AND p.project_id = pi_prize.project_id
   AND pi_prize.project_info_type_id = 16
   AND p.project_id = pi_is_dr.project_id
   AND pi_is_dr.project_info_type_id = 26
   AND p.project_id = pi_dr_points.project_id
   AND pi_dr_points.project_info_type_id = 30

--
-- 4. Execute following statements against TCS_CATALOG database to create reviewer types for Assembly competitions.
--
INSERT INTO review_resp (review_resp_id, review_resp_name, phase_id) VALUES (7, 'Assembly Reviewer 1', 125);
INSERT INTO review_resp (review_resp_id, review_resp_name, phase_id) VALUES (8, 'Assembly Reviewer 2', 125);
INSERT INTO review_resp (review_resp_id, review_resp_name, phase_id) VALUES (9, 'Assembly Reviewer 3', 125);
