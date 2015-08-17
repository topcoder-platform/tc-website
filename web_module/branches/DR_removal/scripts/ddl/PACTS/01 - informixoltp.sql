create table payment_reference_lu (
    payment_reference_id DECIMAL(3,0),
    reference_field_name VARCHAR(30) NOT NULL
);


alter table payment_reference_lu add constraint primary key
    (payment_reference_id) constraint payment_reference_lu_pk;
    
insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(1, 'algorithm_round_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(2, 'component_project_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(3, 'algorithm_problem_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(4, 'studio_contest_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(5, 'component_contest_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(6, 'digital_run_stage_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(7, 'digital_run_season_id');

insert into payment_reference_lu(payment_reference_id, reference_field_name)
values(8, 'parent_payment_id');

alter table payment_type_lu add payment_reference_id DECIMAL(3,0);
alter table payment_type_lu add show_in_profile_ind DECIMAL(1,0) default 1 not null;
alter table payment_type_lu add show_details_ind DECIMAL(1,0) default 1 not null;
alter table payment_type_lu add due_date_interval DECIMAL(3,0) default 15 not null;


alter table payment_type_lu add constraint foreign key 
    (payment_reference_id)
    references payment_reference_lu(payment_reference_id);


alter table payment_type_lu add 
    create_date DATETIME YEAR TO FRACTION default current not null;
    
alter table payment_type_lu add 
    modify_date DATETIME YEAR TO FRACTION default current not null;

create trigger "informix".trig_payment_type_modified 
update of payment_type_desc, show_in_profile_ind, show_details_ind,
payment_reference_id, due_date_interval 
on "informix".payment_type_lu referencing old as old for each row
(update "informix".payment_type_lu 
 set "informix".payment_type_lu.modify_date = CURRENT year to fraction(3) 
 where (payment_type_id = old.payment_type_id)
);
select * from payment_type_lu order by payment_type_id

--insert into payment_type_lu(payment_type_id, payment_type_desc)
--values(9, 'Article Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(10, 'Assembly Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(11, 'Testing Payment');

--insert into payment_type_lu(payment_type_id, payment_type_desc)
--values(12, 'Logo Contest Payment');

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(13, 'TopCoder Studio Contest Payment', 4);

update payment_type_lu set payment_reference_id = 4 where payment_type_id = 13;

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(14, 'Problem Testing Payment', 3);

update payment_type_lu set payment_reference_id = 3 where payment_type_id = 14;

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(15, 'Problem Writing Payment', 3);

update payment_type_lu set payment_reference_id = 3 where payment_type_id = 15;

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(16, 'CCIP Payment');

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(17, 'Digital Run Prize Payment', 6);

update payment_type_lu set payment_reference_id = 6 where payment_type_id = 17;

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(18, 'Digital Run Prize Rockie Payment', 7);

update payment_type_lu set payment_reference_id = 7 where payment_type_id = 18;

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(19, 'Component Tournament Bonus Payment', 5);

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(20, 'Royalty Payment');

--insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
--values(21, 'Marathon Match Payment', 1);

update payment_type_lu set payment_reference_id = 1 where payment_type_id = 21;

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(22, 'Algorithm Tournament Prize Payment', 1);

--insert into payment_type_lu(payment_type_id, payment_type_desc)
--values(23, 'Bug Fixes Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc)
values(24, 'Reliability Bonus Payment');

insert into payment_type_lu(payment_type_id, payment_type_desc, payment_reference_id)
values(25, 'Digital Run Top Third Payment', 6);

update payment_type_lu set payment_type_desc='Algorithm Contest Payment', payment_reference_id = 1
where payment_type_id = 1;

update payment_type_lu set payment_reference_id = 2
where payment_type_id in (6,7);


update payment_type_lu set due_date_interval = 60
where payment_type_id in (19,22);

update payment_type_lu set show_in_profile_ind = 0
where payment_type_id not in (1,5,6,17,19,20,22,25);

update payment_type_lu set show_details_ind = 0
where payment_type_id = 20;

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax.SelectPaymentTypeReference', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax.FillPaymentData', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ViewPayment', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.AddAffidavit', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.UpdateAffidavit', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.EditPayment', 132456,1);

insert into security_perms (role_id, permission, create_user_id, security_status_id)
values(2003, 'com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.Login', 132456,1);

alter table payment_detail add algorithm_round_id DECIMAL(10,0);
alter table payment_detail add algorithm_problem_id DECIMAL(10,0);
alter table payment_detail add component_contest_id DECIMAL(10,0);
alter table payment_detail add component_project_id DECIMAL(10,0);
alter table payment_detail add studio_contest_id DECIMAL(10,0);
alter table payment_detail add digital_run_stage_id DECIMAL(10,0);
alter table payment_detail add digital_run_season_id DECIMAL(10,0);
alter table payment_detail add parent_payment_id DECIMAL(10,0);


alter table payment_detail add constraint foreign key (algorithm_round_id)
    references round(round_id)
        constraint paymentdetail_algorithm_round_id_fk;


alter table payment_detail add constraint foreign key (algorithm_problem_id)
    references problem(problem_id)
        constraint paymentdetail_algorithm_problem_id_fk;


insert into modification_rationale_lu(modification_rationale_id, modification_rationale_desc)
values (9, 'Reference Change');

insert into modification_rationale_lu(modification_rationale_id, modification_rationale_desc)
values (10, 'Description Change');

insert into modification_rationale_lu(modification_rationale_id, modification_rationale_desc)
values (11, 'Multiple fields Change');


insert into status_lu(status_id, status_desc, status_type_id)
values(69, 'Deleted', 53);


insert into status_type_lu(status_type_id, status_type_desc) values (999, 'DEPRECATED STATUSES');

update status_lu set status_type_id = 999 where status_id = 66;

