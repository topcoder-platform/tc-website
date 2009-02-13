--*** Those changes are needed to move the rating table to algo_rating and create the rating view in the TRANSACTIONAL side

-- create the algo_rating table and its constraints
create table .algo_rating (
    coder_id DECIMAL(10,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),
    algo_rating_type_id DECIMAL(3,0) default 1,
    modify_date DATETIME YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

alter table 'informix'.algo_rating add constraint primary key 
    (coder_id, algo_rating_type_id)
    constraint algo_rating_pkey;

alter table 'informix'.algo_rating add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint algo_rating_coder_fk;

alter table 'informix'.algo_rating add constraint foreign key 
    (algo_rating_type_id)
    references 'informix'.algo_rating_type_lu
    (algo_rating_type_id) 
    constraint algo_rating_ratingtype_fk;

-- Create a trigger in algo_rating to update modify_date when any change occurs

create trigger "informix".trig_algo_rating_modified update of  rating, vol, round_id, num_ratings, algo_rating_type_id on "informix".algo_rating referencing old as old  for each row
(
        update "informix".algo_rating set "informix".algo_rating.modify_date = CURRENT year to fraction(3) 
     where coder_id = old.coder_id
);


-- move all the data from rating to algo_rating, assuming that all existing data is for regular (non high school) competitions.

insert into algo_rating (coder_id, round_id, rating,  modify_date, vol, num_ratings, algo_rating_type_id)
select coder_id, round_id, rating,  modify_date, vol, num_ratings, 1
from rating;



-- bye bye to rating table

drop table rating;



-- create the rating view that should be similar to what rating used to have

create view rating (coder_id,round_id,rating,num_ratings,
       modify_date,vol,rating_no_vol) as
   select x0.coder_id ,x0.round_id ,x0.rating ,x0.num_ratings ,
       x0.modify_date ,x0.vol ,x0.vol 
   from "informix".algo_rating x0 
   where (x0.algo_rating_type_id = 1.) ;
   
   

-- give permissions to coder on rating view   
grant delete, insert, update, select on rating to coder;   



-- *** Create season and season_type_lu tables and its constraints ***

create table season (
     season_id decimal(6,0), 
     start_date datetime year to fraction, 
     end_date datetime year to fraction, 
     name varchar(254),
     season_type_id decimal(3,0)
)
lock mode row;


create table season_type_lu (
     season_type_id decimal(3,0),
     season_type_desc varchar(254)
) 
lock mode row;


alter table season add constraint primary key
    (season_id)
    constraint season_pkey;

alter table season_type_lu add constraint primary key
    (season_type_id)
    constraint season_type_lu_pkey;


alter table season add constraint foreign key
    (season_type_id)
    references season_type_lu
    (season_type_id)
    constraint season_season_type_id_fkey;
    
    
-- *** Add in contest table a reference to the season ***

alter table contest add season_id decimal(6,0);

alter table contest add constraint foreign key
    (season_id)
    references season
    (season_id)
    constraint contest_season_id_fkey;



-- *** Create table season_algo_rating and its constraints ***

create table 'informix'.season_algo_rating (
    coder_id DECIMAL(10,0),
    season_id decimal(6,0),
    rating DECIMAL(5,0) default 0,
    vol DECIMAL(5,0) default 0,
    round_id DECIMAL(6,0),
    num_ratings DECIMAL(6,0),    
    modify_date DATETIME YEAR TO FRACTION
)
extent size 5000 next size 2000
lock mode row;

alter table 'informix'.season_algo_rating add constraint primary key 
    (coder_id, season_id)
    constraint season_algo_rating_pkey;

alter table 'informix'.season_algo_rating add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint season_algo_rating_coder_fk;


create trigger "informix".trig_season_algo_rating_modified update of  rating, vol, round_id, num_ratings on "informix".season_algo_rating referencing old as old  for each row
(
        update "informix".season_algo_rating set "informix".season_algo_rating.modify_date = CURRENT year to fraction(3) 
     where coder_id = old.coder_id
     AND season_id = old.season_id
);


    
    
-- this column is added for differentiating HS/regular ratings
alter table round_type_lu add algo_rating_type_id DECIMAL(3,0);

update round_type_lu set algo_rating_type_id = 1 where round_type_id in (1,2);
update round_type_lu set algo_rating_type_id = 2 where round_type_id in (17,18);

alter table round_type_lu add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint round_type_lu_algo_rating_type_fk;


--- *** team_coder_xref is loaded, so it needs a create_date field to do incremental loading.
alter table team_coder_xref add create_date DATETIME YEAR TO FRACTION default current;


--- *** add a reference to the school for the teams and a modify_date to do incremental loading with its trigger
alter table team add school_id decimal(10,0);
alter table team add modify_date DATETIME YEAR TO FRACTION default current;

create trigger trig_team_modified update of team_name, team_type, school_id on team referencing old as old for each row
(
     update team set team.modify_date = CURRENT year to fraction(3) 
     where team_id = old.team_id
);


--- *** New team type for High School ***
insert into team_type_lu (team_type_id, team_type_desc) values (4, 'High School Team');


--- *** Add permissions for queries for graphs ***
insert into security_perms values(2002, 'DataDump:dd_hs_rating_history', 132456, 1);
insert into security_perms values(2002, 'DataDump:dd_hs_algorithm_rating_distribution', 132456, 1);