

--common oltp
create table registration_type_lu (
    registration_type_id DECIMAL(3,0),
    registration_type_name VARCHAR(200),
    registration_type_desc LVARCHAR(1000),
    active_ind decimal(1,0) default 1,
    security_group_id decimal(12,0)
)
extent size 16 next size 16
lock mode row;

alter table registration_type_lu add constraint primary key 
	(registration_type_id)
	constraint registrationtypelu_pkey;

alter table registration_type_lu add constraint foreign key 
	(security_group_id)
	references security_groups
	(group_id) 
	constraint regtype_securitygroup_fkey;

insert into registration_type_lu values (1, 'Competition Registration', 'Some long test', 1, 10); 
insert into registration_type_lu values (2, 'Corporate Registration', 'Some long test', 1, 2000116); 
insert into registration_type_lu values (3, 'High School Competition Registration', 'Some long test', 1, 12); 
insert into registration_type_lu values (4, 'Minimal Registration', 'Some long test', 1, 11);
insert into registration_type_lu values (5, 'TopCoder Software Registration', 'Some long test', 1, 2); 


insert into security_groups values (10, 'Competition User', 132456);
insert into security_groups values (11, 'Minimal User', 132456);
insert into security_groups values (12, 'HS Competition User', 132456);

alter table registration_type_lu add sort decimal(3,0); 

update registration_type_lu set sort = 10 where registration_type_id = 1;
update registration_type_lu set sort = 20 where registration_type_id = 3;
update registration_type_lu set sort = 40 where registration_type_id = 2;
update registration_type_lu set sort = 30 where registration_type_id = 5;
update registration_type_lu set sort = 50 where registration_type_id = 4;