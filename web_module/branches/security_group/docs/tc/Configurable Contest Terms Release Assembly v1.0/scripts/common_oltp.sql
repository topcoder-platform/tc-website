database common_oltp;

alter table terms_of_use modify next size 3000;

ALTER TABLE terms_of_use ADD title VARCHAR(50);
ALTER TABLE terms_of_use ADD electronically_signable decimal(1,0);
ALTER TABLE terms_of_use ADD url VARCHAR(100);

update terms_of_use set electronically_signable = 1;
ALTER TABLE terms_of_use MODIFY electronically_signable decimal(1,0) NOT NULL;

----- RUN TermsOfUseMigrationTool.java

ALTER TABLE terms_of_use MODIFY title VARCHAR(50) NOT NULL;

create table 'informix'.project_role_terms_of_use_xref (
    project_id INT not null,
    resource_role_id INT not null,
    terms_of_use_id DECIMAL(10,0) not null,
    create_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION,
    modify_date DATETIME YEAR TO FRACTION default CURRENT YEAR TO FRACTION
)
extent size 2000 next size 2000
lock mode row;

alter table 'informix'.project_role_terms_of_use_xref add constraint primary key 
	(project_id, resource_role_id, terms_of_use_id)
	constraint pk_project_role_terms_of_use_xref;

alter table 'informix'.project_role_terms_of_use_xref add constraint foreign key 
	(terms_of_use_id)
	references 'informix'.terms_of_use
	(terms_of_use_id) 
	constraint project_role_terms_terms_fk;
