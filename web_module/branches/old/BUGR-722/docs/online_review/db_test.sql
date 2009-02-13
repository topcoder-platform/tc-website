DELETE FROM QUESTION_TEMPLATE;
DELETE FROM SCORECARD_SECTION;
DELETE FROM SC_SECTION_GROUP;

DELETE FROM PROJECT WHERE project_id<=7;
DELETE FROM PHASE_INSTANCE WHERE project_id<=7;
DELETE FROM R_USER_ROLE  WHERE project_id<=7;
DELETE FROM PAYMENT_INFO WHERE payment_info_id<=9;

DELETE FROM SCORECARD WHERE project_id<=7;
DELETE FROM SCORECARD_QUESTION WHERE QUESTION_ID<=1000;
DELETE FROM TESTCASE_QUESTION WHERE QUESTION_ID<=1000;
DELETE FROM SUBJECTIVE_RESP WHERE QUESTION_ID<=1000;
DELETE FROM SUBMISSION WHERE project_id<=7;

-- HTTP Tunneling
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    1, 1, 2809382, 1,
    NULL, "overview1", "notes1", 1, 1,
    0, CURRENT, 296466, "created", 1);

-- Database Abstraction
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    2, 2, 2809553, 44,
    NULL, "overview2", "notes2", 1, 1,
    0, CURRENT, 296466, "created", 1);

-- Serial Number Generator
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    3, 3, 3102778, 10,
    NULL, "overview3", "notes3", 1, 1,
    0, CURRENT, 296466, "created", 1);
    
-- Image Resizing
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    4, 4, 3300852, 18,
    NULL, "overview4", "notes4", 1, 1,
    0, CURRENT, 296466, "created", 1);

-- Global Distance Calculator
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    5, 5, 3300952, 26,
    NULL, "overview5", "notes5", 2, 1,
    0, CURRENT, 296466, "created", 1);

-- HTML Document Parser
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    6, 6, 4201370, 34,
    296745, "overview6", "notes6", 2, 1,
    0, CURRENT, 296466, "created", 1);

-- Financial Calculator
INSERT INTO PROJECT (PROJECT_V_ID, PROJECT_ID, COMP_VERS_ID, PHASE_INSTANCE_ID,
     WINNER_ID, OVERVIEW, NOTES, PROJECT_TYPE_ID, PROJECT_STAT_ID,
     NOTIFICATION_SENT, MODIFY_DATE, MODIFY_USER, MODIFY_REASON, CUR_VERSION)
VALUES (
    7, 7, 3312998, 42,
    NULL, "overview7", "notes7", 2, 1,
    0, CURRENT, 296466, "created", 1);                    



--Phase Instance Test Data
-- Project 1, HTTP Tunneling
INSERT INTO PHASE_INSTANCE VALUES (
	1, 1, MDY(1,1,2003), MDY(2,1,2003), 1, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	2, 2, MDY(2,1,2003), MDY(3,1,2003), 2, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	3, 3, MDY(3,1,2003), MDY(4,1,2003), 3, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	4, 4, MDY(4,1,2003), MDY(5,1,2003), 4, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	5, 5, MDY(5,1,2003), MDY(6,1,2003), 5, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	6, 6, MDY(6,1,2003), MDY(7,1,2003), 6, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	7, 7, MDY(7,1,2003), MDY(8,1,2003), 7, 1,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	108, 108, MDY(8,1,2003), MDY(9,1,2003), 8, 1,
	CURRENT,  296466, 1);
	
-- Project 3, Serial Number Generator
INSERT INTO PHASE_INSTANCE VALUES (
	8, 8, MDY(1,3,2003), MDY(2,3,2003), 1, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	9, 9, MDY(2,3,2003), MDY(3,3,2003), 2, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	10, 10, MDY(3,3,2003), MDY(4,3,2003), 3, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	11, 11, MDY(4,3,2003), MDY(5,3,2003), 4, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	12, 12, MDY(5,3,2003), MDY(6,3,2003), 5, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	13, 13, MDY(6,3,2003), MDY(7,3,2003), 6, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	14, 14, MDY(7,3,2003), MDY(8,3,2003), 7, 3,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	115, 115, MDY(8,3,2003), MDY(9,3,2003), 8, 3,
	CURRENT,  296466, 1);
	
