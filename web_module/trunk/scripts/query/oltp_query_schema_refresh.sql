INSERT INTO command VALUES ( 0, 'none', 1 );
insert into command values(22,"query_metadata",1);
insert into command values(24,"recent_jobs",1);
insert into command values(25,"jobs_by_date",1);
insert into command values(26,"jobs_by_sender",1);
insert into command values(27,"jobs_by_subject",1);
insert into command values(28,"query_description",1);
insert into command values(30,"email_queries",1);
insert into command values(23,"job_log",1);
INSERT INTO command VALUES ( 31, 'Notify Active', 1 );
INSERT INTO command VALUES ( 32, 'Notify Active US', 1 );

INSERT INTO data_type VALUES ( 1001, 'Integer Input' );
INSERT INTO data_type VALUES ( 1002, 'Decimal Input' );
INSERT INTO data_type VALUES ( 1003, 'Date Input' );
INSERT INTO data_type VALUES ( 1004, 'Sort Direction' );
INSERT INTO data_type VALUES ( 1005, 'String' );

insert into command_query_xref values(22, 50, 1);
insert into command_query_xref values(24, 52, 1);
insert into command_query_xref values(25, 53, 1);
insert into command_query_xref values(26, 54, 1);
insert into command_query_xref values(27, 55, 1);
insert into command_query_xref values(28, 56, 1);
insert into command_query_xref values(30, 51, 1);
insert into command_query_xref values(23, 57, 1);

insert into input_lu values(5, "sd", 1003, "Start date");
insert into input_lu values(6, "ed", 1003, "End date");
insert into input_lu values(18, "ci", 1001, "Command ID");
insert into input_lu values(19, "ji", 1001, "Job ID");
insert into input_lu values(20, "email", 1005, "E-mail Address");
insert into input_lu values(21, "subject", 1005, "Subject");

insert into query_input_xref values(50, "N", null, 18, 1);
insert into query_input_xref values(52, "N", null, 5, 1);
insert into query_input_xref values(53, "N", null, 5, 1);
insert into query_input_xref values(53, "N", null, 6, 1);
insert into query_input_xref values(54, "N", null, 20, 1);
insert into query_input_xref values(55, "N", null, 21, 1);
insert into query_input_xref values(56, "N", null, 18, 1);
insert into query_input_xref values(57, "N", null, 19, 1);
insert into query_input_xref values(57, "Y", "1", 8, 2);
insert into query_input_xref values(57, "Y", "50", 9, 3);

