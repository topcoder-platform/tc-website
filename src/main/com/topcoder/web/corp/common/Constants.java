package com.topcoder.web.corp.common;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import java.lang.reflect.Field;

public class Constants
{
    //don't instantiate this class
    private Constants() { }

    private static boolean isInitialized;

    //Controller Servlet Constants
    public static String VALID_CHAR_LIST;
    public static String VALID_PASS_CHAR_LIST;
    public static String DEFAULT_PAGE;

    //URL Parameter constants
    public static String USER_ID;
    public static String CANDIDATE_ID;
    public static String EMAIL_ADDRESS;
    public static String MESSAGE_PARAMETER;
    public static String FIRST_ATTEMPT;
    public static String REFERRER;
    public static String MODULE_KEY;
    public static String PROFILE_ID;
    public static String PROFILE_NAME;
    public static String TEST_SET_A;
    public static String TEST_SET_B;
    public static String LANGUAGE;
    public static String TEST_SET_B_ADD;
    public static String TEST_SET_B_REMOVE;
    public static String PROBLEM_ID;
    public static String PROBLEM_TYPE_ID;
    public static String ROUND_ID;
    public static String DIVISION_ID;
    public static String BEGIN_MONTH;
    public static String BEGIN_DAY;
    public static String BEGIN_YEAR;
    public static String BEGIN_HOUR;
    public static String END_MONTH;
    public static String END_DAY;
    public static String END_YEAR;
    public static String END_HOUR;
    public static String CANDIDATE_EMAIL;
    public static String REP_EMAIL;
    public static String NOTE_TEXT;
    public static String ROUND_PROBLEM_ID;
    public static String SESSION_ID;

    //Candidate constants
    public static String CANDIDATE_INFO;
    public static String CANDIDATE_SETUP_PAGE;
    public static String CANDIDATE_LIST_PAGE;
    public static String NOTE_CREATE_PAGE;
    public static String UC_DEFAULT_FORWARD_PROCESSOR;
    public static String UC_CREATE_CODER_STATUS_ID;
    public static String MAX_PASSWORD_SIZE;
    public static String CANDIDATE_LIST_QUERY_KEY;
    public static String CREATE_CANDIDATE_PROCESSOR;
    public static String POPULATE_CANDIDATE_PROCESSOR;
    public static String CHECK_COMPANY_USER_QUERY_KEY;

    //Profile constants
    public static String PROFILE_INFO;
    public static String PROFILE_LOOKUP_COMMAND;
    public static String PROFILE_PROBLEM_SET_QUERY_KEY;
    public static String PROFILE_TEST_SET_A_QUERY_KEY;
    public static String PROFILE_TEST_SET_B_QUERY_KEY;
    public static String PROFILE_COMPANY_PROBLEM_QUERY_KEY;
    public static String PROFILE_LANGUAGE_QUERY_KEY;
    public static String PROFILE_INFO_QUERY_KEY;
    public static String PROFILE_PROBLEMS_QUERY_KEY;
    public static String PROFILE_LANGUAGES_QUERY_KEY;
    public static String PROFILE_SESSION_LIST_QUERY_KEY;
    public static String POPULATE_PROFILE_PROCESSOR;
    public static String PROFILE_SETUP_PAGE;
    public static String PROFILE_CONFIRM_PAGE;
    public static String PROFILE_LIST_PAGE;
    public static String PROFILE_DETAIL_PAGE;
    public static String PROFILE_ADD_PROBLEM_PROCESSOR;
    public static String PROFILE_REMOVE_PROBLEM_PROCESSOR;
    public static String PROFILE_CONFIRM_PROCESSOR;
    public static String UPDATE_PROFILE_PROCESSOR;
    public static String CREATE_PROFILE_PROCESSOR;
    public static String PROFILE_CHECK_NAME_QUERY_KEY;
    public static int NO_TEST_SET_A;

    //Problem constants
    public static String PROBLEM_LIST_PAGE;
    public static String PROBLEM_DETAIL_PAGE;
    public static String POPULATE_PROBLEM_DETAIL_PROCESSOR;
    public static String PROBLEM_INFO;
    public static String PROBLEM_DETAIL_COMMAND;
    public static String PROBLEM_INFO_QUERY_KEY;
    public static String PROBLEM_ALGORITHMIC_CATEGORY_QUERY_KEY;
    public static String PROBLEM_BUSINESS_CATEGORY_QUERY_KEY;
    public static String EXAMPLE_PROBLEM_ID;
    public static String PROBLEM_TYPE_EXAMPLE_ID;
    public static int PROBLEM_TYPE_TEST_SET_B_ID;
    public static int PROBLEM_TYPE_TEST_SET_A_ID;
    public static String ACCURACY_INFO_QUERY_KEY;
    public static String CHECK_ACCESS_QUERY_KEY;
    
    //Results constants
    public static String PROBLEM_RESULT_PAGE;
    public static String TC_PROBLEM_RESULT_PAGE;
    public static String TEST_RESULTS_PAGE;
    public static String PRINTER_RESULTS_PAGE;

    //Session constants
    public static String POPULATE_SESSION_PROCESSOR;
    public static String UPDATE_SESSION_PROCESSOR;
    public static String PREVIEW_EMAIL_PAGE;
    public static String SESSION_SETUP_PAGE;
    public static String SESSION_INFO;
    public static String SESSION_LOOKUP_COMMAND;
    public static String SESSION_CANDIDATE_INFO_QUERY_KEY;
    public static String SESSION_PROFILE_INFO_QUERY_KEY;
    public static String SESSION_CONFIRM_PAGE;
    public static String CONFIRM_SESSION_PROCESSOR;
    public static String SESSION_SEGMENT_COMMAND;
    public static String SESSION_SEGMENT_TEST_SET_A_QUERY_KEY;
    public static String SESSION_SEGMENT_TEST_SET_A_ID;
    public static String SESSION_SEGMENT_TEST_SET_B_QUERY_KEY;
    public static String SESSION_SEGMENT_TEST_SET_B_ID;
    public static String TEST_SET_B_SEGMENT_INTERVAL;
    public static String SESSION_CHECK_COMMAND;
    public static String SESSION_DUPE_CHECK_QUERY_KEY;
    public static String SESSION_CHECK_CANDIDATE_TIME_QUERY_KEY;

    //Preivew email constants
    public static String EMAIL_LOOKUP_COMMAND;
    public static String REP_EMAIL_INFO_QUERY_KEY;
    public static String CANDIDATE_EMAIL_INFO_QUERY_KEY;
    public static String EMAIL_INFO;

    //Common Constants
    public static String DATA_SOURCE;
    public static String TX_DATA_SOURCE;
    public static String DW_DATA_SOURCE;
    public static String CONTACT_INFO_QUERY_KEY;
    public static String ERRORS;
    public static String DEBUG;

    public static String DATE_TIME_FORMAT;

    private static Logger log = Logger.getLogger(Constants.class);

    public static void initialize(ServletConfig config) {

        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (f[i].getType().getName().equals("int")) {
                    f[i].setInt(null, Integer.parseInt(config.getInitParameter(f[i].getName().toLowerCase())));
                } else if (f[i].getType().getName().equals("java.lang.String")) {
                    f[i].set(null, config.getInitParameter(f[i].getName().toLowerCase()));
                } else {
                    throw new Exception("Unrecognized type: " + f[i].getType().getName());
                }
                if (f[i].get(null)==null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                else log.debug(f[i].getName() + " <== " + f[i].get(null));
            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }
}
