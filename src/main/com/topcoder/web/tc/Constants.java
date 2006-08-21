package com.topcoder.web.tc;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

public class Constants implements WebConstants {


    private static final TCResourceBundle bundle = new TCResourceBundle("TC");
    private static final Logger log = Logger.getLogger(Constants.class);

    public static String DEFAULT_PAGE;
    public static String HOME_PAGE;
    public static String VIEW_LEADER_BOARD_PAGE;
    public static String VIEW_ROOKIE_BOARD_PAGE;
    public static String VIEW_COMPETITION_HISTORY_PAGE;
    public static String VIEW_CURRENT_PROJECTS_PAGE;
    public static String VIEW_ALGO_COMPETITION_HISTORY_PAGE;

    public static String LEADER_BOARD_COMMAND;
    public static String LEADER_BOARD_QUERY;
    public static String ROOKIE_BOARD_COMMAND;
    public static String ROOKIE_BOARD_QUERY;
    public static String CODER_LIST_KEY;
    public static String HISTORY_LIST_KEY;
    public static String COMPETITION_HISTORY_COMMAND;
    public static String COMPETITION_HISTORY_QUERY;
    public static String ALGO_COMPETITION_HISTORY_COMMAND;
    public static String ALGO_COMPETITION_HISTORY_QUERY;
    public static String CURRENT_PERIOD_COMMAND;
    public static String CURRENT_PERIOD_QUERY;
    public static String DR_SEASON_COMMAND;
    public static String DR_SEASON_QUERY;
    public static String DR_STAGE_COMMAND;
    public static String DR_STAGE_QUERY;

    public static int MAX_LEADERS;
    public static int DEFAULT_LEADERS;
    public static int MAX_HISTORY;
    public static int DEFAULT_HISTORY;
    public static String TYPE_KEY;

    public static String STAGE_LIST_KEY;
    public static String SEASON_LIST_KEY;


    /* request parameters */
    public static String PROBLEM_ID;
    public static String SURVEY_ID;
    public static String FIRST_NAME;
    public static String LAST_NAME;
    public static final String COMPANY_NAME = "compName";

    public static String NOTE_ID;
    public static String STATE_CODE;
    public static String COUNTRY_CODE;
    public static String MIN_RATING;
    public static String MAX_RATING;
    public static String MIN_DESIGN_RATING;
    public static String MAX_DESIGN_RATING;
    public static String MIN_DEV_RATING;
    public static String MAX_DEV_RATING;
    public static String MIN_NUM_RATINGS;
    public static String MAX_NUM_RATINGS;
    public static String MAX_DAYS_SINCE_LAST_COMP;
    public static String NOTE_TEXT;
    public static String CONTACT_TEXT;
    public static String SCHOOL_NAME;
    public static int TCO05_LOGO_TERMS_ID;
    public static int TCO06_LOGO_TERMS_ID;
    public static int TCCC06_LOGO_TERMS_ID;
    public static String LOGO;
    public static int TCO05_SPONSOR_TERMS_ID;

    public static String MIN_HS_RATING;
    public static String MAX_HS_RATING;
    public static String MIN_NUM_HS_RATINGS;
    public static String MAX_NUM_HS_RATINGS;
    public static String MAX_DAYS_SINCE_LAST_HS_COMP;


    public static String PROJECT_ID;
    public static String PHASE_ID;
    public static String SEASON_ID;

    public static String STAGE_ID;
    public static String PRIMARY_FLAG;
    public static String REVIEWER_TYPE_ID;

    public static String QUESTION_PREFIX;
    public static String ANSWER_PREFIX;
    public static String MESSAGE;

    /* pages */
    public static String SURVEY_RESULTS;
    public static String SCHULZE_RESULTS;
    public static String SURVEY_VIEW;
    public static String SURVEY_LIST;
    public static String SURVEY_THANKS;

    public static String CRPF_REPORT;

    public static String PROBLEM_RATING_RESULTS;
    public static String PROBLEM_RATING_QUESTIONS;
    public static String PROBLEM_RATING_QUESTION_INFO;

    public static String HIGHEST_RATING;
    public static String PROBLEM_ARCHIVE;
    public static String PROBLEM_DETAIL;

    public static String LOGIN;
    public static String ACTIVATE;
    public static String EMAIL_ACTIVATE;
    public static String EMAIL_ACTIVATE_CONFIRM;
    public static String RECOVER_PASSWORD;
    public static String EMAIL_SENT;

    public static String SIMPLE_SEARCH_RESULTS;
    public static String ADVANCED_SEARCH_RESULTS;
    public static String ADVANCED_SEARCH;

