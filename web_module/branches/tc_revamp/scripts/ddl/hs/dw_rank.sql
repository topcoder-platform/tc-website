-- This script updates the rank tables in Data Warehouse.
--
-- The tables rank and rank_history are erased because they're deprecated.
-- The following tables are created with their constraints
--      season_rank
--      season_rank_history
--      country_rank
--      country_rank_history
--      season_country_rank
--      season_country_rank_history
--
-- May 2006 by cucu 

-- *** drop deprecated tables ***
drop table rank;
drop table rank_history;


-- *** Create season_rank and its constraints ***
create table season_rank (
  coder_id decimal(10,0),
  season_id decimal(6,0),
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;


alter table season_rank add constraint primary key 
    (coder_id, season_id)
    constraint seasonrank_pk;
    
alter table season_rank add constraint foreign key 
    (coder_id)
    references coder
    (coder_id) 
    constraint season_rank_coder_fk;

alter table season_rank add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint season_rank_season_fk;



-- *** Create season_rank_history and its constraints ***

create table season_rank_history (
  coder_id decimal(10,0),
  season_id decimal(6,0),
  round_id decimal(10,0),
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

alter table season_rank_history add constraint primary key 
    (coder_id, season_id, round_id)
    constraint seasonrankhistory_pk;

alter table season_rank_history add constraint foreign key 
    (coder_id)
    references coder
    (coder_id) 
    constraint season_rank_history_coder_fk;


alter table season_rank_history add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint season_rank_history_season_fk;


-- *** Create country_rank and its constraints ***

create table country_rank (
  country_code VARCHAR(3),
  member_count DECIMAL(7,0), 
  rating DECIMAL(9,4),
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4),
  algo_rating_type_id DECIMAL(3,0),
)
extent size 64 next size 64
lock mode page;

alter table country_rank add constraint primary key 
    (country_code, algo_rating_type_id)
     constraint country_rank_pk;
     
alter table country_rank add constraint foreign key
    (country_code)
    references country
    (country_code)
    constraint country_rank_country_code_fk;
     
     
-- *** Create country_rank_history and its constraints ***

create table country_rank_history (
  country_code VARCHAR(3),
  round_id decimal(10,0),
  algo_rating_type_id DECIMAL(3,0),
  member_count DECIMAL(7,0), 
  rating DECIMAL(9,4), 
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;


alter table country_rank_history add constraint primary key 
    (country_code, round_id, algo_rating_type_id)
     constraint country_rank_history_pk;
     
alter table country_rank_history add constraint foreign key
    (country_code)
    references country
    (country_code)
    constraint country_rank_history_country_code_fk;
          
          
alter table country_rank_history add constraint foreign key
    (round_id)
    references round
    (round_id)
    constraint country_rank_history_fk;
          
          
-- *** Create season_country_rank and its constraints ***

create table season_country_rank (
  country_code VARCHAR(3),
  season_id decimal(6,0),
  member_count DECIMAL(7,0), 
  rating DECIMAL(9,4),
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

alter table season_country_rank add constraint primary key 
    (season_id, country_code)
     constraint season_country_rank_pk;
     
alter table season_country_rank add constraint foreign key
    (country_code)
    references country
    (country_code)
    constraint season_country_rank_country_code_fk;

alter table season_country_rank add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint season_country_rank_season_fk;
     
     
-- *** Create season_country_rank_history and its constraints ***

create table season_country_rank_history (
  country_code VARCHAR(3),
  season_id decimal(6,0),
  round_id decimal(10,0),
  member_count DECIMAL(7,0), 
  rating DECIMAL(9,4),
  rank DECIMAL(7,0),
  percentile DECIMAL(7,4)
)
extent size 64 next size 64
lock mode page;

alter table season_country_rank_history add constraint primary key 
    (season_id, country_code, round_id)
     constraint season_country_rank_history_pk;
     
alter table season_country_rank_history add constraint foreign key
    (country_code)
    references country
    (country_code)
    constraint season_country_rank_history_country_code_fk;
          
          
alter table season_country_rank_history add constraint foreign key
    (round_id)
    references round
    (round_id)
    constraint season_country_rank_history_fk;
                    
alter table season_country_rank_history add constraint foreign key 
    (season_id)
    references season
    (season_id) 
    constraint season_country_rank_history_season_fk;
                    
                    
--- *** Add algo_rating_type_id column in some rank tables ***

-- algo_rating_type_id is added for differentiating HS/regular ratings.
-- Note that season oriented tables don't need that column because the season already belongs to HS or regular

alter table coder_rank add algo_rating_type_id DECIMAL(3,0);
alter table coder_rank_history add algo_rating_type_id DECIMAL(3,0);
alter table state_coder_rank add algo_rating_type_id DECIMAL(3,0);
alter table country_coder_rank add algo_rating_type_id DECIMAL(3,0);


alter table coder_rank add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint coder_rank_algo_rating_type_fk;
        
alter table coder_rank_history add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint coder_rank_history_algo_rating_type_fk;

alter table state_coder_rank add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint state_coder_rank_algo_rating_type_fk;

alter table country_coder_rank add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint country_coder_rank_algo_rating_type_fk;
        
        
-- *** add a PK to old coder_rank tables, including algo_rating_type_id ***

alter table coder_rank add constraint primary key
    (coder_id, coder_rank_type_id, algo_rating_type_id) 
constraint coder_rank_pkey;


alter table coder_rank_history add constraint primary key
    (coder_id, round_id, coder_rank_type_id, algo_rating_type_id) 
constraint coder_rank_history_pkey;


alter table state_coder_rank add constraint primary key
    (coder_id, coder_rank_type_id, algo_rating_type_id) 
constraint state_coder_rank_pkey;


alter table country_coder_rank add constraint primary key
    (coder_id, coder_rank_type_id, algo_rating_type_id) 
constraint country_coder_rank_pkey;
        