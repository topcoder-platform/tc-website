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

    //Candidate constants
    public static String CANDIDATE_INFO;
    public static String CANDIDATE_SETUP_PAGE;
    public static String CANDIDATE_LIST_PAGE;
    public static String UC_DEFAULT_FORWARD_PROCESSOR;
    public static String UC_CREATE_CODER_STATUS_ID;
    public static String MAX_PASSWORD_SIZE;
    public static String CANDIDATE_LIST_QUERY_KEY;

    //Security Server Constants
    public static String SECURITY_CONTEXT_FACTORY;
    public static String SECURITY_PROVIDER_URL;

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

        //Candidate constants
        CANDIDATE_INFO = config.getInitParameter("candidate_info_parameter");
        CANDIDATE_SETUP_PAGE = config.getInitParameter("candidate_setup_page");
        CANDIDATE_LIST_PAGE = config.getInitParameter("candidate_list_page");
        UC_DEFAULT_FORWARD_PROCESSOR = 
          config.getInitParameter("update_candidate_default_forward_processor");
        UC_CREATE_CODER_STATUS_ID = 
          config.getInitParameter("update_candidate_create_coder_status_id");
        MAX_PASSWORD_SIZE = config.getInitParameter("max_password_size");
        CANDIDATE_LIST_QUERY_KEY = 
            config.getInitParameter("candidate_list_query_key");

        //Security Server Constants
        SECURITY_CONTEXT_FACTORY = 
            config.getInitParameter("security_context_factory");
        SECURITY_PROVIDER_URL = 
            config.getInitParameter("security_provider_url");

        //Common Constants
        DATA_SOURCE = config.getInitParameter("data_source_name");
        TX_DATA_SOURCE = config.getInitParameter("tx_data_source_name");

        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }
}
