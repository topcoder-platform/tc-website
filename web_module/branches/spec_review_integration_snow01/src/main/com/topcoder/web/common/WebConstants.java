/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

/**
 * <p><strong>Purpose</strong>: This interface is used to define constants for general use.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added constants to support new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Specification Review Integration,
 *					copied from Specification Review Signup Pages 1.0) Change notes:
 *   <ol>
 *     <li>Added several constants to support Specification Review projects.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, TCSASSEMBLER
 * @version 1.3
 */
public interface WebConstants {
    public static final String HANDLE = "ha";
    public static final String ROUND_ID = "rd";
    public static final String ROOM_ID = "rm";
    public static final String FORUM_ID = "forumID";
    public static final String STATIC_PREFIX = "d";
    public static final String TIMEZONE = "tz";
    public static final String USER_ID = "uid";
    public static final String COMPANY_ID = "cm";
    public static final String COMPONENT_ID = "cd";
    public static final String CONTEST_ID = "ct";
    public static final String SUBMISSION_TYPE_ID = "st";
    public static final String PROBLEM_ID = "pm";
    public static final String CLASSROOM_ID = "clsid";
    public static final String STUDENT_ID = "stid";
    public static final String ASSIGNMENT_ID = "asid";
    public static final String LANGUAGE_ID = "lid";
    public static final String PROBLEM_SET_ID = "pms";
    public static final String MODULE_KEY = "module";
    public static final String PROJECT_ID_KEY = "pj";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String IMAGE_TYPE = "it";

    public static final String FULL_NAME = "flnm";

    public static final String PASSWORD_CONFIRM = "pac";
    public static final String EMAIL = "em";
    public static final String EMAIL_CONFIRM = "emc";
    public static final String TITLE = "ttl";
    public static final String GIVEN_NAME = "fn";
    public static final String MIDDLE_NAME = "mn";
    public static final String SURNAME = "ln";
    public static final String ADDRESS1 = "a1";
    public static final String ADDRESS2 = "a2";
    public static final String ADDRESS3 = "a3";
    public static final String COUNTRY_CODE = "cc";
    public static final String STATE_CODE = "sc";
    public static final String PROVINCE = "prov";
    public static final String CITY = "city";
    public static final String POSTAL_CODE = "zip";
    public static final String PHONE_NUMBER = "ph";
    public static final String COMP_COUNTRY_CODE = "ccc";
    public static final String CONTEST_STATUS_ID = "ctstid";
    public static final String CONTEST_NAME = "ctname";
    public static final String START_TIME = "sttm";
    public static final String END_TIME = "etm";
    public static final String ROUND_NAME = "roundName";

    public static final String FULL_LIST = "full";
    public static final String EVENT_ID = "eid";

    public static final String TERMS = "terms";
    public static final String TERMS_AGREE = "terms_agree";
    public static final String TERMS_OF_USE_ID = "tuid";

    public static final String CODER_ID = "cr";
    public static final String ALGO_RATING_TYPE_ID = "ratid";
    public static final String PAYMENT_TYPE_ID = "pt";

    public static final String TRACK_ID = "tid";
    public static final String TRACK_TYPE_ID = "ttid";
    public static final String POTENTIAL_FLAG_ID = "pf";

    //secondary reg parameters
    public static final String CODER_TYPE = "cty";
    public static final String DEMOG_PREFIX = "demog_";

    public static final String ACTIVATION_CODE = "code";

    public static final String SCHOOL_ID = "scid";

    //resume parameters
    public static final String RESUME = "resume";

    public static final int PREFERENCE_TEXT_ANSWER = 3;
    public static final int PREFERENCE_MULTIPLE_ANSWER = 2;
    public static final int PREFERENCE_SINGLE_ANSWER = 1;

    public static final int SKILL_TYPE_TECHNOLOGIES = 4;
    public static final int SKILL_TYPE_DATABASES = 3;
    public static final int SKILL_TYPE_LANGUAGES = 2;
    public static final int SKILL_TYPE_OS = 1;
    public static final int SKILL_TYPE_INDUSTRIES = 5;

    public static final int TECH_NOTE_TYPE_ID = 11;
    public static final int DB_NOTE_TYPE_ID = 13;
    public static final int LANGUAGE_NOTE_TYPE_ID = 10;
    public static final int OS_NOTE_TYPE_ID = 12;
    public static final int INDUSTRY_NOTE_TYPE_ID = 14;

    public static final int PREFERENCE_CONTRACTING = 2;
    public static final int PREFERENCE_CONTRACTING_TRUE = 32;
    public static final int PREFERENCE_CONTRACTING_FALSE = 33;
    public static final int PREFERENCE_PERMANENT = 7;
    public static final int PREFERENCE_PERMANENT_TRUE = 34;
    public static final int PREFERENCE_PERMANENT_FALSE = 35;

    public static final String LEFT_NAV_KEY = "node";

