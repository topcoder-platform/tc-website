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
    11, -- group_id, must be unique
    'Component Development', -- group_name
    1 -- group_seq_loc, the ordering of section groups within a scorecard
);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (
    32, -- section_id, must be unique
    'Component Development', -- section_name
    15, -- section_weight, how this section is weighted when scoring?
    1, -- section_seq_loc, the ordering of sections with a section group, starts from 1 in each group
    11 -- group_id, references the section group where this section belongs
);

INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (12, 'Class Implementation', 2);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (13, 'Code Review', 3);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (14, 'Test Cases', 4);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (15, 'Overall Score', 4);

-- Class Implementation
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (23, 'Class Definition', 5, 1, 12);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (24, 'Variable Definition', 5, 2, 12);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (25, 'Method Definition', 5, 3, 12);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (26, 'Relationships', 5, 4, 12);

-- Code Review
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (27, 'Code Review', 10, 1, 13);

-- Test Cases
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (28, 'Test Cases', 25, 1, 14);

-- Overall Score
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (35, 'Overall Score', 30, 2, 15);

-- Minimum Requirements Checklist
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (
    0, -- q_template_v_id , must be unique
    150, -- q_template_id, 
    2, -- project_type, 1 for design, 2 for development
    2, -- scorecard_type, 1 for screening, 2 for review
    'The implementation addresses the functionality as detailed in the component design documents.
    Where applicable, list the missing elements below.', -- question_text
    25, -- question_weight
    1, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    32, -- section_id
    2, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions, 3 for TestCaseQuestions
    4, -- template_id
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 151, 2, 2,
    'The implementation correctly uses all required technologies (language, required components, etc.) and packages.
If required technologies or packages are not used properly, explain why.',
    25, 2, 32, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 152, 2, 2,
    'The implementation properly implements required algorithms as defined in section 1.3 of the Component Specification.',
    25, 3, 32, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 153, 2, 2,
    'The implementation has not modified the public API as defined in the design.
This includes no additional public classes, methods or variables.',
    25, 4, 32, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Class Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 154, 2, 2,
    'All classes are implementated as defined in the design documents.  This not only includes technical details such as modifiers and types, but also naming conventions.',
    50, 1, 23, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 155, 2, 2,
    'Defined classes are implemented.
If not, list additional or missing classes.  Points should be deducted for adding classes that affect the public API.',
    50, 2, 23, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Variable Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 156, 2, 2,
    'All variables are implemented as defined in the design documents.  This not only includes technical details such as modifiers and types, but also naming conventions.',
    1, 1, 24, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Method Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 157, 2, 2,
    'All methods are implemented as defined in the design documents.  This not only includes technical details such as modifiers, types, arguments and exceptions, but also naming conventions.',
    1, 1, 25, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Relationships
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 158, 2, 2,
    'The implementation properly maps class relationships.',
    1, 1, 26, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Code Review
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 159, 2, 2,
    'The object types defined in the implementation are the best choice for the intended usage.  For example, using a Vector vs. an array.',
    25, 1, 27, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 160, 2, 2,
    'There are no needless loops.',
    25, 2, 27, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 161, 2, 2,
    'There is no needless/careless object instantiation or variable assignment.',
    25, 3, 27, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 162, 2, 2,
    'The implementation code contains detailed documentation for classes, methods and variables as defined in the Deliverables Document.',
    25, 4, 27, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Test Cases
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 163, 2, 2,
    'Unit Test Cases thoroughly test all methods and constructors.',
    4, 1, 28, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 164, 2, 2,
    'Where applicable, Unit Test Cases properly make use of setup and teardown methods to configure the test environment.',
    4, 2, 28, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 165, 2, 2,
    'Where applicable, files used in Unit Test Cases exist in the /test_files directory.',
    4, 3, 28, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 166, 2, 2,
    'Where applicable, Unit Test cases do not leave temporary files on the file system after testing is complete.',
    4, 4, 28, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 167, 2, 2,
    'The unit test code contains detailed documentation for classes, methods and variables as defined in the Deliverables Document.',
    4, 5, 28, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Review Board Test Cases
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 168, 2, 2,
    'Review Board Test Cases:
(Stress, Accuracy or Failure tests)
Stress / Benchmark: Tests the implementation according to performance and throughput.  Output basic benchmarking to System.out.
Accuracy: Tests the implementation on the accuracy of the results when using the component.
Failure: Tests the implementation''s ability to handle bad data and incorrect usage.
Please specify the type of test cases that were authored and executed, the total number of tests and the number of tests that were successful.',
    80, 6, 28, 3, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Overall Score
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 169, 2, 2,
    'Overall, this is a quality implementation that meets all requirements.
Please detail any additional comments regarding the component implementation.',
    1, 1, 35, 2, 4, CURRENT YEAR TO FRACTION(3), 287998, 1);


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
