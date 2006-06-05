 unload to "dw_scores.unl" select user_component_score_id, user_id,
level_id, s.comp_vers_id, s.phase_id, score, processed,
money,rating,submission_date,place,component_name, cv.component_id from user_component_score s, comp_versions cv, comp_catalog c
where cv.comp_vers_id = s.comp_vers_id and c.component_id = cv.component_id;

unload to "tcs_ratings.unl"
select user_id,rating,phase_id,vol,num_ratings,rating_no_vol, last_component_rated from user_rating;


