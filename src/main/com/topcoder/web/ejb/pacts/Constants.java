/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

/**
 * <p>This class stores a variety of constants for PACTS.</p>
 *
 * <p>
 *   Version 1.1 (PACTS Release Assembly 1.1.1) Change notes:
 *   <ol>
 *     <li>Added constants to support Copilot, Studio bug fixes, Studio enhancements and Studio specification review
 *         Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (BUGR-1843, BUGR-1845) Change notes:
 *   <ol>
 *     <li>Added constants to support Specification Writing, Studio Specification Writing, UI Prototype Competition,
 *         RIA Build Competition and RIA Component Competition Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (BUGR-1901) Change notes:
 *   <ol>
 *     <li>Added constants to support Deployment task Payments.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.5 Change notes:
 *   <ol>
 *     <li>STUDIO_SUBMISSION_SCREENING_PAYMENT type added</li>
 *     <li>STUDIO_COPILOT_PAYMENT type added</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.6 (Copilot Selection Contest Online Review and TC Site Integration Assembly version 1.0) Change notes:
 *   Add Support for copilot posting
 *   <ol>
 *     <li>COPILOT_POSTING_PROJECT_CATEGORY_LU added</li>
 *     <li>COPILOT_POSTING_PAYMENT added</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.7 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) Change notes:
 *   Add Support for content creation.
 *   <ol>
 *     <li>CONTENT_CREATION_PROJECT_CATEGORY_LU added</li>
 *     <li>CONTENT_CREATION_PAYMENT added</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.9 Change notes:
 *   <ol>
 *     <li>Added taxable DR payment types.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.9 Change notes:
 *   <ol>
 *     <li>Added common payment types for all tracks. No more separate payments for architecture, assembly, components etc.</li>
 *   </ol>
 * </p> 
 *
 * @author TCSDEVELOPER, pulky, VolodymyrK
 * @version 1.9
 */
public interface Constants {

    public static final int ALGORITHM_CONTEST_PAYMENT = 1;
    public static final int CONTRACT_PAYMENT = 2;
    public static final int PROBLEM_PAYMENT = 3;
    public static final int CODER_REFERRAL_PAYMENT = 4;
    public static final int CHARITY_PAYMENT = 5;
    public static final int COMPONENT_PAYMENT = 6;
    public static final int REVIEW_BOARD_PAYMENT = 7;
    public static final int ONE_OFF_PAYMENT = 8;
    public static final int ARTICLE_PAYMENT = 9;
    public static final int ASSEMBLY_PAYMENT = 10;
    public static final int TESTING_PAYMENT = 11;
    public static final int LOGO_CONTEST_PAYMENT = 12;
    public static final int TC_STUDIO_PAYMENT = 13;
    public static final int PROBLEM_TESTING_PAYMENT = 14;
    public static final int PROBLEM_WRITING_PAYMENT = 15;
    public static final int CCIP_PAYMENT = 16;
    public static final int DIGITAL_RUN_PRIZE_PAYMENT = 17;
    public static final int DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT = 18;
    public static final int COMPONENT_TOURNAMENT_BONUS_PAYMENT = 19;
    public static final int ROYALTY_PAYMENT = 20;
    public static final int MARATHON_MATCH_PAYMENT = 21;
    public static final int ALGORITHM_TOURNAMENT_PRIZE_PAYMENT = 22;
    public static final int BUG_FIXES_PAYMENT = 23;
    public static final int RELIABILITY_BONUS_PAYMENT = 24;
    public static final int DIGITAL_RUN_TOP_THIRD_PAYMENT = 25;
    public static final int ARCHITECTURE_REVIEW_PAYMENT = 26;
    public static final int SPECIFICATION_REVIEW_PAYMENT = 27;
    public static final int ASSEMBLY_COMPETITION_REVIEW = 28;
    public static final int ARCHITECTURE_PAYMENT = 29;
    public static final int PREDICTIVE_CONTEST_PAYMENT = 30;
    public static final int INTRO_EVENT_COMP_PAYMENT = 31;
    public static final int MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT = 32;
    public static final int TC_STUDIO_TOURNAMENT_PRIZE_PAYMENT = 33;
    public static final int HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT = 34;
    public static final int COLLEGE_TOUR_REP_PAYMENT = 35;
    public static final int STUDIO_REVIEW_BOARD_PAYMENT = 36;
    public static final int COMPONENT_ENHANCEMENTS_PAYMENT = 37;
    public static final int REVIEW_BOARD_BONUS_PAYMENT = 38;
    public static final int COMPONENT_BUILD_PAYMENT = 39;
    public static final int DIGITAL_RUN_V2_PRIZE_PAYMENT = 40;
    public static final int DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT = 41;
    public static final int DIGITAL_RUN_V2_TAXABLE_PRIZE_PAYMENT = 62;
    public static final int DIGITAL_RUN_V2_TAXABLE_TOP_PERFORMERS_PAYMENT = 63;
    public static final int SPECIFICATION_CONTEST_PAYMENT = 42;
    public static final int CONCEPTUALIZATION_CONTEST_PAYMENT = 43;

