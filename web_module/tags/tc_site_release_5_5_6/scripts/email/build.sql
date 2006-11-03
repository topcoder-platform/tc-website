-- requires command -- query schema pre-built

DROP TABLE command_param;
DROP TABLE command_group_lu;
DROP TABLE sched_email_job;
DROP TABLE email_list_detail;
DROP TABLE email_list;
DROP TABLE email_list_group_lu;
DROP TABLE email_template;
DROP TABLE email_template_group_lu;
DROP TABLE sched_job_detail;
DROP TABLE archive_sched_job_detail;
DROP TABLE sched_job;
DROP TABLE sched_job_status_lu;
DROP TABLE sched_job_type_lu;

CREATE TABLE sched_job_type_lu
   (
      sched_job_type_id DECIMAL(5,0) NOT NULL
      ,job_type_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE sched_job_type_lu
   ADD CONSTRAINT PRIMARY KEY (sched_job_type_id) 
   CONSTRAINT sched_job_type_lu_pk;
      



CREATE TABLE sched_job_status_lu
   (
      sched_job_status_id DECIMAL(3,0) NOT NULL
      ,sched_job_status_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE sched_job_status_lu
   ADD CONSTRAINT PRIMARY KEY (sched_job_status_id)
   CONSTRAINT sched_job_status_lu_pk;   


CREATE TABLE sched_job_detail_status_lu
   (
      sched_job_detail_status_id DECIMAL(3,0) NOT NULL
      ,sched_job_detail_status_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE sched_job_detail_status_lu
   ADD CONSTRAINT PRIMARY KEY (sched_job_detail_status_id)
   CONSTRAINT sched_job_detail_status_lu_pk; 


CREATE TABLE sched_job
   (
      sched_job_id DECIMAL(10,0) NOT NULL
      ,sched_job_type_id DECIMAL(5,0) NOT NULL
      ,sched_job_status_id DECIMAL(3,0) NOT NULL
      ,start_after_date DATETIME YEAR TO FRACTION(3)
      ,end_before_date DATETIME YEAR TO FRACTION(3)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;


ALTER TABLE sched_job
   ADD CONSTRAINT PRIMARY KEY (sched_job_id) 
   CONSTRAINT sched_job_pk;

ALTER TABLE sched_job
   ADD CONSTRAINT FOREIGN KEY (sched_job_type_id) 
   REFERENCES sched_job_type_lu (sched_job_type_id) 
   CONSTRAINT sched_job_sched_job_type_lu_fk;
      
ALTER TABLE sched_job
   ADD CONSTRAINT FOREIGN KEY (sched_job_status_id) 
   REFERENCES sched_job_status_lu (sched_job_status_id) 
   CONSTRAINT sched_job_sched_job_status_lu_fk;
      



CREATE TABLE sched_job_detail
   (
      sched_job_id DECIMAL(10,0) NOT NULL
      ,sched_job_detail_id DECIMAL(10,0) NOT NULL
      ,sched_job_detail_status_id DECIMAL(3,0) NOT NULL
      ,reason TEXT
      ,data TEXT
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;


ALTER TABLE sched_job_detail
   ADD CONSTRAINT PRIMARY KEY (sched_job_detail_id) 
   CONSTRAINT sched_job_detail_pk;

ALTER TABLE sched_job_detail
   ADD CONSTRAINT FOREIGN KEY (sched_job_id)
   REFERENCES sched_job (sched_job_id)
   CONSTRAINT sched_job_detail_sched_job_fk;

ALTER TABLE sched_job_detail
   ADD CONSTRAINT FOREIGN KEY (sched_job_detail_status_id)
   REFERENCES sched_job_detail_status_lu (sched_job_detail_status_id)
   CONSTRAINT sched_job_detail_sched_job_detail_status_lu_fk;



CREATE TABLE email_template_group_lu
   (
      email_template_group_id DECIMAL(5,0) NOT NULL
      ,email_template_group_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE email_template_group_lu
   ADD CONSTRAINT PRIMARY KEY (email_template_group_id)
   CONSTRAINT email_template_group_lu_pk ;




CREATE TABLE email_template
   (
      email_template_id DECIMAL(10,0) NOT NULL
      ,email_template_group_id DECIMAL(5,0) NOT NULL
      ,email_template_name VARCHAR(100,0)
      ,data TEXT
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE email_template
   ADD CONSTRAINT PRIMARY KEY (email_template_id)
   CONSTRAINT email_template_pk ;

ALTER TABLE email_template
   ADD CONSTRAINT FOREIGN KEY (email_template_group_id)
   REFERENCES email_template_group_lu (email_template_group_id)
   CONSTRAINT email_template_email_template_group_lu_fk;




CREATE TABLE email_list_group_lu
   (
      email_list_group_id DECIMAL(5,0) NOT NULL
      ,email_list_group_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE email_list_group_lu
   ADD CONSTRAINT PRIMARY KEY (email_list_group_id)
   CONSTRAINT email_list_group_lu_pk ;




CREATE TABLE email_list
   (
      email_list_id DECIMAL(10,0) NOT NULL
      ,email_list_group_id DECIMAL(5,0) NOT NULL
      ,email_list_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE email_list
   ADD CONSTRAINT PRIMARY KEY (email_list_id)
   CONSTRAINT email_list_pk ;

ALTER TABLE email_list
   ADD CONSTRAINT FOREIGN KEY (email_list_group_id)
   REFERENCES email_list_group_lu (email_list_group_id) 
   CONSTRAINT email_list_detail_email_list_group_lu_fk ;




CREATE TABLE email_list_detail
   (
      email_list_detail_id DECIMAL(10,0) NOT NULL
      ,email_list_id DECIMAL(10,0) NOT NULL
      ,data TEXT
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE email_list_detail
   ADD CONSTRAINT PRIMARY KEY (email_list_detail_id)
   CONSTRAINT email_list_detail_pk ;

ALTER TABLE email_list_detail
   ADD CONSTRAINT FOREIGN KEY (email_list_id)
   REFERENCES email_list (email_list_id) 
   CONSTRAINT email_list_detail_email_list_fk ;



CREATE TABLE sched_email_job
   (
      sched_email_job_id DECIMAL(10,0) NOT NULL
      ,email_template_id DECIMAL(10,0) NOT NULL
      ,command_id DECIMAL(10,0) NOT NULL
      ,email_list_id DECIMAL(10,0) NOT NULL
      ,from_address VARCHAR(200,0)
      ,from_personal VARCHAR(255,0)
      ,subject VARCHAR(255,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;


ALTER TABLE sched_email_job
   ADD CONSTRAINT PRIMARY KEY (sched_email_job_id)
   CONSTRAINT sched_email_job_pk ;

ALTER TABLE sched_email_job
   ADD CONSTRAINT FOREIGN KEY (sched_email_job_id)
   REFERENCES sched_job (sched_job_id)
   CONSTRAINT sched_email_job_sched_job_fk ;

ALTER TABLE sched_email_job
   ADD CONSTRAINT FOREIGN KEY (email_template_id)
   REFERENCES email_template (email_template_id)
   CONSTRAINT sched_email_job_email_template_fk ;

ALTER TABLE sched_email_job
   ADD CONSTRAINT FOREIGN KEY (command_id)
   REFERENCES command (command_id)
   CONSTRAINT sched_email_job_command_fk ;

ALTER TABLE sched_email_job
   ADD CONSTRAINT FOREIGN KEY (email_list_id)
   REFERENCES email_list (email_list_id)
   CONSTRAINT sched_email_job_email_list_fk ;


CREATE TABLE command_param
   (
      command_param_id DECIMAL(10,0) NOT NULL
      ,sched_email_job_id DECIMAL(10,0) NOT NULL
      ,input_id DECIMAL(10,0) NOT NULL
      ,param VARCHAR(255,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;


ALTER TABLE command_param
   ADD CONSTRAINT PRIMARY KEY (command_param_id)
   CONSTRAINT command_param_pk;

ALTER TABLE command_param
   ADD CONSTRAINT FOREIGN KEY (sched_email_job_id)
   REFERENCES sched_email_job (sched_email_job_id)
   CONSTRAINT command_param_sched_email_job_fk;



CREATE TABLE archive_sched_job_detail
   (
      sched_job_id DECIMAL(10,0) NOT NULL
      ,sched_job_detail_id DECIMAL(10,0) NOT NULL
      ,sched_job_detail_status_id DECIMAL(3,0) NOT NULL
      ,reason TEXT
      ,data TEXT
      ,insert_date DATETIME YEAR TO FRACTION(3)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;



CREATE TABLE command_group_lu
   (
      command_group_id DECIMAL(5,0) NOT NULL
      ,command_group_name VARCHAR(100,0)
   )
   IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE command_group_lu
   ADD CONSTRAINT PRIMARY KEY (command_group_id)
   CONSTRAINT command_group_lu_pk ;

ALTER TABLE command
   ADD (command_group_id DECIMAL(5,0));

ALTER TABLE command
   ADD CONSTRAINT FOREIGN KEY (command_group_id)
   REFERENCES command_group_lu (command_group_id)
   CONSTRAINT command_command_group_fk;

INSERT INTO command_group_lu VALUES ( 0, 'Statistics' );
INSERT INTO command_group_lu VALUES ( 1, 'Email' );
UPDATE command SET command_group_id = 0;
