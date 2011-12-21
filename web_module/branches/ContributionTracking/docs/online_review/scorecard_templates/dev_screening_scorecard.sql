-- For creating the scorecard templates first create section groups and sections.
-- all the seq_loc(sequence location) are relative within their enviornment
-- (section/section_group).

-- The question_template is versioned so for creating this initial template
-- q_template_v_id and q_template_id can be the same value.

-- There should be one set of questions for each of the four combinations of
-- project_type and scorecard_type.

EXECUTE PROCEDURE IFX_ALLOW_NEWLINE('T');

INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (
    7, -- group_id, must be unique
    'Development Checklist', -- group_name
    1 -- group_seq_loc, the ordering of section groups within a scorecard
);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (
    30, -- section_id, must be unique
    'Development Checklist', -- section_name
    0, -- section_weight, how this section is weighted when scoring?
    1, -- section_seq_loc, the ordering of sections with a section group, starts from 1 in each group
    7 -- group_id, references the section group where this section belongs
);

INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (8, 'Development Review', 2);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (9, 'Logs', 3);

-- Development Review
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (17, 'Documentation', 20, 1, 8);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (18, 'Standards', 15, 2, 8);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (19, 'Design Adaptation', 15, 3, 8);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (31, 'Test Cases', 40, 4, 8);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (20, 'Anonymity', 10, 5, 8);


-- Logs
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (22, 'Logs', 0, 1, 9);


-- Minimum Requirements Checklist
INSERT INTO QUESTION_TEMPLATE VALUES (
    0, -- q_template_v_id , must be unique
    100, -- q_template_id, 
    2, -- project_type, 1 for design, 2 for development
    1, -- scorecard_type, 1 for screening, 2 for review
    'Log File from successful execution of unit test cases. (Review the /log directory)', -- question_text
    1, -- question_weight
    1, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    30, -- section_id
    1, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions
    3, -- template_id
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 101, 2, 1,
    'Source Code exists and compiles successfully. (Execute ''ant compile'' / ''nant compile'')
This may require additional packages as defined in the Component Specification.',
    1, 2, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 102, 2, 1,
    'Unit Test cases exist and compile successfully. (Execute ''ant_compile_tests'' / ''nantnant compile_tests'')',
    1, 3, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 103, 2, 1,
    'For Java Submissions:
Submission compiles against required targets. (Execute ''ant compile_targets'')
This will require modification of the java_1_3_bootclasspath in build.xml.',
    1, 4, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 104, 2, 1,
    'Submission passes the unit tests submitted by the developer. Disregard other tests. (Execute ''ant test'' / ''nant test'')',
    1, 5, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 105, 2, 1,
    'Component and unit test source code contain documentation (Java: Javadoc style / .NET: XML).',
    1, 6, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 106, 2, 1,
    'None of the submitter''s personal information (handle, name, email address, etc.) appears in the submission',
    1, 7, 30, 1, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Documentation
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 107, 2, 1,
    'All public methods are clearly commented.',
    34, 1, 17, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 108, 2, 1,
    'Required tags are included.
Java: @author, @param, @return, @throws and @version
.NET: <param>, <summary>, <returns> and <value>',
    33, 2, 17, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 109, 2, 1,
    'Copyright tag is populated: Copyright © 2003, TopCoder, Inc. All rights reserved',
    33, 3, 17, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Standards
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 110, 2, 1,
    'Adheres to coding standards.
Java: http://java.sun.com/docs/codeconv/html/CodeConvTOC.doc.html
.NET: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vsent7/html/vxconcodingtechniques.asp',
    50, 1, 18, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 111, 2, 1,
    'Code uses a 4 space indentation (not a tab)',
    50, 2, 18, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Design Adaptation
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 112, 2, 1,
    'All class definitions found in the class diagram are accurately represented in the source code',
    34, 1, 19, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 113, 2, 1,
    'All method definitions found in the class diagram are accurately represented in the source code',
    33, 2, 19, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 114, 2, 1,
    'All variable definitions found in the class diagram are accurately represented in the source code',
    33, 3, 19, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Anonymity
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 118, 2, 1,
    'The submission does not contain any information identifying the developer.',
    1, 1, 20, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Test Cases
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 115, 2, 1,
    'Unit test cases exists for all public methods in the design.',
    50, 1, 31, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 116, 2, 1,
    'For Java Submissions:
The UnitTests source file calls each unit test.
.NET Submissions should receive a 4.',
    50, 2, 31, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Test Cases
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 118, 2, 1,
    'Paste the ''compile'' log below',
    1, 1, 22, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 119, 2, 1,
    'Paste the ''compile_tests'' log below',
    1, 2, 22, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 120, 2, 1,
    'Paste the ''compile_targets'' log below',
    1, 3, 22, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 121, 2, 1,
    'Paste the ''test'' log below',
    1, 4, 22, 2, 3, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );


--CREATE TABLE SCORECARD_QUESTION (
--    QUESTION_V_ID      SERIAL NOT NULL,
--    QUESTION_ID        DEC(18) NOT NULL,
--    Q_TEMPLATE_V_ID    DEC(18) NOT NULL,
--    EVALUATION_ID      DEC(18),
--    SCORECARD_ID       DEC(18) NOT NULL,
--    MODIFY_DATE        DATETIME YEAR TO FRACTION(3)
--                       DEFAULT CURRENT YEAR TO FRACTION(3) NOT NULL,
--    MODIFY_USER        DEC(18) NOT NULL,
--    CUR_VERSION        DEC(1) NOT NULL
--);
--CREATE TABLE QUESTION_TEMPLATE (
--    Q_TEMPLATE_V_ID    SERIAL NOT NULL,
--    Q_TEMPLATE_ID      DEC(18) NOT NULL,
--    PROJECT_TYPE       DEC(18) NOT NULL,
--    SCORECARD_TYPE     DEC(7) NOT NULL,
--    QUESTION_TEXT      LVARCHAR NOT NULL,
--    QUESTION_WEIGHT    DEC(7) NOT NULL,
--    QUESTION_SEQ_LOC   DEC(7) NOT NULL,
--    SECTION_ID         DEC(18) NOT NULL,
--    QUESTION_TYPE      DEC(7) NOT NULL,
--    MODIFY_DATE        DATETIME YEAR TO FRACTION(3)
--                       DEFAULT CURRENT YEAR TO FRACTION(3) NOT NULL,
--    MODIFY_USER        DEC(18) NOT NULL,
--    CUR_VERSION        DEC(1) NOT NULL
--);
--CREATE TABLE SCORECARD_SECTION (
--    SECTION_ID         DEC(18) NOT NULL,
--    SECTION_NAME       LVARCHAR NOT NULL,
--    SECTION_WEIGHT     DEC(7) NOT NULL,
--    SECTION_SEQ_LOC    DEC(7) NOT NULL,
--	GROUP_ID           DEC(18) NOT NULL
--);
--CREATE TABLE SC_SECTION_GROUP (
--    GROUP_ID           DEC(18) NOT NULL,
--    GROUP_NAME         LVARCHAR NOT NULL,
--    GROUP_SEQ_LOC      DEC(7) NOT NULL
--);
