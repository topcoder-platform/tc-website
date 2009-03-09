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
     , project_phase regpp
     , project_phase submpp
     , project_phase screenpp
     , project_phase reviewpp
     , project_phase aggreviewpp
     , project_info pi
     , comp_version_dates cvd
     , project_info pi_prize
     , project_info pi_is_dr
     , outer project_info pi_dr_points
 where 1=1
   and projinfo.project_info_type_id = 2
   and projinfo.project_id = p.project_id
   and projinfo.value = cv.component_id
   and cv.phase_id in (112,113)
   AND regpp.project_id = p.project_id
   AND regpp.phase_type_id = 1
   AND submpp.project_id = p.project_id
   AND submpp.phase_type_id = 2
   AND screenpp.project_id = p.project_id
   AND screenpp.phase_type_id = 3
   and reviewpp.phase_type_id = 4
   and reviewpp.project_id =  p.project_id
   and aggreviewpp.project_id =  p.project_id
   and aggreviewpp.phase_type_id = 8
   AND (submpp.phase_status_id = 2 or regpp.phase_status_id = 2 or screenpp.phase_status_id = 2 or reviewpp.phase_status_id = 2)
   and regpp.scheduled_start_time <= CURRENT
   AND reviewpp.scheduled_end_time > CURRENT
   and cvd.comp_vers_id = cv.comp_vers_id
   and cvd.phase_id = cv.phase_id
   and cvd.status_id <> 303
   and c.component_id = cv.component_id
   and c.root_category_id = cat.category_id
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
 and (select 3-round(count(*))
      from rboard_application
      where project_id = p.project_id) > 0
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

insert into phase values (125, 'Assembly');
insert into phase values (118, 'Architecture');
insert into phase values (117, 'Specification');
insert into phase values (134, 'Conceptualization');
insert into phase values (124, 'Testing');


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
   and pp.
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