-- Project 4, Image Resizing
INSERT INTO PHASE_INSTANCE VALUES (
	15, 15, MDY(1,4,2003), MDY(2,4,2003), 1, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	16, 16 , MDY(2,4,2003), MDY(3,4,2003), 2, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	17, 17, MDY(3,4,2003), MDY(4,4,2003), 3, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	18, 18, MDY(4,4,2003), MDY(5,4,2003), 4, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	19, 19, MDY(5,4,2003), MDY(6,4,2003), 5, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	20, 20, MDY(6,4,2003), MDY(7,4,2003), 6, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	21, 21, MDY(7,4,2003), MDY(8,4,2003), 7, 4,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	122, 122, MDY(8,4,2003), MDY(9,4,2003), 8, 4,
	CURRENT,  296466, 1);

-- Project 5, Global Distance Calculator
INSERT INTO PHASE_INSTANCE VALUES (
	22, 22, MDY(1,5,2003), MDY(2,5,2003), 1, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	23, 23, MDY(2,5,2003), MDY(3,5,2003), 2, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	24, 24, MDY(3,5,2003), MDY(4,5,2003), 3, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	25, 25, MDY(4,5,2003), MDY(5,5,2003), 4, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	26, 26, MDY(5,5,2003), MDY(6,5,2003), 5, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	27, 27, MDY(6,5,2003), MDY(7,5,2003), 6, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	28, 28, MDY(7,5,2003), MDY(8,5,2003), 7, 5,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	129, 129, MDY(8,5,2003), MDY(9,5,2003), 8, 5,
	CURRENT,  296466, 1);
	
-- Project 6, HTML Document Parser
INSERT INTO PHASE_INSTANCE VALUES (
	29, 29, MDY(1,6,2003), MDY(2,6,2003), 1, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	30, 30, MDY(2,6,2003), MDY(3,6,2003), 2, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	31, 31, MDY(3,6,2003), MDY(4,6,2003), 3, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	32, 32, MDY(4,6,2003), MDY(5,6,2003), 4, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	33, 33, MDY(5,6,2003), MDY(6,6,2003), 5, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	34, 34, MDY(6,6,2003), MDY(7,6,2003), 6, 6,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	35, 35, MDY(7,6,2003), MDY(8,6,2003), 7, 6,
	CURRENT,  296466, 1);	
INSERT INTO PHASE_INSTANCE VALUES (
	136, 136, MDY(8,6,2003), MDY(9,6,2003), 8, 6,
	CURRENT,  296466, 1);	
	
-- Project 7, Financial Calculator
INSERT INTO PHASE_INSTANCE VALUES (
	36, 36, MDY(1,7,2003), MDY(1,7,2003), 1, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	37, 37, MDY(1,7,2003), MDY(1,7,2003), 2, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	38, 38, MDY(1,7,2003), MDY(1,7,2003), 3, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	39, 39, MDY(1,7,2003), MDY(1,7,2003), 4, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	40, 40, MDY(1,7,2003), MDY(1,7,2003), 5, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	41, 41, MDY(1,7,2003), MDY(1,7,2003), 6, 7,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	42, 42, MDY(1,7,2003), MDY(1,7,2003), 7, 7,
	CURRENT,  296466, 1);	
INSERT INTO PHASE_INSTANCE VALUES (
	143, 143, MDY(1,7,2003), MDY(1,7,2003), 8, 7,
	CURRENT,  296466, 1);	

-- Project 2, Database Abstraction
INSERT INTO PHASE_INSTANCE VALUES (
	43, 43, MDY(1,2,2003), MDY(2,2,2003), 1, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	44, 44, MDY(2,2,2003), MDY(3,2,2003), 2, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	45, 45, MDY(3,2,2003), MDY(4,2,2003), 3, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	46, 46, MDY(4,2,2003), MDY(5,2,2003), 4, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	47, 47, MDY(5,2,2003), MDY(6,2,2003), 5, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	48, 48, MDY(6,2,2003), MDY(7,2,2003), 6, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	49, 49, MDY(7,2,2003), MDY(8,2,2003), 7, 2,
	CURRENT,  296466, 1);
INSERT INTO PHASE_INSTANCE VALUES (
	150, 150, MDY(8,2,2003), MDY(9,2,2003), 8, 2,
	CURRENT,  296466, 1);
		
--User Role Test Data
--Submitter: asdfsadkj2
--Screener, Reviewer(Failure Test), Aggregator, Final Reviewer: pzhao
--Reviewer(Stress Test): adic
--Reviewer(Accuracy Test): haha
--Project Manager: FatClimber
--Removed: pepe

