delete from user_rating;

delete from user_component_score where comp_vers_id > 2;

load from "dw_scores.unl" insert into user_component_Score( user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, processed,
money,rating,submission_date,place,component_name, component_id);


load from "tcs_ratings.unl"
insert into user_rating(user_id,rating,phase_id,vol,num_ratings,rating_no_vol, last_component_rated);
