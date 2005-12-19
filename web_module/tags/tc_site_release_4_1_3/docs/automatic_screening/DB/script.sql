ALTER TABLE submission
       ADD passed_auto_screening DECIMAL(1,0);
       
create table 'informix'.response_severity_lu (
    response_severity_id DECIMAL(12,0) not null,
    severity_text VARCHAR(50) not null
) extent size 16 next size 16
lock mode row;

alter table 'informix'.response_severity_lu add constraint primary key 
	(response_severity_id)
	constraint response_severity_pk;

create table 'informix'.screening_response_lu (
    screening_response_id DECIMAL(12,0) not null,
    response_code DECIMAL(3,0) not null,
    response_text VARCHAR(255) not null,
    response_severity_id DECIMAL(12,0) not null,
    create_user DECIMAL(12,0) not null,
    create_date DATETIME YEAR TO FRACTION not null
) extent size 16 next size 16
lock mode row;

alter table 'informix'.screening_response_lu add constraint primary key 
	(screening_response_id)
	constraint screening_response_pk;

alter table 'informix'.screening_response_lu add constraint foreign key 
	(response_severity_id)
	references 'informix'.response_severity_lu
	(response_severity_id) 
	constraint screeningresponse_responseseverity_fk;
	
create table 'informix'.screening_results (
    screening_results_id DECIMAL(12,0) not null,
    dynamic_response_text TEXT not null,
    screening_response_id DECIMAL(12,0) not null,
    create_user DECIMAL(12,0) not null,
    create_date DATETIME YEAR TO FRACTION not null,
    submission_v_id INT8 not null
)extent size 10000 next size 5000
lock mode row ;

alter table 'informix'.screening_results add constraint primary key 
	(screening_results_id)
	constraint screening_results_pk;

alter table 'informix'.screening_results add constraint foreign key 
	(submission_v_id)
	references 'informix'.submission
	(submission_v_id) 
	constraint screeningresults_submission_fk;

alter table 'informix'.screening_results add constraint foreign key 
	(screening_response_id)
	references 'informix'.screening_response_lu
	(screening_response_id) 
	constraint screeningresults_screeningresponse_fk;
	
create table 'informix'.screening_task (
    submission_v_id INT8 not null,
    submission_path VARCHAR(255) not null,
    screening_project_type_id DECIMAL(5,0) not null,
    screener_id DECIMAL(2,0)
)extent size 1000 next size 500
lock mode row ;

create table 'informix'.screening_project_type_lu (
    screening_project_type_id DECIMAL(5,0) not null,
    screening_project_type_desc VARCHAR(50) not null
)extent size 16 next size 16
lock mode row;

alter table 'informix'.screening_project_type_lu add constraint primary key 
	(screening_project_type_id)
	constraint pk_screening_project_type;
	
alter table SCREENING_TASK
   add constraint foreign key (screening_PROJECT_TYPE_id)
      references screening_project_type_lu
      (screening_PROJECT_TYPE_id)
      constraint FK_SRCNG_PRJ_TYPE;

alter table SCREENING_TASK	
   add constraint foreign key (SUBMISSION_V_ID)
      references SUBMISSION (SUBMISSION_V_ID)
      constraint FK_SRCNGTSK_SUBID;

insert into response_severity_lu values (1, 'Fatal Error');
insert into response_severity_lu values (2, 'Warning');
insert into response_severity_lu values (3, 'Success');
      
insert into screening_project_type_lu values(1, 'Java Design');
insert into screening_project_type_lu values(2, 'Java Development'); 
insert into screening_project_type_lu values(3, 'C# Design');
insert into screening_project_type_lu values(4, 'C# Development');

INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(1, 1, 'Your submission distribution is not a jar file.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(2, 2, 'Your submission distribution is not a zip file.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(3, 3, 'Your submission does not conform to the directory standard.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(4, 4, 'Your submission does not contain a component specification document in rich text format (rtf).', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(5, 5, 'Your submission does not contain a /log directory from the successful execution of the unit tests.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(6, 6, 'Your submission is missing the appropriate unit test log files.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(7, 7, 'Your submission does not contain a zargo or zuml file.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(8, 8, 'Your submission does not contain one or more use cases.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(9, 9, 'Your submission does not contain one or more class diagrams.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(10, 10, 'Your submission does not contain one or more sequence diagrams.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(11, 11, 'Your submission does not contain source code under /src.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(12, 12, 'Your submission does not contain test source code under /src.', 1, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(13, 13, 'Checkstyle has produced the following warnings.', 2, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(14, 14, 'Your submission contains personal information.', 2, 1, current);
INSERT INTO screening_response_lu(screening_response_id, response_code, response_text, response_severity_id, create_user, create_date)
VALUES(15, 15, 'Your submission has passed the auto screening process.', 3, 1, current);
