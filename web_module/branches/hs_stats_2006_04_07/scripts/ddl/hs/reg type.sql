--common oltp
create table registration_type_lu (
    registration_type_id DECIMAL(3,0),
    registration_type_desc VARCHAR(200),
    active_ind decimal(1,0) default 1
)
extent size 16 next size 16
lock mode row;

alter table registration_type_lu add constraint primary key 
	(registration_type_id)
	constraint registrationtypelu_pkey;

insert into registration_type_lu values (1, 'Competition Registration', 1); 
insert into registration_type_lu values (2, 'Corporate Registration', 1); 
insert into registration_type_lu values (3, 'High School Competition Registration', 1); 
insert into registration_type_lu values (4, 'Minimal Registration', 1);
insert into registration_type_lu values (5, 'TopCoder Software Registration', 1); 


alter table registration_type_lu add security_group_id decimal(12,0);
alter table registration_type_lu add constraint foreign key 
	(security_group_id)
	references security_groups
	(group_id) 
	constraint regtype_securitygroup_fkey;


insert into security_groups values (10, 'Competition User', 132456);
insert into security_groups values (11, 'Minimal User', 132456);
insert into security_groups values (12, 'HS Competition User', 132456);

update registration_type_lu set active_ind = 1, security_group_id = 10 where registration_type_id = 1;
update registration_type_lu set active_ind = 1, security_group_id = 2000116 where registration_type_id = 2;
update registration_type_lu set active_ind = 1, security_group_id = 12 where registration_type_id = 3;
update registration_type_lu set active_ind = 1, security_group_id = 11 where registration_type_id = 4;
update registration_type_lu set active_ind = 1, security_group_id = 2 where registration_type_id = 5;


