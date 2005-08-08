
CREATE TABLE response_severity (
       response_severity_id decimal(12,0) NOT NULL,
       response_severity_description varchar(50) NOT NULL,
       create_user          decimal(12,0) NOT NULL,
       create_dt            datetime NOT NULL,
       last_update_user     decimal(12,0) NOT NULL,
       last_update_dt       datetime NOT NULL
);

CREATE UNIQUE INDEX XPKresponse_severity ON response_severity
(
       response_severity_id           ASC
);


ALTER TABLE response_severity
       ADD CONSTRAINT PRIMARY KEY (response_severity_id);


CREATE TABLE screening_response (
       screening_response_id decimal(12,0) NOT NULL,
       response_code        decimal(3,0) NOT NULL,
       response_text        lvarchar NOT NULL,
       response_severity_id decimal(12,0) NOT NULL,
       create_user          decimal(12,0) NOT NULL,
       create_dt            datetime NOT NULL,
       last_update_user     decimal(12,0) NOT NULL,
       last_update_dt       datetime NOT NULL
);

CREATE UNIQUE INDEX XPKscreening_response ON screening_response
(
       screening_response_id          ASC
);


ALTER TABLE screening_response
       ADD CONSTRAINT PRIMARY KEY (screening_response_id);


CREATE TABLE screening_results (
       screening_results_id decimal(12,0) NOT NULL,
       dynamic_response_text lvarchar NOT NULL,
       screening_response_id decimal(12,0) NOT NULL,
       create_user          decimal(12,0) NOT NULL,
       create_dt            datetime NOT NULL,
       last_update_user     decimal(12,0) NOT NULL,
       last_update_dt       datetime NOT NULL,
       submission_v_id      serial8 NOT NULL
);

CREATE UNIQUE INDEX XPKscreening_results ON screening_results
(
       screening_results_id           ASC
);


ALTER TABLE screening_results
       ADD CONSTRAINT PRIMARY KEY (screening_results_id);


CREATE TABLE submission (
       submission_v_id      serial8 NOT NULL,
       submission_id        decimal(12,0) NOT NULL,
       submission_type      decimal(7,0) NOT NULL,
       submission_url       lvarchar NOT NULL,
       sub_pm_review_msg    lvarchar,
       sub_pm_screen_msg    lvarchar,
       submitter_id         decimal(12,0) NOT NULL,
       project_id           decimal(12,0) NOT NULL,
       is_removed           decimal(1,0) NOT NULL,
       modify_date          datetime NOT NULL,
       modify_user          decimal(12,0) NOT NULL,
       cur_version          decimal(1,0) NOT NULL,
       submission_date      datetime NOT NULL,
       final_score          float,
       placement            decimal(7,0),
       passed_screening     decimal(1,0),
       advance_to_review    decimal(1,0),
       current_flag         decimal(1,0) NOT NULL,
       passed_auto_screening decimal(1,0) NOT NULL
);

CREATE UNIQUE INDEX XPKsubmission ON submission
(
       submission_v_id                ASC
);


ALTER TABLE submission
       ADD CONSTRAINT PRIMARY KEY (submission_v_id);


ALTER TABLE screening_response
       ADD CONSTRAINT FOREIGN KEY (response_severity_id)
                             REFERENCES response_severity;


ALTER TABLE screening_results
       ADD CONSTRAINT FOREIGN KEY (submission_v_id)
                             REFERENCES submission;


ALTER TABLE screening_results
       ADD CONSTRAINT FOREIGN KEY (screening_response_id)
                             REFERENCES screening_response;

-- The following stuff is for the queue.                             
create table screening_task (
    submission_v_id DECIMAL(18,0) not null,
    submission_path VARCHAR(255) not null,
    screening_project_type_id DECIMAL(5,0) not null,
    screener_id DECIMAL(2,0)
);

create table screening_project_type (
    screening_project_type_id DECIMAL(5,0) not null,
    screening_project_type_desc VARCHAR(50) not null
)

alter table screening_project_type add constraint primary key 
	(screening_project_type_id)
	constraint pk_screening_project_type;

insert into SCREENING_Project_Type values(1, 'Java Design');
insert into SCREENING_Project_Type values(2, 'Java Development'); 
insert into SCREENING_Project_Type values(3, 'C# Design');
insert into SCREENING_Project_Type values(4, 'C# Development');

alter table SCREENING_TASK
   add constraint foreign key (screening_PROJECT_TYPE_id)
      references SCREENING_Project_Type
      (screening_PROJECT_TYPE_id)
      constraint FK_SRCNG_PRJ_TYPE;

--alter table SCREENING_TASK	
--   add constraint foreign key (SUBMISSION_V_ID)
--      references SUBMISSION (SUBMISSION_V_ID)
--      constraint FK_SRCNGTSK_SUBID;
