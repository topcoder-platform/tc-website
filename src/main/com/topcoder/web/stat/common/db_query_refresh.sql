/* To refresh query tables, run this script, then run the 
db_query_refresh2.sh shell script, then run db_query_refresh3.sql */

/* Numbered from 1001 to avoid conflicts with the other users of this table */
insert into data_type values(1001, "Integer Input");
insert into data_type values(1002, "Decimal Input");
insert into data_type values(1003, "Date Input");
insert into data_type values(1004, "Sort Direction");
insert into data_type values(1005, "String Input");

insert into command values(1,"round_stats");
insert into command values(2,"room_stats");
insert into command values(3,"round_stats_sorted");
insert into command values(4,"problem_statement");
insert into command values(5,"problem_solution");
insert into command values(6,"member_profile");
insert into command values(7,"winning_debuts");
insert into command values(8,"all_time_wins");
insert into command values(9,"highest_totals");
insert into command values(10,"biggest_rating_gains");
insert into command values(11,"highest_accuracy");
insert into command values(12,"impressive_debuts");
insert into command values(13,"most_consecutive_wins");
insert into command values(14,"best_challengers");
insert into command values(15,"earnings_history");
insert into command values(16,"ratings_history");
insert into command values(17,"coder_room_stats");
insert into command values(18,"coder_ratings");
insert into command values(19,"all_time_wins_by_div");
insert into command values(20,"last_match");
insert into command values(21,"last_match_sorted");
insert into command values(22,"top_room_winners");
insert into command values(23,"top_ranked_div_1");
insert into command values(24,"top_ranked_div_2");
insert into command values(25,"div_2_problem_level_stats");