    /**
     * <p>A <code>int</code> representing the payment id for test suites.</p>
     *
     * @since 1.4
     */
    public static final int TEST_SUITES_PAYMENT = 44;

    /**
     * <p>A <code>int</code> representing the payment id for test scenarios.</p>
     *
     * @since 1.4
     */
    public static final int TEST_SCENARIOS_PAYMENT = 55;

    /**
     * <p>A <code>int</code> representing the payment type for Copilot payments.</p>
     *
     * @since 1.1
     */
    public static final int COPILOT_PAYMENT = 45;

    /**
     * <p>A <code>int</code> representing the payment type for Studio bug fixes payments.</p>
     *
     * @since 1.1
     */
    public static final int STUDIO_BUG_FIXES_PAYMENT = 46;

    /**
     * <p>A <code>int</code> representing the payment type for Studio enhancements payments.</p>
     *
     * @since 1.1
     */
    public static final int STUDIO_ENHANCEMENTS_PAYMENT = 47;

    /**
     * <p>A <code>int</code> representing the payment type for Studio specification review payments.</p>
     *
     * @since 1.1
     */
    public static final int STUDIO_SPECIFICATION_REVIEW_PAYMENT = 48;

    /**
     * <p>A <code>int</code> representing the payment type for Studio submission screening payments.</p>
     *
     * @since 1.5
     */
    public static final int STUDIO_SUBMISSION_SCREENING_PAYMENT = 56;

    /**
     * <p>A <code>int</code> representing the payment type for Studio copilot payments.</p>
     *
     * @since 1.5
     */
    public static final int STUDIO_COPILOT_PAYMENT = 57;

    /**
     * <p>A <code>int</code> representing the payment type for UI prototype payments.</p>
     *
     * @since 1.2
     */
    public static final int UI_PROTOTYPE_COMPETITION_PAYMENT = 49;

    /**
     * <p>A <code>int</code> representing the payment type for RIA build payments.</p>
     *
     * @since 1.2
     */
    public static final int RIA_BUILD_COMPETITION_PAYMENT = 50;

    /**
     * <p>A <code>int</code> representing the payment type for RIA component payments.</p>
     *
     * @since 1.2
     */
    public static final int RIA_COMPONENT_COMPETITION_PAYMENT = 51;

    /**
     * <p>A <code>int</code> representing the payment type for specification writing payments.</p>
     *
     * @since 1.2
     */
    public static final int SPECIFICATION_WRITING_PAYMENT = 52;

    /**
     * <p>A <code>int</code> representing the payment type for studio specification writing payments.</p>
     *
     * @since 1.2
     */
    public static final int STUDIO_SPECIFICATION_WRITING_PAYMENT = 53;

    /**
     * <p>A <code>int</code> representing the payment type for deployment task payments.</p>
     *
     * @since 1.3
     */
    public static final int DEPLOYMENT_TASK_PAYMENT = 54;

