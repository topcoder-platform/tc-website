database common_oltp;

-- update terms_of_use related tables schema
ALTER TABLE terms_of_use ADD title VARCHAR(50);
ALTER TABLE terms_of_use ADD electronically_signable decimal(1,0);
ALTER TABLE terms_of_use ADD url VARCHAR(100);

update terms_of_use set electronically_signable = 1;
ALTER TABLE terms_of_use MODIFY electronically_signable decimal(1,0) NOT NULL;

update terms_of_use set title = "This is the terms title for tid " || terms_of_use_id;
ALTER TABLE terms_of_use MODIFY title VARCHAR(50) NOT NULL;

update terms_of_use set url = "http://printer_friendly_terms_url/";

create table 'informix'.project_role_terms_of_use_xref (
 project_id INT not null,
 resource_role_id INT not null,
 terms_of_use_id DECIMAL(10,0) not null,
 create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
 modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
);

alter table 'informix'.project_role_terms_of_use_xref add constraint primary key
 (project_id, resource_role_id, terms_of_use_id)
 constraint pk_project_role_terms_of_use_xref;
 
alter table 'informix'.project_role_terms_of_use_xref add constraint foreign key
 (terms_of_use_id)
 references 'informix'.terms_of_use
 (terms_of_use_id)
 constraint project_role_terms_terms_fk;

-- insert a second terms of use relationship for testing purpose
insert into project_role_terms_of_use_xref
select contest_id, 1, 20566, current, current from studio_oltp:contest
where current between start_time and end_time
and contest_status_id = 2;
