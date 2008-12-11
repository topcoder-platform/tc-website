
create table security_status_lu (
    security_status_id DECIMAL(3,0),
    status_desc VARCHAR(200)
)
extent size 16 next size 16
lock mode row;

alter table security_status_lu add constraint primary key 
	(security_status_id)
	constraint securitystatuslu_pkey;

insert into security_status_lu values (1, 'Active'); 
insert into security_status_lu values (2, 'Inactive');

alter table security_perms add security_status_id decimal (3,0); 
alter table user_group_xref add security_status_id decimal (3,0); 
alter table user_role_xref add security_status_id decimal (3,0);
alter table group_role_xref add security_status_id decimal (3,0);

alter table security_perms add constraint foreign key 
	(security_status_id)
	references security_status_lu
	(security_status_id) 
	constraint securityperms_status_fk;
alter table user_group_xref add constraint foreign key 
	(security_status_id)
	references security_status_lu
	(security_status_id) 
	constraint usergroupxref_status_fk;
alter table user_role_xref add constraint foreign key 
	(security_status_id)
	references security_status_lu
	(security_status_id) 
	constraint userrolexref_status_fk;
alter table group_role_xref add constraint foreign key 
	(security_status_id)
	references security_status_lu
	(security_status_id) 
	constraint grouprolexref_status_fk;

update security_perms set security_status_id = 1;
update user_group_xref set security_status_id = 1; 
update user_role_xref set security_status_id = 1; 
update group_role_xref set security_status_id = 1; 

--in informixoltp
create synonym user_group_xref
for hs_common_oltp:user_group_xref

create synonym security_groups
for hs_common_oltp:security_groups

create synonym security_roles
for hs_common_oltp:security_roles;

create synonym security_perms
for hs_common_oltp:security_perms;

create synonym user_role_xref
for hs_common_oltp:user_role_xref;

create synonym group_role_xref
for hs_common_oltp:group_role_xref;




