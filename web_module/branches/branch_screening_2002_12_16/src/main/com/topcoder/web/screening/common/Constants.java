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

    //URL Parameter constants
    public static String USER_ID;
    public static String EMAIL_ADDRESS;
    public static String PASSWORD;
    public static String REFERRER;
    public static String REQUEST_PROCESSOR;
    public static String PROFILE_ID;
    public static String PROFILE_NAME;
    public static String TEST_SET_A;
    public static String TEST_SET_B;
    public static String LANGUAGE;
    public static String TEST_SET_B_ADD;
    public static String TEST_SET_B_REMOVE;

    //Candidate constants
    public static String CANDIDATE_INFO;
    public static String CANDIDATE_SETUP_PAGE;
    public static String CANDIDATE_LIST_PAGE;
    public static String UC_DEFAULT_FORWARD_PROCESSOR;
    public static String UC_CREATE_CODER_STATUS_ID;
    public static String MAX_PASSWORD_SIZE;
    public static String CANDIDATE_LIST_QUERY_KEY;

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
    public static String PROFILE_ADD_PROBLEM_PROCESSOR;
    public static String PROFILE_REMOVE_PROBLEM_PROCESSOR;
    public static String PROFILE_CONFIRM_PROCESSOR;

    //Common Constants
    public static String DATA_SOURCE;
    public static String TX_DATA_SOURCE;

    public static void initialize(ServletConfig config) {
        //Controller Servlet Constants
        LOGIN_PAGE = config.getInitParameter("login_page");
        ERROR_PAGE = config.getInitParameter("error_page");
        PROCESSORS_PACKAGE = config.getInitParameter("processors_package");
        VALID_CHAR_LIST = config.getInitParameter("valid_char_list");
        CONTROLLER_URL = config.getInitParameter("controller_url");
        DEFAULT_PAGE = config.getInitParameter("default_page");

        //URL Parameter constants
        USER_ID = config.getInitParameter("user_id_parameter");
        EMAIL_ADDRESS = config.getInitParameter("email_address_parameter");
        PASSWORD = config.getInitParameter("password_parameter");
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

        //Candidate constants
        CANDIDATE_INFO = config.getInitParameter("candidate_info_attribute");
        CANDIDATE_SETUP_PAGE = config.getInitParameter("candidate_setup_page");
        CANDIDATE_LIST_PAGE = config.getInitParameter("candidate_list_page");
        UC_DEFAULT_FORWARD_PROCESSOR = 
          config.getInitParameter("update_candidate_default_forward_processor");
        UC_CREATE_CODER_STATUS_ID = 
          config.getInitParameter("update_candidate_create_coder_status_id");
        MAX_PASSWORD_SIZE = config.getInitParameter("max_password_size");
        CANDIDATE_LIST_QUERY_KEY = 
            config.getInitParameter("candidate_list_query_key");

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
        PROFILE_ADD_PROBLEM_PROCESSOR = 
            config.getInitParameter("profile_add_problem_processor");
        PROFILE_REMOVE_PROBLEM_PROCESSOR =
            config.getInitParameter("profile_remove_problem_processor");
        PROFILE_CONFIRM_PROCESSOR =
            config.getInitParameter("profile_confirm_processor");

        //Common Constants
        DATA_SOURCE = config.getInitParameter("data_source_name");
        TX_DATA_SOURCE = config.getInitParameter("tx_data_source_name");

        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }
}
