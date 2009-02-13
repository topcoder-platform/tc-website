create table season (
    season_id DECIMAL(6,0),
  start_calendar_id decimal(10,0),
  end_calendar_id decimal(10,0),
  name varchar(254),
  season_type_id decimal(3,0),
  season_type_desc varchar(254)
)
extent size 64 next size 64
lock mode page;

alter table season add constraint primary key 
    (season_id)
    constraint season_pk;

alter table season add constraint foreign key 
    (start_calendar_id)
    references calendar
    (calendar_id) 
    constraint seasonstart_calendar_fk;

alter table season add constraint foreign key 
    (end_calendar_id)
    references calendar
    (calendar_id) 
    constraint seasonend_calendar_fk;


create table team (
  team_id decimal(10,0),
  name varchar(254),
  team_type DECIMAL(3,0),
  school_id decimal(10,0)
)
extent size 64 next size 64
lock mode page;

alter table team add constraint primary key 
    (team_id)
    constraint team_pk;

alter table team add constraint foreign key 
    (school_id)
    references school
    (school_id) 
    constraint team_school_fk;

create table team_rank_type_lu ( 
  team_rank_type_id decimal(3,0),
  team_rank_type_desc varchar(100)
)
extent size 16 next size 16
lock mode page;

alter table team_rank_type_lu add constraint primary key 
    (team_rank_type_id)
    constraint teamranktype_pk;


create table season_team_rank (
  team_id decimal(10,0),
  season_id decimal(6,0),
  team_rank_type_id decimal(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

alter table season_team_rank add constraint primary key 
    (team_id, season_id)
    constraint seasonalteamrank_pk;

alter table season_team_rank add constraint foreign key 
    (team_id)
    references team
    (team_id) 
    constraint seasonalteamrank_team_fk;
alter table season_team_rank add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint seasonalteamrank_season_fk;


create table season_team_rank_history (
  team_id decimal(10,0),
  season_id decimal(6,0),
  round_id decimal(10,0),
  team_rank_type_id decimal(3,0),
    rank DECIMAL(7,0),
    percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

alter table season_team_rank_history add constraint primary key 
    (team_id, season_id, round_id)
    constraint seasonalteamrankhistory_pk;

alter table season_team_rank_history add constraint foreign key 
    (team_id)
    references team
    (team_id) 
    constraint seasonalteamrankhistory_team_fk;
alter table season_team_rank_history add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint seasonalteamrankhistory_season_fk;
alter table season_team_rank_history add constraint foreign key 
    (round_id)
    references round
    (round_id) 
    constraint seasonalteamrankhistory_round_fk;



  alter table contest add season_id decimal(6,0);
alter table contest add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint contest_season_fk;
  alter table room_result add team_id decimal(10,0);
  alter table room_result add constraint foreign key 
    (team_id)
    references team
    (team_id) 
    constraint roomresult_team_fk;
  alter table school add school_type_id decimal(3,0);
  alter table school add school_type_desc varchar(100);


  drop view active_members;
create view active_members (coder_id) as
   select r.coder_id 
   from algo_rating r, round ro,calendar cal
   where r.last_rated_round_id > 0
   AND r.last_rated_round_id IS NOT NULL
   AND r.last_rated_round_id = ro.round_id 
   AND cal.calendar_id = ro.calendar_id 
   and r.algo_rating_type_id = 1
   AND cal.date > CURRENT - 180 units day;

create view active_hs_members (coder_id) as
   select r.coder_id 
   from algo_rating r, round ro,calendar cal
   where r.last_rated_round_id > 0
   AND r.last_rated_round_id IS NOT NULL
   AND r.last_rated_round_id = ro.round_id 
   AND cal.calendar_id = ro.calendar_id 
   and r.algo_rating_type_id = 2
   AND cal.date > CURRENT - 180 units day;

alter table room_result add team_points decimal(5,0)

grant select on active_members to coder;
grant select on active_hs_members to coder;

create table 'informix'.algo_rating_type_lu (
    algo_rating_type_id DECIMAL(3,0),
    algo_rating_type_desc VARCHAR(100)
)
extent size 64 next size 64
lock mode row;

alter table 'informix'.algo_rating_type_lu add constraint primary key 
    (algo_rating_type_id)
    constraint algo_rating_type_lu_pk;

-- insert the values now so we can create fks    
insert into algo_rating_type_lu(algo_rating_type_id, algo_rating_type_desc) values (1, 'TopCoder Rating');
insert into algo_rating_type_lu(algo_rating_type_id, algo_rating_type_desc) values (2, 'TopCoder High School Rating');
    
    
create table algo_rating (
  coder_id DECIMAL(10,0),
  rating DECIMAL(5,0) default 0,
  vol DECIMAL(5,0) default 0,
  num_ratings DECIMAL(6,0),
  algo_rating_type_id DECIMAL(3,0),
  highest_rating DECIMAL(5,0),
  lowest_rating DECIMAL(5,0),
  first_rated_round_id DECIMAL(10,0),
  last_rated_round_id DECIMAL(10,0),
  num_competitions DECIMAL(7,0)
)
extent size 5000 next size 2000
lock mode row;

alter table algo_rating add constraint primary key 
    (coder_id, algo_rating_type_id)
    constraint algo_rating_pkey;

alter table algo_rating add constraint foreign key 
    (coder_id)
    references coder
    (coder_id) 
    constraint algo_rating_coder_fk;

alter table 'informix'.algo_rating add constraint foreign key 
    (first_rated_round_id)
    references 'informix'.round
    (round_id) 
    constraint algorating_firstround_fk;

alter table 'informix'.algo_rating add constraint foreign key 
    (last_rated_round_id)
    references 'informix'.round
    (round_id) 
    constraint algorating_secondround_fk;

alter table algo_rating add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint algo_rating_algo_rating_type_fk;
