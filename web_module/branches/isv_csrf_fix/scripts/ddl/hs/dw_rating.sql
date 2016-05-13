-- This script updates the rating tables in Data Warehouse.
--
-- Table rating and rating_history are "renamed" to algo_rating and algo_rating_history respectively, and views are created
-- with the old names to maintain compatibility.
-- 
-- Those tables are created with their constraints:
--      season_algo_rating
--
-- May 2006 by cucu 




-- *** "rename" rating to algo_rating ***

-- move all the data from rating to algo_rating, assuming that all existing data is for regular (non high school) competitions.

insert into algo_rating (coder_id, rating, vol, num_ratings, algo_rating_type_id, algo_rating_type_desc, highest_rating, lowest_rating, first_rated_round_id, last_rated_round_id, num_competitions)
select coder_id, rating,  vol, num_ratings, 1, 'TopCoder Rating', highest_rating, lowest_rating, first_rated_round_id, last_rated_round_id, num_competitions
from rating;

-- bye bye to rating table

drop table rating;


-- create the rating view that should be similar to what rating used to have

create view rating (coder_id,rating,num_ratings,
       vol,rating_no_vol, 
       highest_rating, lowest_rating,
       first_rated_round_id, last_rated_round_id,
       num_competitions) as
   select x0.coder_id ,x0.rating ,x0.num_ratings ,
       x0.vol ,x0.vol,
       x0.highest_rating, x0.lowest_rating,
       x0.first_rated_round_id, x0.last_rated_round_id,
       x0.num_competitions
   from "informix".algo_rating x0 
   where (x0.algo_rating_type_id = 1.);


-- give permissions to coder on rating view   
grant delete, insert, update, select on rating to coder;


-- *** "rename" rating_history to algo_rating_history ***
create table algo_rating_history (
    coder_id DECIMAL(10,0),
    round_id DECIMAL(10,0),
    algo_rating_type_id DECIMAL(3,0),
    rating DECIMAL(5,0),
    vol DECIMAL(5,0),
    num_ratings DECIMAL(6,0)
)
extent size 50000 next size 25000
lock mode page;

alter table algo_rating_history add constraint foreign key 
    (coder_id)
    references 'informix'.coder
    (coder_id) 
    constraint algo_rating_history_coder_fk;

alter table algo_rating_history add constraint foreign key 
    (round_id)
    references 'informix'.round
    (round_id) 
    constraint algo_rating_history_round_fk;


-- Copy all the data in rating_history to algo_rating_history
insert into algo_rating_history(coder_id, round_id, rating, vol, num_ratings, algo_rating_type_id)
select coder_id, round_id, rating, vol, num_ratings, 1
from rating_history

-- bye bye rating_history table
drop table rating_history;

-- Create a view to simulate old behaviour
create view rating_history (coder_id, round_id, rating, vol, num_ratings)
 as 
   select x0.coder_id, x0.round_id, x0.rating, x0.vol, x0.num_ratings
   from algo_rating_history x0 
   where (x0.algo_rating_type_id = 1.);


-- give permissions to coder on rating_history view   
grant delete, insert, update, select on rating_history to coder;


-- *** Create season_algo_rating and its constraints ***

create table season_algo_rating (
  coder_id DECIMAL(10,0),
  season_id decimal(6,0),
  rating DECIMAL(5,0) default 0,
  vol DECIMAL(5,0) default 0,
  num_ratings DECIMAL(6,0),  
  highest_rating DECIMAL(5,0),
  lowest_rating DECIMAL(5,0),
  first_rated_round_id DECIMAL(10,0),
  last_rated_round_id DECIMAL(10,0),
  num_competitions DECIMAL(7,0)
)
extent size 5000 next size 2000
lock mode row;

alter table season_algo_rating add constraint primary key 
    (coder_id, season_id)
    constraint season_algo_rating_pkey;

alter table season_algo_rating add constraint foreign key 
    (coder_id)
    references coder
    (coder_id) 
    constraint season_algo_rating_coder_fk;

alter table 'informix'.season_algo_rating add constraint foreign key 
    (first_rated_round_id)
    references 'informix'.round
    (round_id) 
    constraint season_algo_rating_first_rated_round_fk;

alter table 'informix'.season_algo_rating add constraint foreign key 
    (last_rated_round_id)
    references 'informix'.round
    (round_id) 
    constraint season_algo_rating_last_rated_round_fk;
                    
                    
                    