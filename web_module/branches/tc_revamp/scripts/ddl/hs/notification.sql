create table notify_lu (
    notify_id DECIMAL(5,0) not null,
    name VARCHAR(255),
    status VARCHAR(3),
    sort DECIMAL(5,0)
)
extent size 32 next size 32
lock mode row;

alter table notify_lu add constraint primary key 
	(notify_id)
	constraint notify_lu_pk;

create table user_notify_xref (
    user_id DECIMAL(10,0) not null,
    notify_id DECIMAL(5,0) not null
)
extent size 5000 next size 2000
lock mode row;

alter table user_notify_xref add constraint primary key 
	(user_id, notify_id)
	constraint usernotifyxref_pk;

alter table user_notify_xref add constraint foreign key 
	(notify_id)
	references notify_lu
	(notify_id) 
	constraint usernotifyxref_notifylu_fk;

alter table user_notify_xref add constraint foreign key 
	(user_id)
	references user
	(user_id) 
	constraint usernotifyxref_user_fk;

create table registration_type_notify_xref (
    registration_type_id DECIMAL(3,0) not null,
    notify_id DECIMAL(5,0) not null
)
extent size 32 next size 32
lock mode row;

alter table registration_type_notify_xref add constraint primary key 
	(registration_type_id, notify_id)
	constraint regtypenotifyxref_pk;

alter table registration_type_notify_xref add constraint foreign key 
	(notify_id)
	references notify_lu
	(notify_id) 
	constraint regtypexref_notifylu_fk;

alter table registration_type_notify_xref add constraint foreign key 
	(registration_type_id)
	references registration_type_lu
	(registration_type_id) 
	constraint regtypexref_notify_fk;


insert into notify_lu
select * from hs_informixoltp:notify_lu;

insert into user_notify_xref
select coder_id, notify_id from hs_informixoltp:coder_notify where coder_id in (select user_id from user);

insert into notify_lu values (7, 'Next High School Competition', 'A', 15);
insert into notify_lu values (8, 'High School News and Events', 'A', 55);
insert into notify_lu values (9, 'Products and Services', 'A', 70);

insert into registration_type_notify_xref values (1,1);
insert into registration_type_notify_xref values (1,3);
insert into registration_type_notify_xref values (1,4);
insert into registration_type_notify_xref values (1,5);

insert into registration_type_notify_xref values (3,7);
insert into registration_type_notify_xref values (3,8);

insert into registration_type_notify_xref values (5,9);





drop table informixoltp:coder_notify;
drop table informixoltp:notify_lu;

create synonym notify_lu
for hs_common_oltp:notify_lu;
create synonym registration_type_notify_xref
for hs_common_oltp:registration_type_notify_xref;
create synonym user_notify_xref
for hs_common_oltp:user_notify_xref;
create synonym registration_type_lu
for hs_common_oltp:registration_type_lu;


