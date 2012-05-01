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

INSERT INTO email_list_group_lu VALUES ( 1, 'Ad-hoc' );
INSERT INTO email_list_group_lu VALUES ( 2, 'Staff' );

INSERT INTO email_template_group_lu VALUES ( 1, 'Notify' );
INSERT INTO email_template_group_lu VALUES ( 2, 'Result' );
INSERT INTO email_template_group_lu VALUES ( 3, 'Affidavit' );
INSERT INTO email_template_group_lu VALUES ( 4, 'Charity' );
INSERT INTO email_template_group_lu VALUES ( 5, 'Member Dev' );
INSERT INTO email_template_group_lu VALUES ( 6, 'Tournament' );
INSERT INTO email_template_group_lu VALUES ( 7, 'Team' );

