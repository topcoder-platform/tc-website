INSERT INTO command VALUES(0,'none',1);
INSERT INTO command VALUES(22,"query_metadata",1);
INSERT INTO command VALUES(23,"job_log",1);
INSERT INTO command VALUES(24,"recent_jobs",1);
INSERT INTO command VALUES(25,"jobs_by_date",1);
INSERT INTO command VALUES(26,"jobs_by_sender",1);
INSERT INTO command VALUES(27,"jobs_by_subject",1);
INSERT INTO command VALUES(28,"query_description",1);
INSERT INTO command VALUES(30,"email_queries",1);
INSERT INTO command VALUES(31,'Next Competition',1);
INSERT INTO command VALUES(32,'Member Development or Employment Opportunities',1);
INSERT INTO command VALUES(33,'authenticate_data_user',1);
INSERT INTO command VALUES(34,'school_membership',1);
INSERT INTO command VALUES(35,'Competition Results',1);
INSERT INTO command VALUES(36,'TopCoder News and Events',1);
INSERT INTO command VALUES(37,'Prize Winner',1);

INSERT INTO data_type VALUES (1001,'Integer Input');
INSERT INTO data_type VALUES (1002,'Decimal Input');
INSERT INTO data_type VALUES (1003,'Date Input');
INSERT INTO data_type VALUES (1004,'Sort Direction');
INSERT INTO data_type VALUES (1005,'String');

INSERT INTO command_query_xref VALUES(22,50,1);
INSERT INTO command_query_xref VALUES(23,57,1);
INSERT INTO command_query_xref VALUES(24,52,1);
INSERT INTO command_query_xref VALUES(25,53,1);
INSERT INTO command_query_xref VALUES(26,54,1);
INSERT INTO command_query_xref VALUES(27,55,1);
INSERT INTO command_query_xref VALUES(28,56,1);
INSERT INTO command_query_xref VALUES(30,51,1);
INSERT INTO command_query_xref VALUES(33,60,1);
INSERT INTO command_query_xref VALUES(34,63,1);
INSERT INTO command_query_xref VALUES(35,61,1);
INSERT INTO command_query_xref VALUES(36,62,1);
INSERT INTO command_query_xref VALUES(37,64,1);


INSERT INTO input_lu VALUES(3,"cr",1001,"Coder ID");
INSERT INTO input_lu VALUES(5,"sd",1003,"Start date");
INSERT INTO input_lu VALUES(6,"ed",1003,"End date");
INSERT INTO input_lu VALUES(18,"ci",1001,"Command ID");
INSERT INTO input_lu VALUES(19,"ji",1001,"Job ID");
INSERT INTO input_lu VALUES(20,"email",1005,"E-mail Address");
INSERT INTO input_lu VALUES(21,"subject",1005,"Subject");
INSERT INTO input_lu VALUES(22,"sector",1005,"Sector Desc");
INSERT INTO input_lu VALUES(23, "rd", 1001, "Round ID");
INSERT INTO input_lu VALUES(7, "nr", 1001, "Number of records");
INSERT INTO input_lu VALUES(8, "sr", 1001, "Start rank");
INSERT INTO input_lu VALUES(9, "er", 1001, "End rank");

INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(50,"N",null,18,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(52,"N",null,5,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(53,"N",null,5,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(53,"N",null,6,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(54,"N",null,20,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(55,"N",null,21,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(56,"N",null,18,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"N",null,19,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"Y","1",8,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"Y","50",9,3);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(60,'N',null,22,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(60,'N',null,3,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(64,'N',null,23,1);

