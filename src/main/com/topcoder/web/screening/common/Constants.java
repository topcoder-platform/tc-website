package com.topcoder.web.screening.common;

import javax.servlet.ServletConfig;

public class Constants
{
    //don't instantiate this class
    private Constants() { }

    private static boolean isInitialized;

    //Controller Servlet Constants
    public static String LOGIN_PAGE;
    public static String ERROR_PAGE;
    public static String PROCESSORS_PACKAGE;
    public static String VALID_CHAR_LIST;    
    public static String CONTROLLER_URL;    
    public static String DEFAULT_PAGE;
    public static String REQUEST_INFO;

    //URL Parameter constants
    public static String USER_ID;
    public static String CANDIDATE_ID;
    public static String EMAIL_ADDRESS;
    public static String PASSWORD;
    public static String HANDLE;
    public static String REDIRECT;
    public static String MESSAGE_PARAMETER;
    public static String FIRST_ATTEMPT;
    public static String REFERRER;
    public static String REQUEST_PROCESSOR;
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
    public static String NOTE_LIST_PAGE;
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
    public static String POPULATE_PROFILE_PROCESSOR;
    public static String PROFILE_SETUP_PAGE;
    public static String PROFILE_CONFIRM_PAGE;
    public static String PROFILE_LIST_PAGE;
    public static String PROFILE_ADD_PROBLEM_PROCESSOR;
    public static String PROFILE_REMOVE_PROBLEM_PROCESSOR;
    public static String PROFILE_CONFIRM_PROCESSOR;
    public static String UPDATE_PROFILE_PROCESSOR;
    public static String CREATE_PROFILE_PROCESSOR;
    public static String PROFILE_CHECK_NAME_QUERY_KEY;
    
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
    public static String PROBLEM_TYPE_TEST_SET_B_ID;
    public static String ACCURACY_INFO_QUERY_KEY;
    public static String CHECK_ACCESS_QUERY_KEY;
    
    //Results constants
    public static String PROBLEM_RESULT_PAGE;
    public static String TC_PROBLEM_RESULT_PAGE;
    public static String TEST_RESULTS_PAGE;

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