-- User Roles for project 1

INSERT INTO R_USER_ROLE VALUES (
    1, 1, 1, 1, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    2, 2, 2, 1, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    3, 3, 3, 1, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    4, 4, 3, 1, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    5, 5, 3, 1, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    6, 6, 4, 1, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    7, 7, 5, 1, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    8, 8, 6, 1, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    9, 9, 7, 1, 154322, 9, NULL,
	CURRENT, 296466, 1);	


-- User Roles for project 2

INSERT INTO R_USER_ROLE VALUES (
    10, 10, 1, 2, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    11, 11, 2, 2, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    12, 12, 3, 2, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    13, 13, 3, 2, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    14, 14, 3, 2, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    15, 15, 4, 2, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    16, 16, 5, 2, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    17, 17, 6, 2, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    18, 18, 7, 2, 154322, 9, NULL,
	CURRENT, 296466, 1);	


-- User Roles for project 3

INSERT INTO R_USER_ROLE VALUES (
    19, 19, 1, 3, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    20, 20, 2, 3, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    21, 21, 3, 3, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    22, 22, 3, 3, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    23, 23, 3, 3, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    24, 24, 4, 3, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    25, 25, 5, 3, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    26, 26, 6, 3, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    27, 27, 7, 3, 154322, 9, NULL,
	CURRENT, 296466, 1);		


-- User Roles for project 4

INSERT INTO R_USER_ROLE VALUES (
    28, 28, 1, 4, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    29, 29, 2, 4, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    30, 30, 3, 4, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    31, 31, 3, 4, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    32, 32, 3, 4, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    33, 33, 4, 4, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    34, 34, 5, 4, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    35, 35, 6, 4, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    36, 36, 7, 4, 154322, 9, NULL,
	CURRENT, 296466, 1);	


-- User Roles for project 5

INSERT INTO R_USER_ROLE VALUES (
    37, 37, 1, 5, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    38, 38, 2, 5, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    39, 39, 3, 5, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    40, 40, 3, 5, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    41, 41, 3, 5, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    42, 42, 4, 5, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    43, 43, 5, 5, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    44, 44, 6, 5, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    45, 45, 7, 5, 154322, 9, NULL,
	CURRENT, 296466, 1);	

-- User Roles for project 6

INSERT INTO R_USER_ROLE VALUES (
    46, 46, 1, 6, 269554, 1, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    47, 47, 2, 6, 296745, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    48, 48, 3, 6, 296745, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    49, 49, 3, 6, 278342, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    50, 50, 3, 6, 279471, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    51, 51, 4, 6, 296745, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    52, 52, 5, 6, 296745, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    53, 53, 6, 6, 296466, 8, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    54, 54, 7, 6, 154322, 9, NULL,
	CURRENT, 296466, 1);	

-- User Roles for project 7

--INSERT INTO R_USER_ROLE VALUES (
--    55, 55, 1, 7, 269554, 1, NULL,
--	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    56, 56, 2, 7, NULL, 2, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    57, 57, 3, 7, NULL, 3, 2,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    58, 58, 3, 7, NULL, 4, 1,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    59, 59, 3, 7, NULL, 5, 3,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    60, 60, 4, 7, NULL, 6, NULL,
	CURRENT, 296466, 1);
INSERT INTO R_USER_ROLE VALUES (
    61, 61, 5, 7, NULL, 7, NULL,
	CURRENT, 296466, 1);	
INSERT INTO R_USER_ROLE VALUES (
    62, 62, 6, 7, NULL, NULL, NULL,
	CURRENT, 296466, 1);
--INSERT INTO R_USER_ROLE VALUES (
--    63, 63, 7, 7, 154322, 9, NULL,
--	CURRENT, 296466, 1);	
				
--Payment Info Test Data
INSERT INTO PAYMENT_INFO VALUES (
	1, 1, 10, 1, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	2, 2, 20, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	3, 3, 30, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	4, 4, 40, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	5, 5, 50, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	6, 6, 60, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	7, 7, 70, 2, current, 296466, 1);
INSERT INTO PAYMENT_INFO VALUES (
	8, 8, 80, 2, current, 296466, 1);					
INSERT INTO PAYMENT_INFO VALUES (
	9, 9, 0, 2, current, 296466, 1);	

