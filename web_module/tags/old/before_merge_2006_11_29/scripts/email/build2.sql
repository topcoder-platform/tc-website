-- stage 2 email schema to support multiple schedulers

DROP TABLE sched_control;

CREATE TABLE sched_control ( 
  sched_control_id DECIMAL(10,0) NOT NULL 
 ,sched_job_id DECIMAL(10,0) NOT NULL
) IN tbldbs EXTENT SIZE 32 NEXT SIZE 32 LOCK MODE ROW;

ALTER TABLE sched_control
   ADD CONSTRAINT PRIMARY KEY (sched_job_id) 
   CONSTRAINT sched_control_pk;