    public static void initialize(ServletConfig config) {
        //Controller Servlet Constants
        LOGIN_PAGE = config.getInitParameter("login_page");
        ERROR_PAGE = config.getInitParameter("error_page");
        PROCESSORS_PACKAGE = config.getInitParameter("processors_package");
        VALID_CHAR_LIST = config.getInitParameter("valid_char_list");
        CONTROLLER_URL = config.getInitParameter("controller_url");
        DEFAULT_PAGE = config.getInitParameter("default_page");
        REQUEST_INFO = config.getInitParameter("request_info_attribute");

        //URL Parameter constants
        USER_ID = config.getInitParameter("user_id_parameter");
        CANDIDATE_ID = config.getInitParameter("candidate_id_parameter");
        EMAIL_ADDRESS = config.getInitParameter("email_address_parameter");
        PASSWORD = config.getInitParameter("password_parameter");
        HANDLE = config.getInitParameter("handle_parameter");
        MESSAGE_PARAMETER = config.getInitParameter("message_parameter");
        FIRST_ATTEMPT = config.getInitParameter("first_attempt_parameter");
        REDIRECT = config.getInitParameter("redirect_parameter");
        REFERRER = config.getInitParameter("referrer_parameter");
        REQUEST_PROCESSOR = 
            config.getInitParameter("request_processor_parameter");
        PROFILE_ID = config.getInitParameter("profile_id_parameter");
        PROFILE_NAME = config.getInitParameter("profile_name_parameter");
        TEST_SET_A = config.getInitParameter("test_set_a_parameter");
        TEST_SET_B = config.getInitParameter("test_set_b_parameter");
        LANGUAGE = config.getInitParameter("language_parameter");
        TEST_SET_B_ADD = config.getInitParameter("test_set_b_add_parameter");
        TEST_SET_B_REMOVE = 
            config.getInitParameter("test_set_b_remove_parameter");
        PROBLEM_ID = config.getInitParameter("problem_id_parameter");
        PROBLEM_TYPE_ID = config.getInitParameter("problem_type_id_parameter");
        ROUND_ID = config.getInitParameter("round_id_parameter");
        DIVISION_ID = config.getInitParameter("division_id_parameter");
        BEGIN_MONTH = config.getInitParameter("begin_month_parameter");
        BEGIN_DAY = config.getInitParameter("begin_day_parameter");
        BEGIN_YEAR = config.getInitParameter("begin_year_parameter");
        BEGIN_HOUR = config.getInitParameter("begin_hour_parameter");
        END_MONTH = config.getInitParameter("end_month_parameter");
        END_DAY = config.getInitParameter("end_day_parameter");
        END_YEAR = config.getInitParameter("end_year_parameter");
        END_HOUR = config.getInitParameter("end_hour_parameter");
        CANDIDATE_EMAIL = config.getInitParameter("candidate_email_parameter");
        REP_EMAIL = config.getInitParameter("rep_email_parameter");
        NOTE_TEXT = config.getInitParameter("note_text_parameter");
        ROUND_PROBLEM_ID = 
            config.getInitParameter("round_problem_id_parameter");
        SESSION_ID = config.getInitParameter("session_id_parameter");

        //Candidate constants
        CANDIDATE_INFO = config.getInitParameter("candidate_info_attribute");
        CANDIDATE_SETUP_PAGE = config.getInitParameter("candidate_setup_page");
        CANDIDATE_LIST_PAGE = config.getInitParameter("candidate_list_page");
        NOTE_LIST_PAGE = config.getInitParameter("note_list_page");
        NOTE_CREATE_PAGE = config.getInitParameter("note_create_page");
        UC_DEFAULT_FORWARD_PROCESSOR = 
          config.getInitParameter("update_candidate_default_forward_processor");
        UC_CREATE_CODER_STATUS_ID = 
          config.getInitParameter("update_candidate_create_coder_status_id");
        MAX_PASSWORD_SIZE = config.getInitParameter("max_password_size");
        CANDIDATE_LIST_QUERY_KEY = 
            config.getInitParameter("candidate_list_query_key");
        CREATE_CANDIDATE_PROCESSOR = 
            config.getInitParameter("create_candidate_processor");
        POPULATE_CANDIDATE_PROCESSOR = 
            config.getInitParameter("populate_candidate_processor");
        CHECK_COMPANY_USER_QUERY_KEY = 
            config.getInitParameter("check_company_user_query_key");

        //Profile constants
        PROFILE_INFO = config.getInitParameter("profile_info_attribute");
        PROFILE_LOOKUP_COMMAND = 
            config.getInitParameter("profile_lookup_command");
        PROFILE_PROBLEM_SET_QUERY_KEY = 
            config.getInitParameter("profile_problem_set_query_key");
        PROFILE_TEST_SET_A_QUERY_KEY = 
            config.getInitParameter("profile_test_set_a_query_key");
        PROFILE_TEST_SET_B_QUERY_KEY = 
            config.getInitParameter("profile_test_set_b_query_key");
        PROFILE_COMPANY_PROBLEM_QUERY_KEY = 
            config.getInitParameter("profile_company_problem_query_key");
        PROFILE_LANGUAGE_QUERY_KEY = 
            config.getInitParameter("profile_language_query_key");
        PROFILE_INFO_QUERY_KEY = 
            config.getInitParameter("profile_info_query_key");
        PROFILE_PROBLEMS_QUERY_KEY = 
            config.getInitParameter("profile_problems_query_key");
        PROFILE_LANGUAGES_QUERY_KEY = 
            config.getInitParameter("profile_languages_query_key");
        POPULATE_PROFILE_PROCESSOR = 
            config.getInitParameter("populate_profile_processor");
        PROFILE_SETUP_PAGE = config.getInitParameter("profile_setup_page");
        PROFILE_CONFIRM_PAGE = config.getInitParameter("profile_confirm_page");
        PROFILE_LIST_PAGE = config.getInitParameter("profile_list_page");
        PROFILE_ADD_PROBLEM_PROCESSOR = 
            config.getInitParameter("profile_add_problem_processor");
        PROFILE_REMOVE_PROBLEM_PROCESSOR =
            config.getInitParameter("profile_remove_problem_processor");
        PROFILE_CONFIRM_PROCESSOR =
            config.getInitParameter("profile_confirm_processor");
        UPDATE_PROFILE_PROCESSOR =
            config.getInitParameter("update_profile_processor");
        CREATE_PROFILE_PROCESSOR =
            config.getInitParameter("create_profile_processor");
        PROFILE_CHECK_NAME_QUERY_KEY = 
            config.getInitParameter("profile_check_name_query_key");
        
        //Problem constants
        PROBLEM_LIST_PAGE = config.getInitParameter("problem_list_page");
        PROBLEM_DETAIL_PAGE = config.getInitParameter("problem_detail_page");
        POPULATE_PROBLEM_DETAIL_PROCESSOR =
            config.getInitParameter("populate_problem_detail_processor");
        PROBLEM_INFO = 
            config.getInitParameter("problem_info_attribute");
        PROBLEM_DETAIL_COMMAND = 
            config.getInitParameter("problem_detail_command");
        PROBLEM_INFO_QUERY_KEY = 
            config.getInitParameter("problem_info_query_key");
        PROBLEM_ALGORITHMIC_CATEGORY_QUERY_KEY = 
            config.getInitParameter("problem_algorithmic_category_query_key");
        PROBLEM_BUSINESS_CATEGORY_QUERY_KEY = 
            config.getInitParameter("problem_business_category_query_key");
        EXAMPLE_PROBLEM_ID = config.getInitParameter("example_problem_id");
        PROBLEM_TYPE_EXAMPLE_ID = 
            config.getInitParameter("problem_type_example_id");
        PROBLEM_TYPE_TEST_SET_B_ID = 
            config.getInitParameter("problem_type_test_set_b_id");
        CHECK_ACCESS_QUERY_KEY =
            config.getInitParameter("check_access_query_key");
        ACCURACY_INFO_QUERY_KEY = 
            config.getInitParameter("accuracy_info_query_key");
        
        //Result constants
        PROBLEM_RESULT_PAGE = config.getInitParameter("problem_result_page");
        TC_PROBLEM_RESULT_PAGE = 
            config.getInitParameter("tc_problem_result_page");
        TEST_RESULTS_PAGE = config.getInitParameter("test_results_page");

        //Session constants
        POPULATE_SESSION_PROCESSOR = 
            config.getInitParameter("populate_session_processor");
        UPDATE_SESSION_PROCESSOR = 
            config.getInitParameter("update_session_processor");
        PREVIEW_EMAIL_PAGE = 
            config.getInitParameter("preview_email_page");
        SESSION_SETUP_PAGE = 
            config.getInitParameter("session_setup_page");
        SESSION_INFO = 
            config.getInitParameter("session_info_attribute");
        SESSION_LOOKUP_COMMAND = 
            config.getInitParameter("session_lookup_command");
        SESSION_CANDIDATE_INFO_QUERY_KEY = 
            config.getInitParameter("session_candidate_info_query_key");
        SESSION_PROFILE_INFO_QUERY_KEY = 
            config.getInitParameter("session_profile_info_query_key");
        SESSION_CONFIRM_PAGE =
            config.getInitParameter("session_confirm_page");
        CONFIRM_SESSION_PROCESSOR = 
            config.getInitParameter("confirm_session_processor");
        SESSION_SEGMENT_COMMAND = 
            config.getInitParameter("session_segment_command");
        SESSION_SEGMENT_TEST_SET_A_QUERY_KEY = 
            config.getInitParameter("session_segment_test_set_a_query_key");
        SESSION_SEGMENT_TEST_SET_A_ID = 
            config.getInitParameter("session_segment_test_set_a_id");
        SESSION_SEGMENT_TEST_SET_B_QUERY_KEY = 
            config.getInitParameter("session_segment_test_set_b_query_key");
        SESSION_SEGMENT_TEST_SET_B_ID = 
            config.getInitParameter("session_segment_test_set_b_id");
        TEST_SET_B_SEGMENT_INTERVAL = 
            config.getInitParameter("test_set_b_segment_interval");
        SESSION_CHECK_CANDIDATE_TIME_QUERY_KEY = 
            config.getInitParameter("session_check_candidate_time_query_key");

        //Preview Email Constants
        EMAIL_LOOKUP_COMMAND = config.getInitParameter("email_lookup_command");
        REP_EMAIL_INFO_QUERY_KEY = 
            config.getInitParameter("rep_email_info_query_key");
        CANDIDATE_EMAIL_INFO_QUERY_KEY = 
            config.getInitParameter("candidate_email_info_query_key");
        EMAIL_INFO = config.getInitParameter("email_info_attribute");

        //Common Constants
        DATA_SOURCE = config.getInitParameter("data_source_name");
        TX_DATA_SOURCE = config.getInitParameter("tx_data_source_name");
        DW_DATA_SOURCE = config.getInitParameter("dw_data_source_name");
        CONTACT_INFO_QUERY_KEY = 
            config.getInitParameter("contact_info_query_key");
        ERRORS = config.getInitParameter("errors_attribute");
        DEBUG = config.getInitParameter("debug_flag");

        DATE_TIME_FORMAT = config.getInitParameter("date_time_format");

        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }
}
