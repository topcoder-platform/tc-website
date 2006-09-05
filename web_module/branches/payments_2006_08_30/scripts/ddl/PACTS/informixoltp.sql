create table payment_reference_lu (
    payment_reference_id DECIMAL(3,0),
    database_name VARCHAR(30) NOT NULL,
    table_name VARCHAR(30) NOT NULL,
    field_name VARCHAR(30) NOT NULL
);


alter table payment_reference_lu add constraint primary_key
    (payment_reference_id) constraint payment_reference_lu_pk;
    
insert into payment_reference_lu(payment_reference_id, database_name, table_name, field_name)
values(1, 'informix_oltp', 'round', 'round_id');

insert into payment_reference_lu(payment_reference_id, database_name, table_name, field_name)
values(2, 'informix_oltp', 'project', 'project_id');

insert into payment_reference_lu(payment_reference_id, database_name, table_name, field_name)
values(3, 'informix_oltp', 'problem', 'problem_id');

insert into payment_reference_lu(payment_reference_id, database_name, table_name, field_name)
values(4, 'informix_oltp', 'contest', 'contest_id');


alter table payment_type_lu add payment_reference_id DECIMAL(3,0);


alter table payment_type_lu add constraint foreign key 
    (payment_reference_id)
    references payment_reference_lu(payment_reference_id);


insert into payment_type_lu(payment_type_id, payment_type_desc)
values(9, 'Article Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(10, 'Assembly Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(11, 'Testing Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(12, 'Logo Contest Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(13, 'TopCoder Studio Contest Payment', 4);

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(14, 'Problem Testing Payment', 3);

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(15, 'Problem Writing Payment', 3);

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(16, 'CCIP Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(17, 'Digital Run Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(18, 'Tournament Bouns Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(19, 'Royalty Payment');

update payment_type_lu set payment_type_desc='Algorithm Contest Payment', payment_reference_id = 1
where payment_type_id = 1;

update payment_type_lu set payment_reference_id = 2
where payment_type_id in (6,7);