INSERT INTO rboard_user values (7360309, 14, 1, 100, 1);
INSERT INTO rboard_user values (287614, 14, 1, 100, 1);
INSERT INTO rboard_user values (10650643, 14, 1, 100, 0);
INSERT INTO rboard_user values (10526732, 14, 1, 100, 1);
INSERT INTO rboard_user values (9998760, 14, 1, 100, 1);
INSERT INTO rboard_user values (12006665, 14, 1, 100, 0);
INSERT INTO rboard_user values (11789293, 14, 1, 100, 1);
INSERT INTO rboard_user values (15197513, 14, 1, 100, 0);
INSERT INTO rboard_user values (15002482, 14, 1, 100, 0);
INSERT INTO rboard_user values (15050434, 14, 1, 100, 0);
INSERT INTO rboard_user values (20076717, 14, 1, 100, 0);
INSERT INTO rboard_user values (7584235, 14, 1, 100, 0);
INSERT INTO rboard_user values (21688022, 14, 1, 100, 0);
INSERT INTO rboard_user values (20758806, 14, 1, 100, 0);
INSERT INTO rboard_user values (278342, 14, 2, 100, 1);
INSERT INTO rboard_user values (277356, 14, 2, 100, 1);
INSERT INTO rboard_user values (152605, 14, 2, 100, 1);
INSERT INTO rboard_user values (152342, 14, 2, 100, 1);
INSERT INTO rboard_user values (299904, 14, 2, 100, 1);
INSERT INTO rboard_user values (289824, 14, 2, 100, 1);
INSERT INTO rboard_user values (301504, 14, 2, 100, 1);
INSERT INTO rboard_user values (296745, 14, 2, 100, 1);
INSERT INTO rboard_user values (304976, 14, 2, 100, 1);
INSERT INTO rboard_user values (304979, 14, 2, 100, 1);
INSERT INTO rboard_user values (281421, 14, 2, 100, 1);
INSERT INTO rboard_user values (297731, 14, 2, 100, 1);
INSERT INTO rboard_user values (310233, 14, 2, 100, 1);
INSERT INTO rboard_user values (7389864, 14, 2, 100, 1);
INSERT INTO rboard_user values (7210680, 14, 2, 100, 1);
INSERT INTO rboard_user values (7364893, 14, 2, 100, 1);
INSERT INTO rboard_user values (9981727, 14, 2, 100, 1);
INSERT INTO rboard_user values (10353806, 14, 2, 100, 1);
INSERT INTO rboard_user values (286911, 14, 2, 100, 1);
INSERT INTO rboard_user values (7360309, 14, 2, 100, 1);
INSERT INTO rboard_user values (11798503, 14, 2, 100, 1);
INSERT INTO rboard_user values (10471734, 14, 2, 100, 1);
INSERT INTO rboard_user values (10529347, 14, 2, 100, 1);
INSERT INTO rboard_user values (11824548, 14, 2, 100, 1);
INSERT INTO rboard_user values (8471701, 14, 2, 100, 1);
INSERT INTO rboard_user values (301597, 14, 2, 100, 1);
INSERT INTO rboard_user values (11781622, 14, 2, 100, 1);
INSERT INTO rboard_user values (10425804, 14, 2, 100, 1);
INSERT INTO rboard_user values (10650643, 14, 2, 100, 1);
INSERT INTO rboard_user values (10022398, 14, 2, 100, 1);
INSERT INTO rboard_user values (11971764, 14, 2, 100, 1);
INSERT INTO rboard_user values (7489235, 14, 2, 100, 1);
INSERT INTO rboard_user values (8416548, 14, 2, 100, 1);
INSERT INTO rboard_user values (10526732, 14, 2, 100, 1);
INSERT INTO rboard_user values (8544935, 14, 2, 100, 1);
INSERT INTO rboard_user values (13262921, 14, 2, 100, 1);
INSERT INTO rboard_user values (9998760, 14, 2, 100, 1);
INSERT INTO rboard_user values (14820574, 14, 2, 100, 1);
INSERT INTO rboard_user values (11802577, 14, 2, 100, 1);
INSERT INTO rboard_user values (10275123, 14, 2, 100, 1);
INSERT INTO rboard_user values (11789293, 14, 2, 100, 1);
INSERT INTO rboard_user values (11889718, 14, 2, 100, 1);
INSERT INTO rboard_user values (15832159, 14, 2, 100, 1);
INSERT INTO rboard_user values (9971384, 14, 2, 100, 1);
INSERT INTO rboard_user values (260952, 14, 2, 100, 1);
INSERT INTO rboard_user values (8375801, 14, 2, 100, 1);
INSERT INTO rboard_user values (20076717, 14, 2, 100, 1);
INSERT INTO rboard_user values (20719960, 14, 2, 100, 1);
INSERT INTO rboard_user values (15655112, 14, 2, 100, 1);
INSERT INTO rboard_user values (15566003, 14, 2, 100, 1);
INSERT INTO rboard_user values (21221008, 14, 2, 100, 1);
INSERT INTO rboard_user values (10119301, 14, 2, 100, 1);
INSERT INTO rboard_user values (19901317, 14, 2, 100, 1);
INSERT INTO rboard_user values (21471587, 14, 2, 100, 1);
INSERT INTO rboard_user values (8347577, 14, 2, 100, 1);
INSERT INTO rboard_user values (21271044, 14, 2, 100, 1);
INSERT INTO rboard_user values (289824, 14, 3, 100, 1);
INSERT INTO rboard_user values (278342, 14, 4, 100, 1);
INSERT INTO rboard_user values (277356, 14, 4, 100, 1);
INSERT INTO rboard_user values (152342, 14, 4, 100, 1);
INSERT INTO rboard_user values (299904, 14, 4, 100, 1);
INSERT INTO rboard_user values (289824, 14, 4, 100, 1);
INSERT INTO rboard_user values (301504, 14, 4, 100, 1);
INSERT INTO rboard_user values (153089, 14, 4, 100, 1);
INSERT INTO rboard_user values (296745, 14, 4, 100, 1);
INSERT INTO rboard_user values (302018, 14, 4, 100, 1);
INSERT INTO rboard_user values (269515, 14, 4, 100, 1);
INSERT INTO rboard_user values (304979, 14, 4, 100, 1);
INSERT INTO rboard_user values (297731, 14, 4, 100, 1);
INSERT INTO rboard_user values (252022, 14, 4, 100, 1);
INSERT INTO rboard_user values (310233, 14, 4, 100, 1);
INSERT INTO rboard_user values (7463987, 14, 4, 100, 1);
INSERT INTO rboard_user values (299180, 14, 4, 100, 1);
INSERT INTO rboard_user values (260578, 14, 4, 100, 1);
INSERT INTO rboard_user values (7563318, 14, 2, 100, 1);
INSERT INTO rboard_user values (10063132, 14, 2, 100, 1);
INSERT INTO rboard_user values (10651566, 14, 2, 100, 1);
INSERT INTO rboard_user values (21725045, 14, 2, 100, 1);
INSERT INTO rboard_user values (21177823, 14, 2, 100, 1);
INSERT INTO rboard_user values (21766248, 14, 2, 100, 1);
INSERT INTO rboard_user values (11861668, 14, 2, 100, 1);
INSERT INTO rboard_user values (22653372, 14, 2, 100, 1);
INSERT INTO rboard_user values (15692538, 14, 2, 100, 1);
INSERT INTO rboard_user values (7360318, 14, 2, 100, 1);
INSERT INTO rboard_user values (13325697, 14, 2, 100, 1);
INSERT INTO rboard_user values (15604762, 14, 2, 100, 1);
INSERT INTO rboard_user values (20095099, 14, 2, 100, 1);
INSERT INTO rboard_user values (20822482, 14, 1, 100, 0);
INSERT INTO rboard_user values (20543575, 14, 2, 100, 1);
INSERT INTO rboard_user values (22652336, 14, 2, 100, 1);
INSERT INTO rboard_user values (11775761, 14, 2, 100, 1);
INSERT INTO rboard_user values (21459383, 14, 2, 100, 1);
INSERT INTO rboard_user values (22051379, 14, 2, 100, 1);
INSERT INTO rboard_user values (22652321, 14, 2, 100, 1);
INSERT INTO rboard_user values (21110930, 14, 1, 100, 0);
INSERT INTO rboard_user values (22653196, 14, 2, 100, 1);
INSERT INTO rboard_user values (22629228, 14, 2, 100, 1);
INSERT INTO rboard_user values (347569, 14, 2, 100, 1);
INSERT INTO rboard_user values (22661509, 14, 2, 100, 1);
INSERT INTO rboard_user values (9906220, 14, 2, 100, 1);
INSERT INTO rboard_user values (15341136, 14, 2, 100, 1);
INSERT INTO rboard_user values (15046749, 14, 2, 100, 1);
INSERT INTO rboard_user values (22657817, 14, 2, 100, 1);
INSERT INTO rboard_user values (22222626, 14, 2, 100, 1);
INSERT INTO rboard_user values (22662152, 14, 2, 100, 1);
INSERT INTO rboard_user values (20224338, 14, 1, 100, 0);
INSERT INTO rboard_user values (22652765, 14, 1, 100, 0);
INSERT INTO rboard_user values (22661927, 14, 2, 100, 1);
INSERT INTO rboard_user values (22629750, 14, 2, 100, 1);
INSERT INTO rboard_user values (20807620, 14, 1, 100, 0);
INSERT INTO rboard_user values (15992135, 14, 1, 100, 0);
INSERT INTO rboard_user values (20952853, 14, 2, 100, 1);
INSERT INTO rboard_user values (22678809, 14, 1, 100, 0);
INSERT INTO rboard_user values (20224338, 14, 2, 100, 1);
INSERT INTO rboard_user values (22685703, 14, 1, 100, 0);
INSERT INTO rboard_user values (22668084, 14, 1, 100, 0);
INSERT INTO rboard_user values (15692556, 14, 2, 100, 1);
INSERT INTO rboard_user values (20284684, 14, 2, 100, 1);
INSERT INTO rboard_user values (21180848, 14, 2, 100, 1);
INSERT INTO rboard_user values (22668017, 14, 5, 100, 1);
INSERT INTO rboard_user values (22656086, 14, 5, 100, 1);
INSERT INTO rboard_user values (301597, 14, 5, 100, 1);
INSERT INTO rboard_user values (15072390, 14, 5, 100, 1);
INSERT INTO rboard_user values (22680903, 14, 2, 100, 1);
INSERT INTO rboard_user values (7360309, 14, 5, 100, 1);
INSERT INTO rboard_user values (22662152, 14, 5, 100, 1);
INSERT INTO rboard_user values (21271044, 14, 5, 100, 1);
INSERT INTO rboard_user values (22629385, 14, 1, 100, 0);
INSERT INTO rboard_user values (10445079, 14, 2, 100, 1);
INSERT INTO rboard_user values (22705933, 14, 2, 100, 1);
INSERT INTO rboard_user values (22693390, 14, 1, 100, 1);
INSERT INTO rboard_user values (22697701, 14, 5, 100, 1);
INSERT INTO rboard_user values (22629791, 14, 1, 100, 0);
INSERT INTO rboard_user values (22680588, 14, 1, 100, 0);
INSERT INTO rboard_user values (22708108, 14, 2, 100, 1);
INSERT INTO rboard_user values (22689236, 14, 1, 100, 0);
INSERT INTO rboard_user values (22634515, 14, 2, 100, 1);
INSERT INTO rboard_user values (22687607, 14, 2, 100, 1);
INSERT INTO rboard_user values (15763205, 14, 1, 100, 0);
INSERT INTO rboard_user values (22702954, 14, 2, 100, 1);
INSERT INTO rboard_user values (22658235, 14, 2, 100, 1);
INSERT INTO rboard_user values (22691991, 14, 1, 100, 0);
INSERT INTO rboard_user values (20283367, 14, 1, 100, 0);
INSERT INTO rboard_user values (22721959, 14, 1, 100, 0);
INSERT INTO rboard_user values (22044399, 14, 2, 100, 1);
INSERT INTO rboard_user values (22667742, 14, 1, 100, 0);
INSERT INTO rboard_user values (22721181, 14, 1, 100, 0);
INSERT INTO rboard_user values (22732049, 14, 1, 100, 0);
INSERT INTO rboard_user values (22717505, 14, 1, 100, 0);
INSERT INTO rboard_user values (287614, 14, 8, 100, 1);
INSERT INTO rboard_user values (22708108, 14, 8, 100, 1);
INSERT INTO rboard_user values (20256177, 14, 8, 100, 1);
INSERT INTO rboard_user values (15002482, 14, 8, 100, 1);
INSERT INTO rboard_user values (22687607, 14, 8, 100, 1);
INSERT INTO rboard_user values (10650643, 14, 8, 100, 1);
INSERT INTO rboard_user values (252022, 14, 8, 100, 1);
INSERT INTO rboard_user values (20076717, 14, 8, 100, 1);
INSERT INTO rboard_user values (7360309, 14, 8, 100, 1);
INSERT INTO rboard_user values (21221008, 14, 8, 100, 1);
INSERT INTO rboard_user values (22652321, 14, 6, 100, 1);
INSERT INTO rboard_user values (22680903, 14, 6, 100, 1);
INSERT INTO rboard_user values (22687607, 14, 6, 100, 1);
INSERT INTO rboard_user values (10650643, 14, 6, 100, 1);
INSERT INTO rboard_user values (22721181, 14, 6, 100, 1);
INSERT INTO rboard_user values (21221008, 14, 6, 100, 1);
INSERT INTO rboard_user values (22708076, 14, 6, 100, 1);
INSERT INTO rboard_user values (15002482, 14, 10, 100, 1);
INSERT INTO rboard_user values (22687607, 14, 10, 100, 1);
INSERT INTO rboard_user values (22721959, 14, 10, 100, 1);
INSERT INTO rboard_user values (20076717, 14, 10, 100, 1);
INSERT INTO rboard_user values (22629791, 14, 10, 100, 1);
INSERT INTO rboard_user values (20758806, 14, 10, 100, 1);
INSERT INTO rboard_user values (21221008, 14, 10, 100, 1);
INSERT INTO rboard_user values (22708076, 14, 10, 100, 1);
INSERT INTO rboard_user values (20076717, 14, 5, 100, 1);
INSERT INTO rboard_user values (15992135, 14, 8, 100, 1);
INSERT INTO rboard_user values (21688022, 14, 10, 100, 1);
INSERT INTO rboard_user values (9998760, 14, 10, 100, 1);
INSERT INTO rboard_user values (22721959, 14, 8, 100, 1);
INSERT INTO rboard_user values (22689236, 14, 8, 100, 1);
INSERT INTO rboard_user values (22689236, 14, 6, 100, 1);
INSERT INTO rboard_user values (22689236, 14, 10, 100, 1);
INSERT INTO rboard_user values (22652321, 14, 10, 100, 1);
INSERT INTO rboard_user values (10169506, 14, 10, 100, 1);
INSERT INTO rboard_user values (11789293, 14, 10, 100, 1);
INSERT INTO rboard_user values (22697067, 14, 1, 100, 0);
INSERT INTO rboard_user values (15197513, 14, 10, 100, 1);
INSERT INTO rboard_user values (22708076, 14, 2, 100, 1);
INSERT INTO rboard_user values (22721181, 14, 10, 100, 1);
INSERT INTO rboard_user values (22748534, 14, 1, 100, 1);
INSERT INTO rboard_user values (22676536, 14, 2, 100, 1);
INSERT INTO rboard_user values (22748068, 14, 1, 100, 0);
INSERT INTO rboard_user values (22750776, 14, 1, 100, 0);