    public static String PUBLIC_HOME_PAGE;
    public static String MEMBER_HOME_PAGE;

    public static String TCCC04_TERMS;
    public static String TCO04_TERMS;
    public static String TCCC05_TERMS;
    public static String TCO05_TERMS;

    public static String CARD_PREVIEW;
    public static String CARD_INSTRUCTIONS;
    public static String DOWNLOADS;
    public static String LANDING_PAGE;

    public static String REFERRALS;

    public static String DESIGN_REVIEWERS;
    public static String DEV_REVIEWERS;

    public static String RATING_SIM;

    public static String PLACEMENT_INFO_DETAIL;
    public static String NOTE_LIST;
    public static String NOTE_EDIT;
    public static String CONTACT_DATE;
    public static String TCS_SURVEY_RESULTS;

    public static String MEMBER_PROFILE;

    public static String MEMBER_CONTACT;

    public static String MEMBER_CONTACT_ENABLE_SUCCEEDED;
    public static String MEMBER_CONTACT_ENABLE;

    public static String MEMBER_CONTACT_FROM_ADDRESS;
    public static String MEMBER_CONTACT_SUBJECT;
    public static String MEMBER_CONTACT_SUBJECT_COPY;

    public static String VALIDATE_HANDLE;

    public static String BLACK_LIST;
    public static String BLOCK_HANDLE;

    //dev pages
    public static String REVIEW_PROJECT_DETAIL;
    public static String REVIEW_PROJECTS;
    public static String DESIGN_DETAIL;
    public static String DEVELOPMENT_DETAIL;
    public static String REVIEWER_TERMS;

    /* misc constants */
    public static int SRM_SURVEY_QUESTION;
    public static int TOURNAMENT_SURVEY_QUESTION;
    public static int SEARCH_SCROLL_SIZE;
    public static int PROBLEM_ARCHIVE_SCROLL_SIZE;
    public static String STATISTICS_PATH;
    public static int TCCC04_TERMS_OF_USE_ID;
    public static int TCO04_EVENT_ID;
    public static int TCO04_ALGORITHM_TERMS_OF_USE_ID;
    public static int TCO04_COMPONENT_TERMS_OF_USE_ID;
    public static int TCCC05_EVENT_ID;
    public static int TCCC05_ALGORITHM_TERMS_OF_USE_ID;
    public static int TCCC05_COMPONENT_TERMS_OF_USE_ID;
    public static int TCO05_EVENT_ID;
    public static final int TCO06_EVENT_ID = 5;
    public static final int TCCC06_EVENT_ID = 6;
    public static int TCO05_ALGORITHM_TERMS_OF_USE_ID;
    public static int TCO05_COMPONENT_TERMS_OF_USE_ID;
    public static final int TCO06_ALGORITHM_TERMS_OF_USE_ID = 20383;
    public static final int TCO06_COMPONENT_TERMS_OF_USE_ID = 20384;
    public static final int TCO05_SPONSOR_COMPANY_QUESTION_ID = 30;
    public static final int TCO06_SPONSOR_COMPANY_QUESTION_ID = 31;
    public static final int TCO06_SPONSOR_TERMS_ID = 20388;
    public static final int TCCC06_ALGORITHM_TERMS_OF_USE_ID = 20504;
    public static final int TCCC06_COMPONENT_TERMS_OF_USE_ID = 20503;
    public static final int TCCC06_SPONSOR_TERMS_ID = 20523;
    public static final int TCCC06_SPONSOR_COMPANY_QUESTION_ID = 136;
    public static int UNLOCK_CARD_PREFERENCE_ID;
    public static int JAVA_CATALOG_ID;
    public static int DOT_NET_CATALOG_ID;
    public static int CUSTOM_JAVA_CATALOG_ID;
    public static int CUSTOM_DOT_NET_CATALOG_ID;
    public static int FLASH_CATALOG_ID;
    public static int APPLICATIONS_CATALOG_ID;
    public static int INTERNAL_NOTE_TYPE_ID;
    //public static int LANGUAGE_NOTE_TYPE_ID;
    //public static int TECH_NOTE_TYPE_ID;
    //public static int OS_NOTE_TYPE_ID;
    //public static int DB_NOTE_TYPE_ID;
    //public static int INDUSTRY_NOTE_TYPE_ID;
    public static int MAX_RATED_INQUIRIES;
    public static int MAX_UNRATED_INQUIRIES;
    public static int REVIEWER_TERMS_ID;
    public static int PROJECT_TERMS_ID;
    public static int TOURNAMENT_COMPONENT;
    //public static int ACTIVE_REVIEWER;

