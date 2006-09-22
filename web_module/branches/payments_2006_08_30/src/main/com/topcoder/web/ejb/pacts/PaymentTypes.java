package com.topcoder.web.ejb.pacts;

public interface PaymentTypes {
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
    
    
    public static final int NO_REFERENCE = 0;
    public static final int REFERENCE_ALGORITHM_ROUND_ID = 1;
    public static final int REFERENCE_COMPONENT_PROJECT_ID = 2;
    public static final int REFERENCE_ALGORITHM_PROBLEM_ID = 3;
    public static final int REFERENCE_STUDIO_CONTEST_ID = 4;
    public static final int REFERENCE_COMPONENT_CONTEST_ID = 5;
    public static final int REFERENCE_DIGITAL_RUN_STAGE_ID = 6;
    public static final int REFERENCE_DIGITAL_RUN_SEASON_ID = 7;
    public static final int REFERENCE_PARENT_PAYMENT_ID = 8;

}
