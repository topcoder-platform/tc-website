-- For creating the scorecard templates first create section groups and sections.
-- all the seq_loc(sequence location) are relative within their enviornment
-- (section/section_group).

-- The question_template is versioned so for creating this initial template
-- q_template_v_id and q_template_id can be the same value.

-- There should be one set of questions for each of the four combinations of
-- project_type and scorecard_type.

EXECUTE PROCEDURE IFX_ALLOW_NEWLINE('T');

INSERT INTO SC_SECTION_GROUP VALUES (
    3, -- group_id, must be unique
    'Component Design', -- group_name
    1 -- group_seq_loc, the ordering of section groups within a scorecard
);
INSERT INTO SCORECARD_SECTION VALUES (
    6, -- section_id, must be unique
    'Component Design', -- section_name
    2, -- section_weight, how this section is weighted when scoring?
    1, -- section_seq_loc, the ordering of sections with a section group, starts from 1 in each group
    3 -- group_id, references the section group where this section belongs
);

-- Minimum Requirements Checklist
INSERT INTO QUESTION_TEMPLATE VALUES (
    0, -- q_template_v_id , must be unique
    50, -- q_template_id, 
    1, -- project_type, 1 for design, 2 for development
    2, -- scorecard_type, 1 for screening, 2 for review
    'The design addresses the functionality as detailed in the Requirements Specification.
    Where applicable, list the missing elements below.', -- question_text
    4, -- question_weight
    1, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    6, -- section_id
    2, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

INSERT INTO QUESTION_TEMPLATE VALUES (
    0, -- q_template_v_id , must be unique
    51, -- q_template_id, 
    1, -- project_type, 1 for design, 2 for development
    2, -- scorecard_type, 1 for screening, 2 for review
    'Sample TestCaseScorecardQuestion', -- question_text
    4, -- question_weight
    2, -- question_seq_loc, the ordering of questions within a section, starts from 1 in each section
    6, -- section_id
    3, -- question_type - 1 for Objective questions(yes/no), 2 for Subjective Questions, 3 for TestCaseQuestions
    CURRENT YEAR TO FRACTION(3), -- modify_date, in this case the creation date
    287998, -- modify_user, login_id for the creator of the template
    1 -- cur_version, should be set to 1
);

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