    public static final int HS_ALGO_RATING_TYPE_ID = 2;
    public static final int TC_ALGO_RATING_TYPE_ID = 1;

    public static final String STATUS = "status";
    public static final String STATUS_START = "start";
    public static final char[] INACTIVE_STATI = {'0', '9', '6', '5', '4', 'I'};
    public static final char[] UNACTIVE_STATI = {'2', 'U'};
    public static final char[] ACTIVE_STATI = {'1', 'A'};
    public static final int EMAIL_ACTIVE_STATUS = 1;
    
    /**
     * Represents the name for specification reviewer type.
     * @since 1.3
     */
    public static final String SPECIFICATION_REVIEWER_TYPE = "Specification Reviewer";

    /**
     * The constant used to indicate a version is in the collaboration phase
     */
    public static final long PHASE_COLLABORATION = 111;
    /**
     * The constant used to indicate a version is in the specification phase
     */
    public static final long PHASE_DESIGN = 112;
    /**
     * The constant used to indicate a version is in the development phase
     */
    public static final long PHASE_DEVELOPMENT = 113;
    /**
     * The constant used to indicate a version is complete
     */
    public static final long PHASE_COMPLETED = 114;

    /* The following constants aren't really phases, but are the phase ids for the application tracks. */
    public static final long PHASE_CONCEPTUALIZATION = 134;
    public static final long PHASE_SPECIFICATION = 117;
    public static final long PHASE_ARCHITECTURE = 118;
    public static final long PHASE_ASSEMBLY = 125;

    /**
     * <p>A <code>long</code> representing phase offeset according to project id.</p>
     *
     * @since 1.1
     */
    public static final long GENERAL_PHASE_OFFSET = 111;
    
    /**
     * <p>An <code>int</code> representing specification competitions offsed.</p>
     *
     * <p>Note: the corresponding specification review phase for an existing project phase is defined to be the phase
     * id plus the offset.</p>
     *
     * @since 1.3
     */
    public static final int SPECIFICATION_COMPETITION_OFFSET = 1000;

    /**
     * The status constant used to indicate a component has been deleted
     */
    public static final long STATUS_DELETED = 0;
    /**
     * The status constant used to indicate a component has been requested
     */
    public static final long STATUS_REQUESTED = 101;
    /**
     * The status constant used to indicate a component has been approved
     */
    public static final long STATUS_APPROVED = 102;
    /**
     * The status constant used to indicate a component has been declined
     * because it is a duplicate of another existing component
     */
    public static final long STATUS_DUPLICATE = 103;
    /**
     * The status constant used to indicate a component has been declined
     */
    public static final long STATUS_DECLINED = 104;

    public static final long NET_CATALOG = 5801777;
    public static final long JAVA_CATALOG = 5801776;
    public static final long FLASH_CATALOG = 8459260;
    public static final long NET_CUSTOM_CATALOG = 5801779;
    public static final long JAVA_CUSTOM_CATALOG = 5801778;
    public static final long APPLICATION_CATALOG = 9926572;

    public static final long TCS_FORUMS_ROOT_CATEGORY_ID = 22;

    public static final String CANDIDATE_IDS = "cids";

    public static final int HS_MIN_REG_AGE = 13;
    public static final int HS_MAX_REG_AGE = 20;

    public static final int ACTIVE_EMAIL_STATUS = 1;

    public static final int DW_DATASOURCE_ID = 27;
    public static final int TCS_DW_DATASOURCE_ID = 31;
    public static final int TCS_OLTP_DATASOURCE_ID = 28;

    public static final int DESIGN_PROJECT_TYPE = 1;
    public static final int DEVELOPMENT_PROJECT_TYPE = 2;
    public static final int COMPONENT_TESTING_PROJECT_TYPE = 5;
    public static final int ARCHITECTURE_PROJECT_TYPE = 7;
    public static final int CONCEPTUALIZATION_PROJECT_TYPE = 23;
    public static final int SPECIFICATION_PROJECT_TYPE = 6;

    /**
     * <p>An <code>int</code> representing test suites project type id.</p>
     *
     * @since 1.2
     */
    public static final int TEST_SUITES_PROJECT_TYPE = 13;

    /**
     * <p>An <code>int</code> representing test scenarios project type id.</p>
     *
     * @since 1.2
     */
    public static final int TEST_SCENARIOS_PROJECT_TYPE = 26;

    public static final int ASSEMBLY_PROJECT_TYPE = 14;

    /**
     * <p>An <code>int</code> representing ui prototype project type id.</p>
     *
     * @since 1.1
     */
    public static final int UI_PROTOTYPE_PROJECT_TYPE = 19;

    /**
     * <p>An <code>int</code> representing ria build project type id.</p>
     *
     * @since 1.1
     */
    public static final int RIA_BUILD_PROJECT_TYPE = 24;