--Test Data For Security Manager
DELETE FROM informix.security_roles WHERE role_id>=9000000 AND role_id<9000100;
DELETE FROM informix.security_perms WHERE role_id>=9000000 AND role_id<9000100;
DELETE FROM informix.user_role_xref WHERE role_id>=9000000 AND role_id<9000500;
DELETE FROM security_perms
WHERE permission LIKE '% 1';
DELETE FROM security_perms
WHERE permission LIKE '% 2';
DELETE FROM security_perms
WHERE permission LIKE '% 3';
DELETE FROM security_perms
WHERE permission LIKE '% 4';
DELETE FROM security_perms
WHERE permission LIKE '% 5';
DELETE FROM security_perms
WHERE permission LIKE '% 6';
DELETE FROM security_perms
WHERE permission LIKE '% 7';

DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'HTTP Tunneling 1.0 Design %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'Database Abstraction 1.0 Design %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'Serial Number Generator 1.0 Design %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'Image Resizing 1.0 Design %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'Global Distance Calculator 1.0 Development %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'HTML Document Parser 1.0 Development %');
DELETE FROM user_role_xref
WHERE role_id IN
	(SELECT role_id
	 FROM security_roles
	 WHERE description LIKE 'Financial Calculator 1.0 Development %');

DELETE FROM security_roles
WHERE description LIKE 'HTTP Tunneling 1.0 Design %';
DELETE FROM security_roles
WHERE description LIKE 'Database Abstraction 1.0 Design %';
DELETE FROM security_roles
WHERE description LIKE 'Serial Number Generator 1.0 Design %';
DELETE FROM security_roles
WHERE description LIKE 'Image Resizing 1.0 Design %';
DELETE FROM security_roles
WHERE description LIKE 'Global Distance Calculator 1.0 Development %';
DELETE FROM security_roles
WHERE description LIKE 'HTML Document Parser 1.0 Development %';
DELETE FROM security_roles
WHERE description LIKE 'Financial Calculator 1.0 Development %';

INSERT INTO informix.security_roles VALUES (
	9000000, "HTTP Tunneling 1.0 Design View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000001, "HTTP Tunneling 1.0 Design Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000002, "HTTP Tunneling 1.0 Design Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000003, "HTTP Tunneling 1.0 Design Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000004, "HTTP Tunneling 1.0 Design Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000005, "HTTP Tunneling 1.0 Design Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000006, "HTTP Tunneling 1.0 Design Final Review", 296466);

INSERT INTO informix.security_roles VALUES (
	9000010, "Database Abstraction 1.0 Design View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000011, "Database Abstraction 1.0 Design Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000012, "Database Abstraction 1.0 Design Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000013, "Database Abstraction 1.0 Design Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000014, "Database Abstraction 1.0 Design Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000015, "Database Abstraction 1.0 Design Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000016, "Database Abstraction 1.0 Design Final Review", 296466);

INSERT INTO informix.security_roles VALUES (
	9000020, "Serial Number Generator 1.0 Design View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000021, "Serial Number Generator 1.0 Design Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000022, "Serial Number Generator 1.0 Design Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000023, "Serial Number Generator 1.0 Design Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000024, "Serial Number Generator 1.0 Design Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000025, "Serial Number Generator 1.0 Design Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000026, "Serial Number Generator 1.0 Design Final Review", 296466);

INSERT INTO informix.security_roles VALUES (
	9000030, "Image Resizing 1.0 Design View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000031, "Image Resizing 1.0 Design Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000032, "Image Resizing 1.0 Design Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000033, "Image Resizing 1.0 Design Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000034, "Image Resizing 1.0 Design Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000035, "Image Resizing 1.0 Design Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000036, "Image Resizing 1.0 Design Final Review", 296466);

INSERT INTO informix.security_roles VALUES (
	9000040, "Global Distance Calculator 1.0 Development View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000041, "Global Distance Calculator 1.0 Development Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000042, "Global Distance Calculator 1.0 Development Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000043, "Global Distance Calculator 1.0 Development Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000044, "Global Distance Calculator 1.0 Development Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000045, "Global Distance Calculator 1.0 Development Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000046, "Global Distance Calculator 1.0 Development Final Review", 296466);
	
INSERT INTO informix.security_roles VALUES (
	9000050, "HTML Document Parser 1.0 Development View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000051, "HTML Document Parser 1.0 Development Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000052, "HTML Document Parser 1.0 Development Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000053, "HTML Document Parser 1.0 Development Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000054, "HTML Document Parser 1.0 Development Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000055, "HTML Document Parser 1.0 Development Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000056, "HTML Document Parser 1.0 Development Final Review", 296466);

