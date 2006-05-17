-- drop some deprecated columns
alter table coder drop terms;
alter table current_school drop school_name;
alter table current_school drop degree_number;


-- algo_rating_type_id column is added in some tables for differentiating HS/regular ratings

alter table round_type_lu add algo_rating_type_id DECIMAL(3,0);

update round_type_lu set algo_rating_type_id = 1 where round_type_id in (1,2);
update round_type_lu set algo_rating_type_id = 2 where round_type_id in (17,18);
        
alter table round_type_lu add constraint foreign key (algo_rating_type_id) 
        references algo_rating_type_lu (algo_rating_type_id)
        constraint round_type_lu_algo_rating_type_fk;



-- *** This view gives the total points for a team in a round
create view view_team_points(team_id, round_id, total_team_points) as
select team_id,  round_id, sum(team_points)  
from room_result
where team_id is not null
group by team_id, round_id

-- give permissions to coder on that view   
grant select on view_team_points to coder;


