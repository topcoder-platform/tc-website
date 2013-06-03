--informixoltp
insert into demographic_answer values (18, 185, '2002', 10, 'I');
update demographic_response set demographic_answer_id = 185 where demographic_answer_id = 127 and demographic_question_id = 18;
delete from demographic_answer where demographic_answer_id = 127 and demographic_question_id = 18;


--common
create table 'informix'.demographic_question (
    demographic_question_id DECIMAL(10,0),
    demographic_question_text VARCHAR(255),
    selectable VARCHAR(1),
    demographic_question_desc VARCHAR(255)
)
extent size 64 next size 64
lock mode row;

alter table 'informix'.demographic_question add constraint primary key 
	(demographic_question_id)
	constraint demographic_question_pkey;


create table 'informix'.demographic_answer (
    demographic_answer_id DECIMAL(10,0),
    demographic_question_id DECIMAL(10,0),
    demographic_answer_text VARCHAR(255),
    sort DECIMAL(10,0),
    status VARCHAR(1)
)
extent size 64 next size 64
lock mode row;

alter table 'informix'.demographic_answer add constraint primary key 
	(demographic_answer_id)
	constraint demographic_answer_pkey;

alter table 'informix'.demographic_answer add constraint foreign key 
	(demographic_question_id)
	references 'informix'.demographic_question
	(demographic_question_id) 
	constraint demoanswer_demoquestion_fk;



create table 'informix'.demographic_response (
    user_id DECIMAL(10,0),
    demographic_answer_id DECIMAL(10,0),
    demographic_response VARCHAR(255),
    demographic_question_id DECIMAL(10,0)
)
extent size 40000 next size 15000
lock mode row;

create index 'informix'.demographic_response_idx1 on 'informix'.demographic_response
	(
	demographic_question_id, 
	demographic_answer_id, 
	user_id
	);

alter table 'informix'.demographic_response add constraint foreign key 
	(user_id)
	references 'informix'.user
	(user_id) 
	constraint demoresponse_user_fk;

alter table 'informix'.demographic_response add constraint foreign key 
	(demographic_question_id)
	references 'informix'.demographic_question
	(demographic_question_id) 
	constraint demoresponse_demoquestion_fk;


--informix
insert into common_oltp:demographic_question (demographic_question_id, demographic_question_text, selectable, demographic_question_desc)
select demographic_question_id, demographic_question_text, selectable, demographic_question_desc
from demographic_question;

insert into hs_common_oltp:demographic_answer (demographic_answer_id, demographic_question_id, demographic_answer_text, sort, status)
select demographic_answer_id, demographic_question_id, demographic_answer_text, sort, status
from demographic_answer;



--informix
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 13;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 1;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 2;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 3;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 4;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 5;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 6;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 7;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 8;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 9;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 10;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 11;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 12;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 14;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 15;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 16;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 17;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 18;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 19;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 20;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 21;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 22;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 24;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 23;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 25;
insert into hs_common_oltp:demographic_response (user_id, demographic_answer_id, demographic_response, demographic_question_id)
select coder_id,demographic_answer_id, demographic_response, demographic_question_id
from demographic_response where demographic_question_id = 26;


--move the school stuff so it's below the other stuff
update demographic_assignment set sort = 1500 where demographic_question_id = 17 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1510 where demographic_question_id = 14 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1520 where demographic_question_id = 16 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1530 where demographic_question_id = 18 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1540 where demographic_question_id = 23 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1550 where demographic_question_id = 19 and coder_type_id = 1 and registration_type_id = 1;
update demographic_assignment set sort = 1560 where demographic_question_id = 22 and coder_type_id = 1 and registration_type_id = 1;

--remove the school name unlisted question
update demographic_assignment set status = 'I' where demographic_question_id = 20;  

--hs demographics
insert into demographic_assignment values (1, 1, 3, 100, 'A', 1);
insert into demographic_assignment values (18, 1, 3, 200, 'A', 1);
insert into demographic_assignment values (23, 1, 3, 300, 'A', 1);
insert into demographic_assignment values (26, 1, 3, 400, 'A', 1);

--helper for mulitselect question
update demographic_question set demographic_question_desc = 'Choose all that apply' where demographic_question_id = 19

--don't require the employer question
update demographic_assignment set is_required = 0 where demographic_question_id = 15
update demographic_assignment set is_required = 0 where demographic_question_id = 22