INSERT INTO informix.security_roles VALUES (
	9000060, "Financial Calculator 1.0 Development View Project", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000061, "Financial Calculator 1.0 Development Submit", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000062, "Financial Calculator 1.0 Development Screen", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000063, "Financial Calculator 1.0 Development Review", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000064, "Financial Calculator 1.0 Development Aggregation", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000065, "Financial Calculator 1.0 Development Submit Final Fix", 296466);	
INSERT INTO informix.security_roles VALUES (
	9000066, "Financial Calculator 1.0 Development Final Review", 296466);		




INSERT INTO informix.security_perms VALUES (
	9000000, "com.topcoder.apps.review.security.ViewProjectPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000001, "com.topcoder.apps.review.security.SubmitPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000002, "com.topcoder.apps.review.security.ScreenPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000003, "com.topcoder.apps.review.security.ReviewPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000004, "com.topcoder.apps.review.security.AggregationPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000005, "com.topcoder.apps.review.security.SubmitFinalFixPermission 1", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000006, "com.topcoder.apps.review.security.FinalReviewPermission 1", 296466);

INSERT INTO informix.security_perms VALUES (
	9000010, "com.topcoder.apps.review.security.ViewProjectPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000011, "com.topcoder.apps.review.security.SubmitPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000012, "com.topcoder.apps.review.security.ScreenPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000013, "com.topcoder.apps.review.security.ReviewPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000014, "com.topcoder.apps.review.security.AggregationPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000015, "com.topcoder.apps.review.security.SubmitFinalFixPermission 2", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000016, "com.topcoder.apps.review.security.FinalReviewPermission 2", 296466);

INSERT INTO informix.security_perms VALUES (
	9000020, "com.topcoder.apps.review.security.ViewProjectPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000021, "com.topcoder.apps.review.security.SubmitPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000022, "com.topcoder.apps.review.security.ScreenPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000023, "com.topcoder.apps.review.security.ReviewPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000024, "com.topcoder.apps.review.security.AggregationPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000025, "com.topcoder.apps.review.security.SubmitFinalFixPermission 3", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000026, "com.topcoder.apps.review.security.FinalReviewPermission 3", 296466);

INSERT INTO informix.security_perms VALUES (
	9000030, "com.topcoder.apps.review.security.ViewProjectPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000031, "com.topcoder.apps.review.security.SubmitPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000032, "com.topcoder.apps.review.security.ScreenPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000033, "com.topcoder.apps.review.security.ReviewPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000034, "com.topcoder.apps.review.security.AggregationPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000035, "com.topcoder.apps.review.security.SubmitFinalFixPermission 4", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000036, "com.topcoder.apps.review.security.FinalReviewPermission 4", 296466);

INSERT INTO informix.security_perms VALUES (
	9000040, "com.topcoder.apps.review.security.ViewProjectPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000041, "com.topcoder.apps.review.security.SubmitPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000042, "com.topcoder.apps.review.security.ScreenPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000043, "com.topcoder.apps.review.security.ReviewPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000044, "com.topcoder.apps.review.security.AggregationPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000045, "com.topcoder.apps.review.security.SubmitFinalFixPermission 5", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000046, "com.topcoder.apps.review.security.FinalReviewPermission 5", 296466);
	
INSERT INTO informix.security_perms VALUES (
	9000050, "com.topcoder.apps.review.security.ViewProjectPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000051, "com.topcoder.apps.review.security.SubmitPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000052, "com.topcoder.apps.review.security.ScreenPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000053, "com.topcoder.apps.review.security.ReviewPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000054, "com.topcoder.apps.review.security.AggregationPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000055, "com.topcoder.apps.review.security.SubmitFinalFixPermission 6", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000056, "com.topcoder.apps.review.security.FinalReviewPermission 6", 296466);

INSERT INTO informix.security_perms VALUES (
	9000060, "com.topcoder.apps.review.security.ViewProjectPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000061, "com.topcoder.apps.review.security.SubmitPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000062, "com.topcoder.apps.review.security.ScreenPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000063, "com.topcoder.apps.review.security.ReviewPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000064, "com.topcoder.apps.review.security.AggregationPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000065, "com.topcoder.apps.review.security.SubmitFinalFixPermission 7", 296466);	
INSERT INTO informix.security_perms VALUES (
	9000066, "com.topcoder.apps.review.security.FinalReviewPermission 7", 296466);		




--INSERT INTO informix.security_perms (role_id, permission, create_user_id)
--	SELECT role_id, description, create_user_id 
--		FROM informix.security_roles 
--		WHERE role_id >= 9000000;
INSERT INTO informix.user_role_xref (user_role_id, login_id, role_id, create_user_id)
	SELECT role_id, 269554, role_id, create_user_id
		FROM informix.security_roles 
		WHERE role_id>=9000000 AND role_id<9000060
			AND (MOD(role_id, 10) = 0 OR MOD(role_id, 10) = 1);
INSERT INTO informix.user_role_xref (user_role_id, login_id, role_id, create_user_id)
	SELECT role_id+100, 296745, role_id, create_user_id
		FROM informix.security_roles 
		WHERE role_id>=9000000 AND role_id<9000060
			AND (MOD(role_id, 10) = 0 OR MOD(role_id, 10) = 2 OR MOD(role_id, 10) = 3 OR MOD(role_id, 10) = 4 OR MOD(role_id, 10) = 6);
INSERT INTO informix.user_role_xref (user_role_id, login_id, role_id, create_user_id)
	SELECT role_id+200, 278342, role_id, create_user_id
		FROM informix.security_roles 
		WHERE role_id>=9000000 AND role_id<9000060
			AND (MOD(role_id, 10) = 0 OR MOD(role_id, 10) = 3);
INSERT INTO informix.user_role_xref (user_role_id, login_id, role_id, create_user_id)
	SELECT role_id+300, 279471, role_id, create_user_id
		FROM informix.security_roles 
		WHERE role_id>=9000000 AND role_id<9000060
			AND (MOD(role_id, 10) = 0 OR MOD(role_id, 10) = 3);
INSERT INTO informix.user_role_xref (user_role_id, login_id, role_id, create_user_id)
	SELECT role_id+400, 296466, role_id, create_user_id
		FROM informix.security_roles 
		WHERE role_id>=9000000 AND role_id<9000060;			



INSERT INTO SUBMISSION (SUBMISSION_V_ID, SUBMISSION_ID, SUBMISSION_TYPE, SUBMISSION_URL,
    SUB_PM_REVIEW_MSG, SUB_PM_SCREEN_MSG, SUBMITTER_ID, PROJECT_ID, IS_REMOVED,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    21, 21, 1, 'file://test.jar',
    "Review message", "Screening Message", 269554, 2, 0,
    CURRENT, 269554, 1);

INSERT INTO SUBMISSION (SUBMISSION_V_ID, SUBMISSION_ID, SUBMISSION_TYPE, SUBMISSION_URL,
    SUB_PM_REVIEW_MSG, SUB_PM_SCREEN_MSG, SUBMITTER_ID, PROJECT_ID, IS_REMOVED,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    31, 31, 1, 'file://test.jar',
    "Review message", "Screening Message", 269554, 3, 0,
    CURRENT, 269554, 1);

INSERT INTO SUBMISSION (SUBMISSION_V_ID, SUBMISSION_ID, SUBMISSION_TYPE, SUBMISSION_URL,
    SUB_PM_REVIEW_MSG, SUB_PM_SCREEN_MSG, SUBMITTER_ID, PROJECT_ID, IS_REMOVED,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    41, 41, 1, 'file://test.jar',
    "Review message", "Screening Message", 269554, 4, 0,
    CURRENT, 269554, 1);



INSERT INTO SCORECARD (SCORECARD_V_ID, SCORECARD_ID, SCORECARD_TYPE, IS_COMPLETED, IS_PM_REVIEWED,
    AUTHOR_ID, PROJECT_ID, SUBMISSION_ID, SCORE, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    31, 31, 1, 1, 0,
    296745, 3, 31, 87.5, CURRENT, 296745, 1);


INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    311, 311, 1, 5, 31,
    CURRENT, 296745, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    312, 312, 2, 5, 31,
    CURRENT, 296745, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    313, 313, 3, 4, 31,
    CURRENT, 296745, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    314, 314, 4, 3, 31,
    CURRENT, 296745, 1);


INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    311, 311, 'SCREEN Q1-R1', 2,
    313, CURRENT, 296745, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    312, 312, 'SCREEN Q1-R2', 1,
    313, CURRENT, 296745, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    313, 313, 'SCREEN Q2-R1', 1,
    314, CURRENT, 296745, 1);



-- Project 3, first review scorecard
INSERT INTO SCORECARD (SCORECARD_V_ID, SCORECARD_ID, SCORECARD_TYPE, IS_COMPLETED, IS_PM_REVIEWED,
    AUTHOR_ID, PROJECT_ID, SUBMISSION_ID, SCORE, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    32, 32, 2, 1, 0,
    296745, 3, 31, 95, CURRENT, 296745, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    321, 321, 5, 4, 32,
    CURRENT, 296745, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    322, 322, 6, null, 32,
    CURRENT, 296745, 1);


INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    321, 321, 'pzhao, review q1-r1', 1,
    321, CURRENT, 296745, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    322, 322, 'pzhao, review q1-r2', 1,
    321, CURRENT, 296745, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    323, 323, 'pzhao, review q2-r1', 1,
    322, CURRENT, 296745, 1);


INSERT INTO TESTCASE_QUESTION (TC_QUESTION_V_ID, QUESTION_ID, TOTAL_TESTS,
    TOTAL_PASS, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    322, 322, 10,
    9, CURRENT, 296745, 1);


-- Project 3, second review scorecard
INSERT INTO SCORECARD (SCORECARD_V_ID, SCORECARD_ID, SCORECARD_TYPE, IS_COMPLETED, IS_PM_REVIEWED,
    AUTHOR_ID, PROJECT_ID, SUBMISSION_ID, SCORE, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    33, 33, 2, 1, 0,
    278342, 3, 31, 95, CURRENT, 278342, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    331, 331, 5, 4, 33,
    CURRENT, 278342, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    332, 332, 6, null, 33,
    CURRENT, 278342, 1);


INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    331, 331, 'adic, review q1-r1', 1,
    331, CURRENT, 278342, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    332, 332, 'adic, review q1-r2', 1,
    331, CURRENT, 278342, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    333, 333, 'adic, review q2-r1', 1,
    332, CURRENT, 278342, 1);


INSERT INTO TESTCASE_QUESTION (TC_QUESTION_V_ID, QUESTION_ID, TOTAL_TESTS,
    TOTAL_PASS, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    332, 332, 10,
    9, CURRENT, 278342, 1);



-- Project 3, third review scorecard
INSERT INTO SCORECARD (SCORECARD_V_ID, SCORECARD_ID, SCORECARD_TYPE, IS_COMPLETED, IS_PM_REVIEWED,
    AUTHOR_ID, PROJECT_ID, SUBMISSION_ID, SCORE, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    34, 34, 2, 1, 0,
    279471, 3, 31, 95, CURRENT, 279471, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    341, 341, 5, 4, 34,
    CURRENT, 279471, 1);

INSERT INTO SCORECARD_QUESTION (QUESTION_V_ID, QUESTION_ID, Q_TEMPLATE_V_ID, EVALUATION_ID, SCORECARD_ID,
    MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    342, 342, 6, null, 34,
    CURRENT, 279471, 1);


INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    341, 341, 'haha, review q1-r1', 1,
    341, CURRENT, 279471, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    342, 342, 'haha, review q1-r2', 1,
    341, CURRENT, 279471, 1);

INSERT INTO SUBJECTIVE_RESP (SUBJECTIVE_R_V_ID, SUBJECTIVE_RESP_ID, RESPONSE_TEXT, RESPONSE_TYPE_ID,
    QUESTION_ID, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    343, 343, 'haha, review q2-r1', 1,
    342, CURRENT, 279471, 1);


INSERT INTO TESTCASE_QUESTION (TC_QUESTION_V_ID, QUESTION_ID, TOTAL_TESTS,
    TOTAL_PASS, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
VALUES (
    342, 342, 10,
    9, CURRENT, 279471, 1);



--INSERT INTO SCORECARD (SCORECARD_V_ID, SCORECARD_ID, SCORECARD_TYPE, IS_COMPLETED, IS_PM_REVIEWED,
--    AUTHOR_ID, PROJECT_ID, SUBMISSION_ID, SCORE, MODIFY_DATE, MODIFY_USER, CUR_VERSION)
--VALUES (
--    34, 34, 2, 1, 0,
--    279471, 3, 31, 85, CURRENT, 296466, 1);


--INSERT INTO SCORECARD VALUES (
--	2, 2, 1, 0, 0, 296745, 3, 2, 0, CURRENT, 296745, 1);
