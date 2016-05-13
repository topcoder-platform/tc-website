CREATE DATABASE studio_oltp IN datadbs WITH BUFFERED LOG;
database studio_oltp; 

grant dba to informix ;
grant connect to coder ; 

create table 'informix'.contest (
    contest_id DECIMAL(10,0) not null,
    name VARCHAR(254) not null,
    start_time DATETIME YEAR TO FRACTION,
    end_time DATETIME YEAR TO FRACTION,
    contest_status_id DECIMAL(3,0),
    forum_id INT,
    event_id DECIMAL(10,0),
    project_id INT,
    contest_channel_id DECIMAL(3,0),
    contest_type_id DECIMAL(3,0),
    tc_direct_project_id INT,
    create_user_id DECIMAL(10,0),
    winner_announcement_time DATETIME YEAR TO FRACTION,
    contest_detailed_status_id INT,
    launch_immediately DECIMAL(1,0),
    deleted DECIMAL(1,0)
)
extent size 84 next size 16
lock mode page;

alter table 'informix'.contest add constraint primary key 
	(contest_id)
	constraint contest_pk;
	
	
create table 'informix'.dual (
    value INT
)
extent size 64 next size 64
lock mode row;