    public static final int NO_REFERENCE = 0;
    public static final int REFERENCE_ALGORITHM_ROUND_ID = 1;
    public static final int REFERENCE_COMPONENT_PROJECT_ID = 2;
    public static final int REFERENCE_ALGORITHM_PROBLEM_ID = 3;
    public static final int REFERENCE_STUDIO_CONTEST_ID = 4;
    public static final int REFERENCE_COMPONENT_CONTEST_ID = 5;
    public static final int REFERENCE_DIGITAL_RUN_STAGE_ID = 6;
    public static final int REFERENCE_DIGITAL_RUN_SEASON_ID = 7;
    public static final int REFERENCE_PARENT_PAYMENT_ID = 8;
    public static final int REFERENCE_DIGITAL_RUN_TRACK_ID = 9;

    // Modification rationale codes
    public static final int MODIFICATION_NEW = 1;
    public static final int MODIFICATION_ADDRESS = 2;
    public static final int MODIFICATION_WITHOLDING_AMOUNT = 3;
    public static final int MODIFICATION_NET_AMOUNT = 4;
    public static final int MODIFICATION_GROSS_AMOUNT = 5;
    public static final int MODIFICATION_DATE_PAID = 7;
    public static final int MODIFICATION_STATUS = 8;
    public static final int MODIFICATION_REFERENCE = 9;
    public static final int MODIFICATION_DESCRIPTION = 10;
    public static final int MODIFICATION_MULTIPLE_FIELDS = 11;

    // Type of affidavit to use for algorithm contests.
    public static final int ALGORITHM_AFFIDAVIT_TYPE = 1;

    public static final int AFFIDAVIT_PENDING_STATUS = 57;
    public static final int AFFIDAVIT_AFFIRMED_STATUS = 58;
    public static final int AFFIDAVIT_EXPIRED_STATUS = 59;

    public static final int AFFIDAVIT_CANCELED_STATUS = 75;
    public static final int AFFIDAVIT_DELETED_STATUS = 76;

    public static final long NOT_SET_PAYMENT_METHOD_ID = 1;

    public static final int ASSEMBLY_PROJECT_CATEGORY_LU = 14;
    public static final int ARCHITECTURE_PROJECT_CATEGORY_LU = 7;
    public static final int CONCEPTUALIZATION_PROJECT_CATEGORY_LU = 23;
    public static final int SPECIFICATION_PROJECT_CATEGORY_LU = 6;

    /**
     * <p>A <code>int</code> representing the test suites project category id.</p>
     *
     * @since 1.4
     */
    public static final int TEST_SUITES_PROJECT_CATEGORY_LU = 13;

    /**
     * <p>A <code>int</code> representing the test scenarios project category id.</p>
     *
     * @since 1.4
     */
    public static final int TEST_SCENARIOS_PROJECT_CATEGORY_LU = 26;

    public static final int UI_PROTOTYPE_COMPETITION_PROJECT_CATEGORY_LU = 19;
    public static final int RIA_BUILD_COMPETITION_PROJECT_CATEGORY_LU = 24;
    public static final int RIA_COMPONENT_COMPETITION_PROJECT_CATEGORY_LU = 25;

     /**
     * <p>A <code>int</code> representing the copilot posting category id.</p>
     *
     * @since 1.6
     */
    public static final int COPILOT_POSTING_PROJECT_CATEGORY_LU = 29;

    /**
     * <p>A <code>int</code> representing the copilot posting payment id.</p>
     *
     * @since 1.6
     */
    public static final int COPILOT_POSTING_PAYMENT = 60;


    /**
     * <p>A <code>int</code> representing the content creation category id.</p>
     *
     * @since 1.7
     */
    public static final int CONTENT_CREATION_PROJECT_CATEGORY_LU = 35;

    /**
     * <p>A <code>int</code> representing the content creation payment id.</p>
     *
     * @since 1.7
     */
    public static final int CONTENT_CREATION_PAYMENT = 61;

    /**
     * <p>A <code>int</code> representing the milestone prize payment id.</p>
     * <p>This is the payment to be used for milestone payments for all tracks.</p>
     *
     * @since 1.9
     */
    public static final int CONTEST_MILESTONE_PAYMENT = 64;
	
	 /**
     * <p>A <code>int</code> representing the prize payment id.</p>
     * <p>This is the payment to be used for prize payments for all tracks going forward.
	 * No more separate payments for architecture, assembly, components etc. </p>
     *
     * @since 1.9
     */
    public static final int CONTEST_PAYMENT = 65;
}
