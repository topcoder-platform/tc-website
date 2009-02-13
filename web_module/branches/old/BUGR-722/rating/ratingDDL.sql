--begin ratings history
create table 'coder'.tcs_ratings_history (
    score DECIMAL(5,2) not null,
    vol DECIMAL(10) not null,
    rating DECIMAL(10) not null,
    timestamp DATETIME YEAR TO FRACTION not null,
    level_id DECIMAL(18) not null,
    phase_id DECIMAL(18) not null
)
extent size 32 next size 32
lock mode page;
alter table 'coder'.tcs_ratings_history add constraint foreign key 
	(phase_id)
	references 'informix'.phase
	(phase_id) 
	constraint fk_tcs_ratings_662;
alter table 'coder'.tcs_ratings_history add constraint foreign key 
	(level_id)
	references 'informix'.comp_level
	(level_id) 
	constraint fk_tcs_ratings_815;
--end ratings history

create table user_component_score (
user_component_score_id DECIMAL(10) not null,
user_id                 DECIMAL(10)  not null,
level_id                   DECIMAL(4)  not null,
comp_vers_id            DECIMAL(10)  not null,
phase_id                   DECIMAL(3)  not null,
score                   DECIMAL(5,2)  not null,
money                   DECIMAL(10,2)  DEFAULT 0 not null,
processed               DECIMAL default 0 not null,
rating                  DECIMAL(10) ,
place                   DECIMAL (4) ,
submission_date         DATETIME YEAR TO DAY,
mod_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
create_date_time        DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
primary key (user_component_score_id)
      constraint PK_USER_COMP_SCORE_ID
);

--dw version
create table user_component_score (
user_component_score_id DECIMAL(10) not null,
component_id            DECIMAL(10) not null,
component_name          VARCHAR(255) not null,
user_id                 DECIMAL(10) not null,
level_id                   DECIMAL(4) not null,
comp_vers_id            DECIMAL(10) not null,
phase_id                   DECIMAL(3) not null,
score                   DECIMAL(5,2) not null,
money                   DECIMAL(10,2) DEFAULT 0 not null ,
processed               DECIMAL default 0 not null,
rating                  DECIMAL(10),
place                   DECIMAL(4) ,
submission_date         DATETIME YEAR TO DAY not null,
mod_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
create_date_time        DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
primary key (user_component_score_id)
      constraint PK_USER_COMP_SCORE_ID
);



create table user_rating (
user_id          DECIMAL(10) not null,
rating           DECIMAL(10) DEFAULT 0 not null,
phase_id         DECIMAL(3) not null,
vol              DECIMAL(10) DEFAULT 0 not null,
rating_no_vol    DECIMAL(10) DEFAULT 0 not null,
num_ratings      DECIMAL(5) DEFAULT 0 not null ,
last_component_rated DECIMAL(10),
mod_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
create_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
primary key (user_id, phase_id)
      constraint PK_USER_RATING
)

create table user_rating_history (
user_id          DECIMAL(10) not null,
rating           DECIMAL(10) DEFAULT 0 not null,
phase_id         DECIMAL(3) not null,
vol              DECIMAL(10) not null,
rating_no_vol    DECIMAL(10) DEFAULT 0 not null,
num_ratings      DECIMAL(10) DEFAULT 0 not null,
last_component_rated DECIMAL(10),
mod_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null,
create_date_time    DATETIME YEAR TO FRACTION     DEFAULT CURRENT not null
);

create trigger rating_hist
  update on user_rating
  referencing old as old
  for each row (
  insert into user_rating_history(user_id, rating, phase_id, vol, rating_no_vol,
                                  num_ratings, last_component_rated, mod_date_time)
                           values(old.user_id, old.rating, old.phase_id, old.vol, 
                                  old.rating_no_vol,old.num_ratings, 
                                  old.last_component_rated, old.mod_date_time)
);

create table comp_vers_names (component_name varchar(255), 
component_id DECIMAL(10),
comp_vers_id DECIMAL(10))


load from "scores2.unl" insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, processed,
money,rating,submission_date,place,component_name, component_id)

unload to "scores2.unl" select s.user_component_score_id, s.user_id,
s.level_id, s.comp_vers_id, s.phase_id, s.score, s.processed, 
s.money,s.rating,s.submission_date,s.place, c.component_name, c.component_id from user_component_score s,
comp_versions cv, comp_catalog c
where c.component_id = cv.component_id
and cv.comp_vers_id = s.comp_vers_id

unload to "comps.unl" 
select component_name, c.component_id, comp_vers_id 
from comp_catalog c, comp_versions cv
where c.component_id = cv.component_id

load from "comps.unl" insert into comp_vers_names(component_name,
component_id, comp_vers_id)


SELECT 1, 
DECODE(phase_id,112,'Design',113,'Development'),
round(component_id),
submission_date,
component_name,
nvl(round(place), '-'), 
round(nvl(money, 0),2),
2,
round(score, 2)
FROM tcs_dw:user_component_score s
WHERE user_id = @cr@
ORDER BY @sc@ @sd@



unload to "tcs_ratings.unl"
select user_id,rating,phase_id,vol,num_ratings,rating_no_vol, last_component_rated from user_rating

load from "tcs_ratings.unl"
insert into user_rating(user_id,rating,phase_id,vol,num_ratings,rating_no_vol,last_component_rated)


load from "tcs_catalog_scores.unl" insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, processed,
money,rating,submission_date,place)

unload to "tcs_dw_scores.unl" select s.user_component_score_id, s.user_id,
s.level_id, s.comp_vers_id, s.phase_id, s.score, s.processed, 
s.money,s.rating,s.submission_date,s.place, component_id, component_name from user_component_score s

insert into user_component_rating(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place)
values(2, 261390, 200, 5703174, 113, 75.42, 144, TO_DATE('9/9/2003','%m/%d/%iY'), 1)

insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place)
values(2, 261390, 200, 5703174, 113, 75.42, 144, TO_DATE('9/9/2003','%m/%d/%iY'), 1)
    
insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place,component_name, component_id)
values(2, 261390, 200, 5703174, 113, 75.42, 144, TO_DATE('9/9/2003','%m/%d/%iY'), 1,'File Delta', 5703170)


insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place,
component_name, component_id)
values(3,153089,100,6403450, 113, 88.24,96,TO_DATE('11/3/2003','%m/%d/%iY'), 1,
'Authentication Factory', 6403441);

insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place)
values(3,153089,100,6403450, 113, 88.24,96,TO_DATE('11/3/2003','%m/%d/%iY'), 1)

insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place)
values(4,299904,100,7409568, 113, 92.08,115,TO_DATE('11/3/2003','%m/%d/%iY'), 1)

insert into user_component_score(user_component_score_id, user_id,
level_id, comp_vers_id, phase_id, score, money, submission_date, place)
values(4,299904,100,7409568, 113, 92.08,115,TO_DATE('11/3/2003','%m/%d/%iY'), 1)