    /* job posting stuff */
    public static String JOB_HIT_TYPE_PARAM;
    public static String JOB_HIT_PREFIX;
    public static int CLICK_THRU_ID;
    public static int PLACEMENT_CLICK_THRU_ID;
    public static int JOB_POSTING_ID;
    public static String JOB_ID_PARAM;
    public static String PROFILE_PAGE;
    public static String UNRATED_PAGE;
    public static String NO_RESUME_PAGE;

    public static String CLASS_NAME;
    public static String CATEGORY;
    public static String MIN_DIV1_SUCCESS;
    public static String MIN_DIV2_SUCCESS;
    public static String MAX_DIV1_SUCCESS;
    public static String MAX_DIV2_SUCCESS;
    public static String DIV1_LEVEL;
    public static String DIV2_LEVEL;

    public static String JOB_HIT_MESSAGE_NOT_REGISTERED;
    public static String JOB_HIT_MESSAGE_UN_REGISTERED;

    // profile generator constants
    public static String PROFILE_DOC_CONVERTOR_PAGE;
    public static String PROFILE_MAIN_PAGE;
    public static String PROFILE_CONFIG_PAGE;

    /* Contract Constants */
    public static String CONTRACTING_INFO;
    public static String CONTRACTING_PREFERENCES_PAGE;
    public static String CONTRACTING_LANGUAGES_PAGE;
    public static String CONTRACTING_TECHNOLOGIES_PAGE;
    public static String CONTRACTING_OS_PAGE;
    public static String CONTRACTING_DATABASES_PAGE;
    public static String CONTRACTING_INDUSTRIES_PAGE;
    public static String CONTRACTING_CONFIRM_PAGE;
    public static String CONTRACTING_SUCCESS_PAGE;

    public static String PREFERENCE_PREFIX;

    public static String SKILL_PREFIX;

    public static String NOTE_PREFIX;

    public static String TCCC05_STUDENT_REPS;

    public static final String COLLEGE_TOUR_EVENT_ID = "cteid";
    public static final String COLLEGE_TOUR_CONFIG_INFO = "configInfo";
    public static final String ROUND_NAME = "rdname";
    public static final int RECRUITER_NAME_PROP_ID = 1;
    public static final int FIRST_PLACE_PROP_ID = 2;
    public static final int SECOND_PLACE_PROP_ID = 3;
    public static final int THIRD_PLACE_PROP_ID = 4;
    public static final int LOCATION_PROP_ID = 5;
    public static final int EVENT_START_PROP_ID = 6;
    public static final int EVENT_END_PROP_ID = 7;
    public static final int RESULTS_PROP_ID = 8;
    public static final int ROUND_START_PROP_ID = 9;
    public static final int ROUND_END_PROP_ID = 10;

    public static final int ACHIEVEMENT_TYPE_COM = 1;
    public static final int ACHIEVEMENT_TYPE_NAUGHTY = 2;
    public static final int ACHIEVEMENT_TYPE_OTHER = 3;
    public static final int ACHIEVEMENT_TYPE_TOURNEY_AWARD = 4;
    public static final int ACHIEVEMENT_TYPE_ALGO_COM = 5;
    public static final int ACHIEVEMENT_TYPE_DESIGN_COM = 6;
    public static final int ACHIEVEMENT_TYPE_DEV_COM = 7;

    public static final String ACHIEVEMENT_TYPE_ID = "achtid";

    //High School statistics
    public static String HS_ROUND_OVERVIEW;
    public static String HS_ROUND_STATS_TEAM;
    public static String HS_ROUND_STATS_IND;
    public static String HS_ROOM_STATS;
    public static String HS_TEAM_RESULTS;
    public static String HS_RANK;
    public static String HS_TEAM_RANK;
    public static String HS_COUNTRY_RANK;
    public static String HS_PROBLEM_STATEMENT;
    public static String HS_PROBLEM_SOLUTION;
    public static String HS_RATING_HISTORY;


    public static String DEFAULT_SURVEY_SCROLL_SIZE;

    static {
        initialize();
    }

    private Constants() {
    }

    public static void initialize() {
        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (!Modifier.isFinal(f[i].getModifiers())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            f[i].setInt(null, bundle.getIntProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else {
                        throw new Exception("Unrecognized type: " + f[i].getType().getName());
                    }
                }
                if (f[i].get(null) == null) {
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                } else {
                    if (log.isDebugEnabled()) {
                        log.debug(f[i].getName() + " <== " + f[i].get(null));
                    }
                }

            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
    }

}