    /**
     * <p>An <code>int</code> representing ria component project type id.</p>
     *
     * @since 1.1
     */
    public static final int RIA_COMPONENT_PROJECT_TYPE = 25;
	
	/**
     * <p>An <code>long</code> representing design specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long DESIGN_SPECIFICATION_PROJECT_TYPE =
        DESIGN_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing development specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long DEVELOPMENT_SPECIFICATION_PROJECT_TYPE =
        DEVELOPMENT_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing conceptualization specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE =
        CONCEPTUALIZATION_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing specification specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long SPECIFICATION_SPECIFICATION_PROJECT_TYPE =
        SPECIFICATION_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing architecture specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long ARCHITECTURE_SPECIFICATION_PROJECT_TYPE =
        ARCHITECTURE_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing assembly specification project category id.</p>
     *
     * @since 1.1
     */
    public static final long ASSEMBLY_SPECIFICATION_PROJECT_TYPE =
        ASSEMBLY_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;
    
    /**
     * <p>An <code>long</code> representing test suites specification project category id.</p>
     *
     * @since 1.3
     */
    public static final long TEST_SUITES_SPECIFICATION_PROJECT_TYPE =
        TEST_SUITES_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing test scenarios specification project category id.</p>
     *
     * @since 1.3
     */
    public static final long TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE =
        TEST_SCENARIOS_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ui prototype specification project category id.</p>
     *
     * @since 1.3
     */
    public static final long UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE =
        UI_PROTOTYPE_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ria buid specification project category id.</p>
     *
     * @since 1.3
     */
    public static final long RIA_BUILD_SPECIFICATION_PROJECT_TYPE =
        RIA_BUILD_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ria component specification project category id.</p>
     *
     * @since 1.3
     */
    public static final long RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE =
        RIA_COMPONENT_PROJECT_TYPE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>A <code>long</code> representing ui prototype phase id.</p>
     *
     * @since 1.1
     */
    public static final long PHASE_UI_PROTOTYPE = UI_PROTOTYPE_PROJECT_TYPE + GENERAL_PHASE_OFFSET;

    /**
     * <p>A <code>long</code> representing ria build phase id.</p>
     *
     * @since 1.1
     */
    public static final long PHASE_RIA_BUILD = RIA_BUILD_PROJECT_TYPE + GENERAL_PHASE_OFFSET;

    /**
     * <p>A <code>long</code> representing ria component phase id.</p>
     *
     * @since 1.1
     */
    public static final long PHASE_RIA_COMPONENT = RIA_COMPONENT_PROJECT_TYPE + GENERAL_PHASE_OFFSET;

    /**
     * <p>A <code>long</code> representing test suites phase id.</p>
     *
     * @since 1.2
     */
    public static final long PHASE_TEST_SUITES = TEST_SUITES_PROJECT_TYPE + GENERAL_PHASE_OFFSET;

    /**
     * <p>A <code>long</code> representing test scenarios phase id.</p>
     *
     * @since 1.2
     */
    public static final long PHASE_TEST_SCENARIOS = TEST_SCENARIOS_PROJECT_TYPE + GENERAL_PHASE_OFFSET;

    /**
     * <p>An <code>long</code> representing design specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_DESIGN_SPECIFICATION = PHASE_DESIGN + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing development specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_DEVELOPMENT_SPECIFICATION = PHASE_DEVELOPMENT + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing conceptualization specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_CONCEPTUALIZATION_SPECIFICATION =
        PHASE_CONCEPTUALIZATION + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing specification specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_SPECIFICATION_SPECIFICATION =
        PHASE_SPECIFICATION + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing architecture specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_ARCHITECTURE_SPECIFICATION = PHASE_ARCHITECTURE + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing assembly specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_ASSEMBLY_SPECIFICATION =  PHASE_ASSEMBLY + SPECIFICATION_COMPETITION_OFFSET;

    /**
     * <p>An <code>long</code> representing test suite competition specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_TEST_SUITES_SPECIFICATION =
        PHASE_TEST_SUITES + SPECIFICATION_COMPETITION_OFFSET;
		
	/**
     * <p>An <code>long</code> representing test scenarios competition specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_TEST_SCENARIOS_SPECIFICATION =
        PHASE_TEST_SCENARIOS + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ui prototype competition specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_UI_PROTOTYPE_SPECIFICATION =
        PHASE_UI_PROTOTYPE + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ria build competition specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_RIA_BUILD_SPECIFICATION =
        PHASE_RIA_BUILD + SPECIFICATION_COMPETITION_OFFSET;
        
    /**
     * <p>An <code>long</code> representing ria component competition specification phase id.</p>
     *
     * @since 1.3
     */
    public static final long PHASE_RIA_COMPONENT_SPECIFICATION =
        PHASE_RIA_COMPONENT + SPECIFICATION_COMPETITION_OFFSET;

}
