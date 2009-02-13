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
    1, -- group_id, must be unique
    'Minimum Requirements Checklist', -- group_name
    1 -- group_seq_loc, the ordering of section groups within a scorecard
);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (
    1, -- section_id, must be unique
    'Minimum Requirements Checklist', -- section_name
    0, -- section_weight, how this section is weighted when scoring?
    1, -- section_seq_loc, the ordering of sections with a section group, starts from 1 in each group
    1 -- group_id, references the section group where this section belongs
);

INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (2, 'Design Review', 2);

INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (2, 'Class Definition', 30, 1, 2);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (3, 'Variable Definition', 10, 2, 2);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (4, 'Method Definition', 15, 3, 2);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (5, 'Diagrams', 35, 4, 2);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (6, 'Anonymity', 10, 4, 2);


-- Minimum Requirements Checklist
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (
    0, -- q_template_v_id , must be unique
    1, -- q_template_id, 
    1, -- project_type, 1 for design, 2 for development
    1, -- scorecard_type, 1 for screening, 2 for review
    'Diagrams exist in a .zargo file that can be opened using Poseidon.', -- question_text
    1, -- question_weight
    1, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    1, -- section_id
    1, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions
    1, -- template_id
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 2, 1, 1,
    'A Class Diagram exists in the .zargo file.',
    1, 2, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 3, 1, 1,
    'Use-Case Diagram(s) exist(s) in the .zargo file.',
    1, 3, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 4, 1, 1,
    'Sequence Diagram(s) exist(s) in the .zargo file.',
    1, 4, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 5, 1, 1,
    'Component Specification exists.',
    1, 5, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 6, 1, 1,
    'Class stubs exist for all classes in the design.',
    1, 6, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 7, 1, 1,
    'Class stubs exist and compile successfully. (Execute ''ant compile'')
    This may require additional packages as defined in the Component Specification under sections 2.2 and 2.3.',
    1, 7, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 7, 1, 1,
    'The design compiles against required targets. (Execute ''ant compile_targets'')
    This will require modification of the target version jar path in build.xml.',
    1, 8, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 8, 1, 1,
    'If algorithms are required in section 1.3 of the Requirements Specification, are algorithms defined in section 1.3 of the Component Specification?
If algorithms are not required, disregard this question.',
    1, 9, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 8, 1, 1,
    'None of the submitter''s personal information (handle, name, email address, etc.) appears in the submission.',
    1, 9, 1, 1, 1, CURRENT YEAR TO FRACTION( 3 ), 287998, 1 );

-- Class Diagram Section
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 9, 1, 1,
    'Provides a descriptive overview of class usage in the Documentation tab of Poseidon',
    10, 1, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 10, 1, 1,
    'Where applicable sub-packages have been created to separate functionality.',
    10, 2, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 11, 1, 1,
    'Class scope properly matches class usage. (i.e. objects defined as public packages)',
    20, 3, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 12, 1, 1,
    'Proper and effective use of inheritance and abstraction.  The Component is designed to be extended',
    20, 4, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 13, 1, 1,
    'Interfaces are used appropriately.',
    20, 5, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 14, 1, 1,
    'Suitable constructors are defined for the component.',
    10, 6, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 15, 1, 1,
    'Class modifiers such as final, static, abstract are appropriately used where applicable.',
    10, 7, 2, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Variable Definition Section
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 16, 1, 1,
    'Variable scope is correctly defined (i.e. the variables are well encapsulated.)',
    25, 1, 3, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 17, 1, 1,
    'Type assignments are defined with respect to both efficiency and flexibility as pertains to this component.
(i.e. generic objects may be used to increase component flexibility at the cost of efficiency.)',
    25, 2, 3, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 18, 1, 1,
    'Variable details (scope, type, name, description) are defined in the ''Documentation'' tab of Poseidon.',
    25, 3, 3, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 19, 1, 1,
    'Variables are defined with an initial value.  The initial value may be null, but that must be stated.',
    25, 4, 3, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);


-- Method Definition
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 20, 1, 1,
    'Method scope is correctly defined (i.e. Not everything is public.)',
    15, 1, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 21, 1, 1,
    'All exceptions are properly handled and thrown.  Custom exceptions must be displayed in the diagram.
(If exceptions are not detailed in the Class Diagram, they must be detailed in the Component Specification.)',
    15, 2, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 22, 1, 1,
    'Modifiers are properly used where applicable.',
    14, 3, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 23, 1, 1,
    'Return types are appropriately defined.
(i.e. instead of returning a Boolean for success/failure, an Exception is thrown).',
    14, 4, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 24, 1, 1,
    'Method arguments are appropriately defined (i.e. instead of passing in 10+ arguments an object is passed in).',
    14, 5, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 25, 1, 1,
    'The required API as stated in the requirements specification is available.',
    14, 6, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 27, 1, 1,
    'Variable details (scope, type, name, description) are defined in the ''Documentation''n tab of Poseidon.',
    14, 7, 4, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Diagrams
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 28, 1, 1,
    'The Use Case Diagrams reflect the functionality as outlined in the Requirements Specification.',
    50, 1, 5, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 29, 1, 1,
    'At least one Sequence Diagram exists for each defined use case.',
    50, 2, 5, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Anonymity
INSERT INTO QUESTION_TEMPLATE  ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 30, 1, 1,
    'The submission does not contain any information identifying the designer.',
    100, 1, 6, 2, 1, CURRENT YEAR TO FRACTION(3), 287998, 1);



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
