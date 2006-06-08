-- drop some deprecated columns
alter table coder drop terms;
alter table current_school drop school_name;
alter table current_school drop degree_number;


-- algo_rating_type_id column is added in some tables for differentiating HS/regular ratings

alter table round_type_lu add algo_rating_type_id DECIMAL(3,0);

update round_type_lu set algo_rating_type_id = 1 where round_type_id in (1,2,10);
update round_type_lu set algo_rating_type_id = 2 where round_type_id in (17,18);
        
alter table round_type_lu add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint round_type_lu_algo_rating_type_fk;



alter table coder_division add algo_rating_type_id DECIMAL(3,0);

alter table coder_division add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint coder_division_algo_rating_type_fk;

alter table coder_division drop constraint coder_division_pk;

alter table coder_division add constraint primary key 
	(coder_id, division_id, algo_rating_type_id)
	constraint coder_division_pk;        


-- *** This view gives the total points for a team in a round
create view view_team_points(team_id, round_id, total_team_points) as
select team_id,  round_id, sum(team_points)  
from room_result
where team_id is not null
group by team_id, round_id
having sum(team_points) > 0

-- give permissions to coder on that view   
grant select on view_team_points to coder;


-- alter those columns to remove NOT NULL constraint
alter table school modify sort_letter CHAR(1) ;
alter table school modify city VARCHAR(50); 
alter table school modify country_code VARCHAR(3);


-- *** Create team_coder_xref table and its constraints

create table team_coder_xref (
    team_id DECIMAL(10,0) not null,
    coder_id DECIMAL(10,0) not null
)
extent size 64 next size 64;

alter table team_coder_xref add constraint primary key 
    (team_id, coder_id)
    constraint team_coder_xref_pkey;

alter table team_coder_xref add constraint foreign key 
    (team_id)
    references team
    (team_id) 
    constraint team_coder_xref_team_fk;

alter table team_coder_xref add constraint foreign key 
    (coder_id)
    references coder
    (coder_id) 
    constraint team_coder_xref_coder_fk;
    
    
--- *** Create table team_round and its constraints

create table team_round (
    round_id DECIMAL(10,0),
    team_id DECIMAL(10,0),
    problems_presented DECIMAL(6,0),
    problems_opened DECIMAL(6,0),
    problems_submitted DECIMAL(6,0),
    problems_correct DECIMAL(6,0),
    problems_failed_by_system_test DECIMAL(6,0),
    problems_failed_by_challenge DECIMAL(6,0),
    problems_left_open DECIMAL(6,0),
    challenge_attempts_made DECIMAL(6,0),
    challenges_made_successful DECIMAL(6,0),
    challenges_made_failed DECIMAL(6,0),
    challenge_attempts_received DECIMAL(6,0),
    challenges_received_successful DECIMAL(6,0),
    challenges_received_failed DECIMAL(6,0),    
    average_points DECIMAL(12,2),
    point_standard_deviation DECIMAL(14,7),
    challenge_points DECIMAL(12,2),
    system_test_points DECIMAL(12,2),
    submission_points DECIMAL(12,2),
    final_points DECIMAL(7,2),
    defense_points DECIMAL(12,2),
    num_coders DECIMAL(6,0), 
    team_points DECIMAL(6,0), 
    team_placed DECIMAL(6,0)
);

alter table team_round add constraint primary key 
    (round_id, team_id)
    constraint team_round_pkey;
    
alter table team_round add constraint foreign key 
    (team_id)
    references team
    (team_id) 
    constraint team_round_team_fk;
    
alter table team_round add constraint foreign key 
    (round_id)
    references round
    (round_id) 
    constraint team_round_round_fk;
    
    
--- *** add algo_rating_type_id column to coder_level table ***        
alter table coder_level add algo_rating_type_id DECIMAL(3,0);

alter table coder_level add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint coder_level_algo_rating_type_fk;

alter table coder_level drop constraint coder_level_pk;

update coder_level set algo_rating_type_id = 1;

alter table coder_level add constraint primary key 
    (coder_id, division_id, level_id, algo_rating_type_id)
    constraint coder_level_pk; 
    
    
--- *** add algo_rating_type_id column to coder_problem_summary table ***     
alter table coder_problem_summary add algo_rating_type_id DECIMAL(3,0);

alter table coder_problem_summary add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint coder_problem_summary_algo_rating_type_fk;

alter table coder_problem_summary drop constraint coder_problem_summarya_pk;

update coder_problem_summary set algo_rating_type_id = 1;

alter table coder_problem_summary add constraint primary key 
    (coder_id, algo_rating_type_id)
constraint coder_problem_summarya_pk;    