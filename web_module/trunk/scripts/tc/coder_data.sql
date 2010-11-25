--
-- Coder_Data query
--
SELECT c.handle
     , c.coder_id
     , c.quote
     , r.rating
     , c.member_since
     , 0 AS total_earnings
     , r.num_competitions
     , p.path || i.file_name as image_path
     , (SELECT count(*)
          FROM coder_image_xref cix
             , image i
         WHERE cix.image_id = i.image_id
           AND cix.coder_id = @cr@
           AND cix.display_flag = 1
           AND i.image_type_id = 1) as has_image
     , co.country_name
     , 0 AS design_earnings
    , (SELECT r.rating
          FROM coder c
             , OUTER tcs_dw:user_rating r
         WHERE c.coder_id = @cr@
           AND c.coder_id = r.user_id
           AND r.phase_id = 112) AS design_rating
    , (SELECT r.rating
          FROM coder c
             , OUTER tcs_dw:user_rating r
         WHERE c.coder_id = @cr@
           AND c.coder_id = r.user_id
           AND r.phase_id = 113) AS development_rating
    , (SELECT r.rating
         FROM coder c
             , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 134) AS concept_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 117) AS spec_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 118) AS arch_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 125) AS assembly_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 124) AS test_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 137) AS test_scenarios_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 130) AS ui_prototype_rating
    , (SELECT r.rating
         FROM coder c
            , OUTER tcs_dw:user_rating r
        WHERE c.coder_id = @cr@
          AND c.coder_id = r.user_id
          AND r.phase_id = 135) AS ria_build_rating
    , 0 AS development_earnings
     , cr.rank
     , cr.percentile
     , 0 as royalties
     , (select s.name
          from school s
             , current_school cs
             , coder c1
         where c1.coder_id = cs.coder_id
           and c1.coder_id = c.coder_id
           and cs.school_id = s.school_id
           and cs.viewable = 1
           and c.coder_type_id = 1) as school_name
     , NVL((SELECT SUM(up.gross_amount) 
          FROM payment p, user_payment up
         WHERE p.payment_id = up.payment_id 
         and up.user_id = @cr@ and p.show_in_profile_ind = 1), 0) AS overall_earnings
     , (select count(*) from user_achievement where coder_id = c.coder_id and achievement_type_id in (1,4,5,6,7,8)) as has_achievements
     , case when exists (select '1' from long_comp_result where attended = 'Y' and coder_id = c.coder_id) then '1' else '0' end as has_long_comp
     , (SELECT r.rating
            FROM coder c, OUTER algo_rating r
            WHERE c.coder_id=@cr@
             AND c.coder_id = r.coder_id
             AND algo_Rating_type_id=2) as hs_rating
     , (SELECT count(*) 
            FROM algo_rating 
            WHERE coder_id = @cr@ 
            AND algo_rating_type_id = 2) as hs_registered
     , (SELECT r.rating
            FROM coder c, OUTER algo_rating r
            WHERE c.coder_id= @cr@ 
             AND c.coder_id = r.coder_id
             AND algo_Rating_type_id=3) as mm_rating
  FROM OUTER coder_problem_summary cps
     , coder c
     , OUTER(algo_rating r)
     , OUTER(coder_image_xref cix, image i, path p)
     , OUTER country co     
     , OUTER coder_rank cr
     , OUTER (current_school cs, school s)
 WHERE c.coder_id = @cr@
   AND c.comp_country_code = co.country_code
   AND cs.coder_id = c.coder_id
   AND cs.school_id = s.school_id
   AND cs.viewable = 1
   AND cps.coder_id = c.coder_id
   AND r.coder_id = c.coder_id
   AND cix.coder_id = c.coder_id
   AND cix.display_flag = 1   
   AND cr.coder_id = c.coder_id
   AND cr.coder_rank_type_id = 2
   AND cix.image_id = i.image_id
   AND i.image_type_id = 1
   AND i.path_id = p.path_id
   AND r.algo_rating_type_id = 1
   AND cr.algo_rating_type_id = 1
  AND cps.algo_rating_type_id = 1