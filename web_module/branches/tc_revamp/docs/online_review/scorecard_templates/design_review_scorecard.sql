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
		3, -- group_id, must be unique
		'Component Design', -- group_name
		1 -- group_seq_loc, the ordering of section groups within a scorecard
		);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME,
	SECTION_WEIGHT, SECTION_SEQ_LOC, GROUP_ID )
	VALUES (
		16, -- section_id, must be unique
		'Component Design', -- section_name
		250, -- section_weight, how this section is weighted when scoring?
		1, -- section_seq_loc, the ordering of sections with a section group, starts from 1 in each group
		3 -- group_id, references the section group where this section belongs
);

INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (4, 'Class Diagram', 2);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (5, 'Other Diagrams', 3);
INSERT INTO SC_SECTION_GROUP ( GROUP_ID, GROUP_NAME, GROUP_SEQ_LOC )
	VALUES (6, 'Miscellaneous', 4);

-- Class Diagram
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (7, 'Class Definition', 150, 1, 4);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (8, 'Variable Definition', 25, 2, 4);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (9, 'Method Definition', 60, 3, 4);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (10, 'Relationships', 25, 4, 4);

-- Other Diagrams
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (11, 'Use-Case Diagram(s)', 50, 1, 5);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (12, 'Sequence Diagram(s)', 50, 2, 5);

-- Miscellaneous
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (13, 'Component Specification', 90, 1, 6);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (14, 'Exception/Error Handling', 50, 2, 6);
INSERT INTO SCORECARD_SECTION ( SECTION_ID, SECTION_NAME, SECTION_WEIGHT,
	SECTION_SEQ_LOC, GROUP_ID )
	VALUES (15, 'Overall Comments', 250, 3, 6);


-- Minimum Requirements Checklist
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE, TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (
    0, -- q_template_v_id , must be unique
    50, -- q_template_id, 
    1, -- project_type, 1 for design, 2 for development
    2, -- scorecard_type, 1 for screening, 2 for review
    'The design addresses the functionality as detailed in the Requirements Specification.
Where applicable, list the missing elements below.', -- question_text
    70, -- question_weight
    1, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    16, -- section_id
    2, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions
    2, -- template_id
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 51, 1, 2,
    'The design effectively uses all required technologies (language, required components, etc.).
If technologies are not used correctly, explain why.',
    10, 2, 16, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 52, 1, 2,
    'The design incorporates standard design patterns and methodologies where applicable (i.e. Model-View-Controller, Factory Pattern, Object Oriented design principles, follows J2EE specs).
If patterns should be applied to the design, explain below.',
    10, 3, 16, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 53, 1, 2,
    'The design balances the use of design patterns and principles with the expected component usage.
For example, a design may define object factories and adhere to OO design principles in an effort to be robust and extensible.  However, all the component is ever intended to do is print "Hello World" to standard output.  Basically, is the design "overkill."',
    5, 4, 16, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 54, 1, 2,
    'The design accounts for incorporating additional functionality and features beyond the initial intended usage.
This includes being able to extend the functionality without needing to change the core design.  Are there any assumptions that prevent extension?',
    5, 5, 16, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Class Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 55, 1, 2,
    'The class diagram(s) accurately and thoroughly depicts the required elements of this component.',
    40, 1, 7, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 56, 1, 2,
    'This is a suitable design given the expected component usage and throughput requirements.
    (i.e.e Singleton pattern, Object Factory, Frameworks, does not violate technical specs (EJB 2.0))',
    40, 2, 7, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 57, 1, 2,
    'The Class documentation in the ''Documentation'' tab of Poseidon provides a detailed description of intended class usage.',
    20, 3, 7, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Variable Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 58, 1, 2,
    'Variable types are suitable for the expected component usage.',
    80, 1, 8, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 59, 1, 2,
    'The variable documentation in the ''Documentation'' tab of Poseidon provides detailed descriptions of variable type, scope, initial value and intended usage.',
    20, 2, 8, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Method Definition
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 60, 1, 2,
    'The defined methods properly expose the API requirements defined in the Requirements Specification.',
    20, 1, 9, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 61, 1, 2,
    'Methods provide access to and properly encapsulate the defined variables.',
    20, 2, 9, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 62, 1, 2,
    'The Exceptions defined is an inclusive list of the anticipated exceptions.',
    20, 3, 9, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 63, 1, 2,
    'The method documentation in the ''Documentation'' tab of Poseidon provides detailed descriptions of method arguments, return type, scope, exceptions and intended usage.',
    20, 4, 9, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 64, 1, 2,
    'The method documentation in the ''Documentation'' tab of Poseidon provides detailed valid and invalid argument values to facilitate test case creation.',
    20, 5, 9, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Relationships
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 65, 1, 2,
    'Class relationships are well defined.',
    1, 1, 10, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Other Diagrams
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 66, 1, 2,
    'Contain use cases that accurately depict the defined functional usage of the component.',
    50, 1, 11, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 67, 1, 2,
    'All public methods are represented in the use cases.',
    50, 2, 11, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Sequence Diagrams
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 68, 1, 2,
    'Thoroughly depicts the ordered interaction between classes.',
    50, 1, 12, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 69, 1, 2,
    'Sequence diagrams exist for each implementation of a use case',
    50, 2, 12, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Component Specification
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 70, 1, 2,
    'The Component Specification provides sufficient information for this design to be implemented.
List any missing elements or outstanding questions.',
    75, 1, 13, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 71, 1, 2,
    'Contains a comprehensive outline of the required Benchmark data and Stress tests.',
    25, 2, 13, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Exception / Error Handling
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 72, 1, 2,
    'Exceptions are clearly defined and well documented in either the Component Specification or the .zargo file.',
    50, 1, 14, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 73, 1, 2,
    'The design clearly defines how invalid arguments (including null arguments) are to be handled.',
    50, 2, 14, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);

-- Overall Comments
INSERT INTO QUESTION_TEMPLATE ( Q_TEMPLATE_V_ID, Q_TEMPLATE_ID, PROJECT_TYPE,
	SCORECARD_TYPE, QUESTION_TEXT, QUESTION_WEIGHT, QUESTION_SEQ_LOC,
	SECTION_ID, QUESTION_TYPE,  TEMPLATE_ID, MODIFY_DATE, MODIFY_USER,
	CUR_VERSION )
	VALUES (0, 74, 1, 2,
    'Overall, this is a quality design that meets all requirements.
Please detail any additional comments regarding the component design.',
    1, 1, 15, 2, 2, CURRENT YEAR TO FRACTION(3), 287998, 1);


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
