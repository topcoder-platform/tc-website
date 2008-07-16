INSERT INTO sequence_object VALUES ( 70, 0, 'SCHED_JOB_SEQ');
INSERT INTO sequence_object VALUES ( 71, 0, 'SCHED_JOB_DETAIL_SEQ');
INSERT INTO sequence_object VALUES ( 72, 0, 'EMAIL_TEMPLATE_SEQ');
INSERT INTO sequence_object VALUES ( 73, 0, 'EMAIL_LIST_SEQ');


INSERT INTO sched_job_type_lu 
(sched_job_type_id, job_type_name)
VALUES (1, 'Email Broadcast');

INSERT INTO sched_job_type_lu 
(sched_job_type_id, job_type_name)
VALUES (2, 'Email Broadcast');

INSERT INTO sched_job_type_lu 
(sched_job_type_id, job_type_name)
VALUES (3, 'Email Broadcast Report');

INSERT INTO sched_job_detail_status_lu
(sched_job_detail_status_id, sched_job_detail_status_name)
VALUES (0, 'no attempt');

INSERT INTO sched_job_detail_status_lu
(sched_job_detail_status_id, sched_job_detail_status_name)
VALUES (1, 'sent');

INSERT INTO sched_job_detail_status_lu
(sched_job_detail_status_id, sched_job_detail_status_name)
VALUES (2, 'failed');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (0, 'creating');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (1, 'ready');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (2, 'active');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (3, 'complete');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (4, 'incomplete');

INSERT INTO sched_job_status_lu
(sched_job_status_id, sched_job_status_name)
VALUES (5, 'canceled');

INSERT INTO email_template_group_lu
(email_template_group_id, email_template_group_name)
VALUES (99999, '[Deleted]');

INSERT INTO email_template_group_lu
(email_template_group_id, email_template_group_name)
VALUES (99998, '[SentReports]');

INSERT INTO email_template_group_lu
(email_template_group_id, email_template_group_name)
VALUES (99997, '[Reports]');

INSERT INTO email_list_group_lu
(email_list_group_id, email_list_group_name)
VALUES (99999, '[Deleted]');

INSERT INTO email_list_group_lu
(email_list_group_id, email_list_group_name)
VALUES (99998, '[Test]');

