/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
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
 * @author TCSDEVELOPER
 * @version 1.1
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
    public static final int SPECIFICATION_CONTEST_PAYMENT = 42;
    public static final int CONCEPTUALIZATION_CONTEST_PAYMENT = 43;
    public static final int TESTING_COMPETITION_PAYMENT = 44;

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

    public static final int DEFAULT_PAYMENT_METHOD_ID = 1;

    public static final int ASSEMBLY_PROJECT_CATEGORY_LU = 14;
    public static final int ARCHITECTURE_PROJECT_CATEGORY_LU = 7;
    public static final int CONCEPTUALIZATION_PROJECT_CATEGORY_LU = 23;
    public static final int SPECIFICATION_PROJECT_CATEGORY_LU = 6;
    public static final int APPLICATION_TESTING_PROJECT_CATEGORY_LU = 13;
}
