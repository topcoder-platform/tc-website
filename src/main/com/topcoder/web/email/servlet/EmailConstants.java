package com.topcoder.web.email.servlet;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class EmailConstants {
    private static Logger log = Logger.getLogger(EmailConstants.class);

    // default # of fields for an address list
    private static final int DEFAULT_ADDRESSLIST_NUM_FIELDS = 10;

    // user name parameter
    public static final String USERNAME = "usern";

    // user password parameter
    public static final String USERPASS = "userp";

    // task parameter
    public static final String TASK = "task";

    // step parameter
    public static final String STEP = "step";

    // id parameter
    public static final String ID = "id";

    // list id parameter
    public static final String LIST_ID = "listId";

    // command id parameter
    public static final String COMMAND_ID = "commandId";

    // template id parameter
    public static final String TEMPLATE_ID = "templateId";

    // group parameter
    public static final String GROUP = "group";

    // report group parameter
    public static final String REPORT_GROUP = "reportGroup";

    // report template id parameter
    public static final String REPORT_TEMPLATE_ID = "reportId";

    // log map parameter
    public static final String LOG = "log";
    public static final String PREV = "prev";
    public static final String NEXT = "next";

    // job detail id parameter
    public static final String JOB_DETAIL_ID = "jobDetailId";

    // job log data parameter
    public static final String JOB_LOG_DATA = "jobLogData";

    // start/end row
    public static final String SR = "sr";
    public static final String ER = "er";

    // used to store error rows for bulk entry
    public static final String INVALID_ROWS = "invalid_rows";

    // row delimiter for bulk entry
    public static final String BULK_ROW_DELIMITER = "\n";

    // column delimiter for bulk entry
    public static final String BULK_COLUMN_DELIMITER = " ";

    // delimiter to specify levels for member data fields
    public static final String TAG_DELIMITER = "/";

    // search type parameter
    public static final String SEARCH_TYPE = "search_type";

    // next task parameter
    public static final String NEXT_PAGE = "next_page";

    // the various search types
    public static final String SEARCH_BY_SENDER_EMAIL = "email";
    public static final String SEARCH_BY_SUBJECT = "subject";
    public static final String SEARCH_BY_DATE = "date";

    // task steps
    public static final String TEMPLATE_LIST = "list";
    public static final String TEMPLATE_CREATE = "create";
    public static final String TEMPLATE_ADD = "add";
    public static final String TEMPLATE_EDIT = "edit";
    public static final String TEMPLATE_SAVE = "save";
    public static final String TEMPLATE_DELETE = "delete";

    public static final String ADDRESSLIST_LIST = "list";
    public static final String ADDRESSLIST_CREATE = "create";
    public static final String ADDRESSLIST_ADD = "add";
    public static final String ADDRESSLIST_EDIT = "edit";
    public static final String ADDRESSLIST_SAVE = "save";
    public static final String ADDRESSLIST_DELETE = "delete";
    public static final String ADDRESSLIST_ADD_MEMBER = "add_member";
    public static final String ADDRESSLIST_BULK_ADD = "bulk_add";
    public static final String ADDRESSLIST_SHOW_ADD_MEMBER = "show_add_member";
    public static final String ADDRESSLIST_SHOW_BULK_ADD = "show_bulk_add";
    public static final String ADDRESSLIST_EDIT_MEMBER = "edit_member";
    public static final String ADDRESSLIST_SAVE_MEMBER = "save_member";
    public static final String ADDRESSLIST_DELETE_MEMBER = "delete_member";

    public static final String SCHEDULEDJOB_LIST = "list";
    public static final String SCHEDULEDJOB_CREATE = "create";
    public static final String SCHEDULEDJOB_RELOAD_CREATE = "reload_create";
    public static final String SCHEDULEDJOB_ADD = "add";
    public static final String SCHEDULEDJOB_EDIT = "edit";
    public static final String SCHEDULEDJOB_VIEW = "view";
    public static final String SCHEDULEDJOB_RELOAD_EDIT = "reload_edit";
    public static final String SCHEDULEDJOB_SHOW_EDIT = "edit";
    public static final String SCHEDULEDJOB_SAVE = "save";
    public static final String SCHEDULEDJOB_DELETE = "delete";
    public static final String SCHEDULEDJOB_CHOOSE_LIST_ADD = "choose_list_add";
    public static final String SCHEDULEDJOB_RELOAD_CHOOSE_LIST_ADD = "reload_choose_list_add";
    public static final String SCHEDULEDJOB_SET_LIST_ADD = "set_list_add";
    public static final String SCHEDULEDJOB_CHOOSE_QUERY_ADD = "choose_query_add";
    public static final String SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD = "choose_template_add";
    public static final String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD = "choose_command_inputs_add";
    public static final String SCHEDULEDJOB_SET_COMMAND_INPUTS_ADD = "set_command_inputs_add";
    public static final String SCHEDULEDJOB_CHOOSE_TEST_LIST = "choose_test_list";
    public static final String SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE = "choose_report_template";
    public static final String SCHEDULEDJOB_ASK_SEND_TEST = "ask_send_test";
    public static final String SCHEDULEDJOB_SEND_TEST = "send_test";
    public static final String SCHEDULEDJOB_CHOOSE_LIST_EDIT = "choose_list_edit";
    public static final String SCHEDULEDJOB_SET_LIST_EDIT = "set_list_edit";
    public static final String SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT = "choose_template_edit";
    public static final String SCHEDULEDJOB_SET_TEMPLATE_EDIT = "set_template_edit";
    public static final String SCHEDULEDJOB_CHOOSE_QUERY_EDIT = "choose_query_edit";
    public static final String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT = "choose_command_inputs_edit";
    public static final String SCHEDULEDJOB_SET_COMMAND_INPUTS_EDIT = "set_command_inputs_edit";
    public static final String SCHEDULEDJOB_SHOW_LOG = "log";
    public static final String SCHEDULEDJOB_SHOW_LOG_DATA = "log_data";
    public static final String SCHEDULEDJOB_SHOW_SEARCH = "search";
    public static final String SCHEDULEDJOB_SHOW_SEARCH_RESULTS = "results";
    public static final String SCHEDULEDJOB_CANCEL_JOB = "cancel";
    public static final String SCHEDULEDJOB_RESUME_JOB = "resume";


    // init-param keys
    private static final String ALIAS_KEY = "servlet_alias";
    private static final String TASK_PACKAGE_KEY = "task_package";
    private static final String ADDRESSLIST_NUM_FIELDS_KEY = "addresslist_num_fields";
    private static final String FIELD_PREFIX_KEY = "field_prefix";
    private static final String MEMBER_TAG_KEY = "member_tag";
    private static final String EMAIL_ADDRESS_TAG_KEY = "email_address_tag";
    private static final String DELETED_GROUP_ID_KEY = "deleted_group_id";
    private static final String NO_LIST_ID_KEY = "no_list_id";
    private static final String NO_COMMAND_ID_KEY = "no_command_id";
    private static final String TEST_LIST_GROUP_ID_KEY = "test_list_group_id";
    private static final String DATA_SOURCE_NAME_KEY = "data_source";
    private static final String RECENT_JOB_DAYS_KEY = "recent_job_days";
    private static final String DEFAULT_NUM_LOG_ENTRIES_PER_SCREEN_KEY = "default_num_log_entries_per_screen";

    private static final String RECENT_JOBS_COMMAND_KEY = "recent_jobs_command";
    private static final String RECENT_JOBS_RESULT_KEY = "recent_jobs_result";
    private static final String JOBS_BY_SENDER_COMMAND_KEY = "jobs_by_sender_command";
    private static final String JOBS_BY_SENDER_RESULT_KEY = "jobs_by_sender_result";
    private static final String JOBS_BY_SUBJECT_COMMAND_KEY = "jobs_by_subject_command";
    private static final String JOBS_BY_SUBJECT_RESULT_KEY = "jobs_by_subject_result";
    private static final String JOBS_BY_DATE_COMMAND_KEY = "jobs_by_date_command";
    private static final String JOBS_BY_DATE_RESULT_KEY = "jobs_by_date_result";
    private static final String QUERY_DESCRIPTION_COMMAND_KEY = "query_description_command";
    private static final String QUERY_DESCRIPTION_RESULT_KEY = "query_description_result";
    private static final String QUERY_METADATA_COMMAND_KEY = "query_metadata_command";
    private static final String QUERY_METADATA_RESULT_KEY = "query_metadata_result";
    private static final String EMAIL_QUERIES_COMMAND_KEY = "email_queries_command";
    private static final String EMAIL_QUERIES_RESULT_KEY = "email_queries_result";
    private static final String JOB_LOG_COMMAND_KEY = "job_log_command";
    private static final String JOB_LOG_RESULT_KEY = "job_log_result";

    private static final String EMAIL_EJB_PACKAGE_KEY = "email_ejb_package";
    private static final String AUTHENTICATIONSERVICES_EJB_PACKAGE_KEY = "authentication_services_ejb_package";
    private static final String STATISTICS_EJB_PACKAGE_KEY = "statistics_ejb_package";
    private static final String EMAILTEMPLATE_EJB_KEY = "email_template_ejb";
    private static final String EMAILTEMPLATE_GROUP_EJB_KEY = "email_template_group_ejb";
    private static final String ADDRESSLIST_EJB_KEY = "address_list_ejb";
    private static final String ADDRESSLIST_GROUP_EJB_KEY = "address_list_group_ejb";
    private static final String SCHEDULEDJOB_EJB_KEY = "scheduled_job_ejb";
    private static final String AUTHENTICATIONSERVICES_EJB_KEY = "authentication_services_ejb";
    private static final String STATISTICS_EJB_KEY = "statistics_ejb";

    private static final String LOGIN_TASK_KEY = "login_task";
    private static final String HOME_TASK_KEY = "home_task";
    private static final String EMAILTEMPLATE_TASK_KEY = "email_template_task";
    private static final String ADDRESSLIST_TASK_KEY = "address_list_task";
    private static final String SCHEDULEDJOB_TASK_KEY = "scheduled_job_task";

    private static final String JOB_STATUS_CREATING_KEY = "job_status_creating";
    private static final String JOB_STATUS_READY_KEY = "job_status_ready";
    private static final String JOB_STATUS_ACTIVE_KEY = "job_status_active";
    private static final String JOB_STATUS_COMPLETE_KEY = "job_status_complete";
    private static final String JOB_STATUS_INCOMPLETE_KEY = "job_status_incomplete";
    private static final String JOB_STATUS_CANCELLED_KEY = "job_status_cancelled";

    private static final String JOB_TYPE_PREDETAIL_KEY = "job_type_predetail";
    private static final String JOB_TYPE_POSTDETAIL_KEY = "job_type_postdetail";

    private static final String JSP_ROOT_KEY = "jsp_root";
    private static final String HOME_PAGE_KEY = "home_page";
    private static final String ERROR_PAGE_KEY = "error_page";
    private static final String EMAILTEMPLATE_LIST_PAGE_KEY = "email_template_list_page";
    private static final String EMAILTEMPLATE_EDIT_PAGE_KEY = "email_template_edit_page";
    private static final String EMAILTEMPLATE_CREATE_PAGE_KEY = "email_template_create_page";
    private static final String ADDRESSLIST_LIST_PAGE_KEY = "address_list_list_page";
    private static final String ADDRESSLIST_EDIT_PAGE_KEY = "address_list_edit_page";
    private static final String ADDRESSLIST_CREATE_PAGE_KEY = "address_list_create_page";
    private static final String ADDRESSLIST_EDIT_MEMBER_PAGE_KEY = "address_list_edit_member_page";
    private static final String ADDRESSLIST_ADD_MEMBER_PAGE_KEY = "address_list_add_member_page";
    private static final String ADDRESSLIST_BULK_ADD_PAGE_KEY = "address_list_bulk_add_page";
    private static final String SCHEDULEDJOB_LIST_PAGE_KEY = "scheduled_job_list_page";
    private static final String SCHEDULEDJOB_EDIT_PAGE_KEY = "scheduled_job_edit_page";
    private static final String SCHEDULEDJOB_VIEW_PAGE_KEY = "scheduled_job_view_page";
    private static final String SCHEDULEDJOB_CREATE_PAGE_KEY = "scheduled_job_create_page";
    private static final String SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD_PAGE_KEY = "scheduled_job_choose_template_add_page";
    private static final String SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE_PAGE_KEY = "scheduled_job_choose_report_template_page";
    private static final String SCHEDULEDJOB_CHOOSE_LIST_ADD_PAGE_KEY = "scheduled_job_choose_list_add_page";
    private static final String SCHEDULEDJOB_CHOOSE_COMMAND_ADD_PAGE_KEY = "scheduled_job_choose_command_add_page";
    private static final String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD_PAGE_KEY = "scheduled_job_choose_command_inputs_add_page";
    private static final String SCHEDULEDJOB_CHOOSE_TEST_LIST_PAGE_KEY = "scheduled_job_choose_test_list_page";
    private static final String SCHEDULEDJOB_ASK_SEND_TEST_PAGE_KEY = "scheduled_job_ask_send_test_page";
    private static final String SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT_PAGE_KEY = "scheduled_job_choose_template_edit_page";
    private static final String SCHEDULEDJOB_CHOOSE_LIST_EDIT_PAGE_KEY = "scheduled_job_choose_list_edit_page";
    private static final String SCHEDULEDJOB_CHOOSE_COMMAND_EDIT_PAGE_KEY = "scheduled_job_choose_command_edit_page";
    private static final String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT_PAGE_KEY = "scheduled_job_choose_command_inputs_edit_page";
    private static final String SCHEDULEDJOB_LOG_PAGE_KEY = "scheduled_job_log_page";
    private static final String SCHEDULEDJOB_LOG_DATA_PAGE_KEY = "scheduled_job_log_data_page";
    private static final String SCHEDULEDJOB_SEARCH_PAGE_KEY = "scheduled_job_search_page";
    private static final String SCHEDULEDJOB_SEARCH_RESULTS_PAGE_KEY = "scheduled_job_search_results_page";

    // "constants" - they aren't actually constant, because they need
    // to be initialized from a non-static context

    // the alias to this servlet
    public static String ALIAS;

    // task package
    public static String TASK_PACKAGE;

    // max fields per address list member
    public static int ADDRESSLIST_NUM_FIELDS;

    // field prefix for naming fields in a member data form
    public static String FIELD_PREFIX;

    // xml tag for member data
    public static String MEMBER_TAG;

    // xml tag for email address
    public static String EMAIL_ADDRESS_TAG;

    // data source name
    public static String DATA_SOURCE_NAME;

    // group ID for deleted groups
    public static int DELETED_GROUP_ID;

    // list ID indicating that there's no static list chosen for a job
    public static int NO_LIST_ID;

    // command ID indicating that there's no query chosen for a job
    public static int NO_COMMAND_ID;

    // group ID for test address lists
    public static int TEST_LIST_GROUP_ID;

    // #days to look back for recent job list screen
    public static int RECENT_JOB_DAYS;

    // default #log entries to display per log screen
    public static int DEFAULT_NUM_LOG_ENTRIES_PER_SCREEN;



    // Statistics queries

    public static String RECENT_JOBS_COMMAND;
    public static String RECENT_JOBS_RESULT;
    public static String JOBS_BY_SENDER_COMMAND;
    public static String JOBS_BY_SENDER_RESULT;
    public static String JOBS_BY_SUBJECT_COMMAND;
    public static String JOBS_BY_SUBJECT_RESULT;
    public static String JOBS_BY_DATE_COMMAND;
    public static String JOBS_BY_DATE_RESULT;
    public static String QUERY_DESCRIPTION_COMMAND;
    public static String QUERY_DESCRIPTION_RESULT;

    public static String QUERY_METADATA_COMMAND;
    public static String QUERY_METADATA_RESULT;
    public static String EMAIL_QUERIES_COMMAND;
    public static String EMAIL_QUERIES_RESULT;
    public static String JOB_LOG_COMMAND;
    public static String JOB_LOG_RESULT;

    // EJB's

    // ejb lookup
    public static String EMAILTEMPLATE_EJB;
    public static String EMAILTEMPLATE_GROUP_EJB;
    public static String ADDRESSLIST_EJB;
    public static String ADDRESSLIST_GROUP_EJB;
    public static String SCHEDULEDJOB_EJB;

    public static String AUTHENTICATIONSERVICES_EJB;
    public static String STATISTICS_EJB;


    // Status ID's for jobs

    public static int JOB_STATUS_CREATING;
    public static int JOB_STATUS_READY;
    public static int JOB_STATUS_ACTIVE;
    public static int JOB_STATUS_COMPLETE;
    public static int JOB_STATUS_INCOMPLETE;
    public static int JOB_STATUS_CANCELLED;

    public static int JOB_TYPE_PREDETAIL;
    public static int JOB_TYPE_POSTDETAIL;


    // Tasks

    // go home
    public static String HOME_TASK;
    // template tasks
    public static String EMAILTEMPLATE_TASK;
    // address list tasks
    public static String ADDRESSLIST_TASK;
    // scheduled job tasks
    public static String SCHEDULEDJOB_TASK;

    // Pages

    // jsp root path

    public static String JSP_ROOT;

    // home page
    public static String HOME_PAGE;

    // error page
    public static String ERROR_PAGE;

    // E-mail Template pages
    public static String EMAILTEMPLATE_LIST_PAGE;
    public static String EMAILTEMPLATE_EDIT_PAGE;
    public static String EMAILTEMPLATE_CREATE_PAGE;

    // Address List pages
    public static String ADDRESSLIST_LIST_PAGE;
    public static String ADDRESSLIST_EDIT_PAGE;
    public static String ADDRESSLIST_CREATE_PAGE;
    public static String ADDRESSLIST_EDIT_MEMBER_PAGE;
    public static String ADDRESSLIST_ADD_MEMBER_PAGE;
    public static String ADDRESSLIST_BULK_ADD_PAGE;

    // Scheduled Job pages
    public static String SCHEDULEDJOB_LIST_PAGE;
    public static String SCHEDULEDJOB_EDIT_PAGE;
    public static String SCHEDULEDJOB_VIEW_PAGE;
    public static String SCHEDULEDJOB_CREATE_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_LIST_ADD_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_COMMAND_ADD_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_TEST_LIST_PAGE;
    public static String SCHEDULEDJOB_ASK_SEND_TEST_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_LIST_EDIT_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_COMMAND_EDIT_PAGE;
    public static String SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT_PAGE;
    public static String SCHEDULEDJOB_LOG_PAGE;
    public static String SCHEDULEDJOB_LOG_DATA_PAGE;
    public static String SCHEDULEDJOB_SEARCH_PAGE;
    public static String SCHEDULEDJOB_SEARCH_RESULTS_PAGE;


    public static void initialize(ServletConfig servletConfig)
            throws ServletException {
        ALIAS = servletConfig.getInitParameter(ALIAS_KEY);
        TASK_PACKAGE = servletConfig.getInitParameter(TASK_PACKAGE_KEY);

        try {
            ADDRESSLIST_NUM_FIELDS = Integer.parseInt(servletConfig.getInitParameter(ADDRESSLIST_NUM_FIELDS_KEY));
        } catch (NumberFormatException e) {
            ADDRESSLIST_NUM_FIELDS = DEFAULT_ADDRESSLIST_NUM_FIELDS;
        }
        FIELD_PREFIX = servletConfig.getInitParameter(FIELD_PREFIX_KEY);
        MEMBER_TAG = servletConfig.getInitParameter(MEMBER_TAG_KEY);
        EMAIL_ADDRESS_TAG = servletConfig.getInitParameter(EMAIL_ADDRESS_TAG_KEY);
        try {
            DELETED_GROUP_ID = Integer.parseInt(servletConfig.getInitParameter(DELETED_GROUP_ID_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            NO_LIST_ID = Integer.parseInt(servletConfig.getInitParameter(NO_LIST_ID_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            NO_COMMAND_ID = Integer.parseInt(servletConfig.getInitParameter(NO_COMMAND_ID_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            TEST_LIST_GROUP_ID = Integer.parseInt(servletConfig.getInitParameter(TEST_LIST_GROUP_ID_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            RECENT_JOB_DAYS = Integer.parseInt(servletConfig.getInitParameter(RECENT_JOB_DAYS_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            DEFAULT_NUM_LOG_ENTRIES_PER_SCREEN = Integer.parseInt(servletConfig.getInitParameter(DEFAULT_NUM_LOG_ENTRIES_PER_SCREEN_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }


        DATA_SOURCE_NAME = servletConfig.getInitParameter(DATA_SOURCE_NAME_KEY);

        RECENT_JOBS_COMMAND = servletConfig.getInitParameter(RECENT_JOBS_COMMAND_KEY);
        RECENT_JOBS_RESULT = servletConfig.getInitParameter(RECENT_JOBS_RESULT_KEY);
        JOBS_BY_SENDER_COMMAND = servletConfig.getInitParameter(JOBS_BY_SENDER_COMMAND_KEY);
        JOBS_BY_SENDER_RESULT = servletConfig.getInitParameter(JOBS_BY_SENDER_RESULT_KEY);
        JOBS_BY_SUBJECT_COMMAND = servletConfig.getInitParameter(JOBS_BY_SUBJECT_COMMAND_KEY);
        JOBS_BY_SUBJECT_RESULT = servletConfig.getInitParameter(JOBS_BY_SUBJECT_RESULT_KEY);
        JOBS_BY_DATE_COMMAND = servletConfig.getInitParameter(JOBS_BY_DATE_COMMAND_KEY);
        JOBS_BY_DATE_RESULT = servletConfig.getInitParameter(JOBS_BY_DATE_RESULT_KEY);
        QUERY_DESCRIPTION_COMMAND = servletConfig.getInitParameter(QUERY_DESCRIPTION_COMMAND_KEY);
        QUERY_DESCRIPTION_RESULT = servletConfig.getInitParameter(QUERY_DESCRIPTION_RESULT_KEY);

        QUERY_METADATA_COMMAND = servletConfig.getInitParameter(QUERY_METADATA_COMMAND_KEY);
        QUERY_METADATA_RESULT = servletConfig.getInitParameter(QUERY_METADATA_RESULT_KEY);
        EMAIL_QUERIES_COMMAND = servletConfig.getInitParameter(EMAIL_QUERIES_COMMAND_KEY);
        EMAIL_QUERIES_RESULT = servletConfig.getInitParameter(EMAIL_QUERIES_RESULT_KEY);
        JOB_LOG_COMMAND = servletConfig.getInitParameter(JOB_LOG_COMMAND_KEY);
        JOB_LOG_RESULT = servletConfig.getInitParameter(JOB_LOG_RESULT_KEY);

        String EMAIL_EJB_PACKAGE = servletConfig.getInitParameter(EMAIL_EJB_PACKAGE_KEY);
        String AUTHENTICATIONSERVICES_EJB_PACKAGE = servletConfig.getInitParameter(AUTHENTICATIONSERVICES_EJB_PACKAGE_KEY);
        String STATISTICS_EJB_PACKAGE = servletConfig.getInitParameter(STATISTICS_EJB_PACKAGE_KEY);
        EMAILTEMPLATE_EJB = EMAIL_EJB_PACKAGE + "." + servletConfig.getInitParameter(EMAILTEMPLATE_EJB_KEY);
        EMAILTEMPLATE_GROUP_EJB = EMAIL_EJB_PACKAGE + "." + servletConfig.getInitParameter(EMAILTEMPLATE_GROUP_EJB_KEY);
        ADDRESSLIST_EJB = EMAIL_EJB_PACKAGE + "." + servletConfig.getInitParameter(ADDRESSLIST_EJB_KEY);
        ADDRESSLIST_GROUP_EJB = EMAIL_EJB_PACKAGE + "." + servletConfig.getInitParameter(ADDRESSLIST_GROUP_EJB_KEY);
        SCHEDULEDJOB_EJB = EMAIL_EJB_PACKAGE + "." + servletConfig.getInitParameter(SCHEDULEDJOB_EJB_KEY);
        AUTHENTICATIONSERVICES_EJB = AUTHENTICATIONSERVICES_EJB_PACKAGE + "." + servletConfig.getInitParameter(AUTHENTICATIONSERVICES_EJB_KEY);
        STATISTICS_EJB = STATISTICS_EJB_PACKAGE + "." + servletConfig.getInitParameter(STATISTICS_EJB_KEY);

        try {
            JOB_STATUS_CREATING = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_CREATING_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }

        try {
            JOB_STATUS_READY = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_READY_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            JOB_STATUS_ACTIVE = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_ACTIVE_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            JOB_STATUS_COMPLETE = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_COMPLETE_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            JOB_STATUS_INCOMPLETE = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_INCOMPLETE_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }
        try {
            JOB_STATUS_CANCELLED = Integer.parseInt(servletConfig.getInitParameter(JOB_STATUS_CANCELLED_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }

        try {
            JOB_TYPE_PREDETAIL = Integer.parseInt(servletConfig.getInitParameter(JOB_TYPE_PREDETAIL_KEY));
        } catch (NumberFormatException e) {
            throw new ServletException(e);
        }


        HOME_TASK = servletConfig.getInitParameter(HOME_TASK_KEY);
        EMAILTEMPLATE_TASK = servletConfig.getInitParameter(EMAILTEMPLATE_TASK_KEY);
        ADDRESSLIST_TASK = servletConfig.getInitParameter(ADDRESSLIST_TASK_KEY);
        SCHEDULEDJOB_TASK = servletConfig.getInitParameter(SCHEDULEDJOB_TASK_KEY);

        JSP_ROOT = servletConfig.getInitParameter(JSP_ROOT_KEY);
        HOME_PAGE = JSP_ROOT + servletConfig.getInitParameter(HOME_PAGE_KEY);
        ERROR_PAGE = JSP_ROOT + servletConfig.getInitParameter(ERROR_PAGE_KEY);
        EMAILTEMPLATE_LIST_PAGE = JSP_ROOT + servletConfig.getInitParameter(EMAILTEMPLATE_LIST_PAGE_KEY);

        EMAILTEMPLATE_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(EMAILTEMPLATE_EDIT_PAGE_KEY);
        EMAILTEMPLATE_CREATE_PAGE = JSP_ROOT + servletConfig.getInitParameter(EMAILTEMPLATE_CREATE_PAGE_KEY);
        ADDRESSLIST_LIST_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_LIST_PAGE_KEY);
        ADDRESSLIST_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_EDIT_PAGE_KEY);
        ADDRESSLIST_CREATE_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_CREATE_PAGE_KEY);
        ADDRESSLIST_EDIT_MEMBER_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_EDIT_MEMBER_PAGE_KEY);
        ADDRESSLIST_ADD_MEMBER_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_ADD_MEMBER_PAGE_KEY);
        ADDRESSLIST_BULK_ADD_PAGE = JSP_ROOT + servletConfig.getInitParameter(ADDRESSLIST_BULK_ADD_PAGE_KEY);
        SCHEDULEDJOB_LIST_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_LIST_PAGE_KEY);
        SCHEDULEDJOB_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_EDIT_PAGE_KEY);
        SCHEDULEDJOB_VIEW_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_VIEW_PAGE_KEY);
        SCHEDULEDJOB_CREATE_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CREATE_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_LIST_ADD_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_LIST_ADD_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_COMMAND_ADD_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_COMMAND_ADD_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_TEST_LIST_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_TEST_LIST_PAGE_KEY);
        SCHEDULEDJOB_ASK_SEND_TEST_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_ASK_SEND_TEST_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_LIST_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_LIST_EDIT_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_COMMAND_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_COMMAND_EDIT_PAGE_KEY);
        SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT_PAGE_KEY);
        SCHEDULEDJOB_LOG_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_LOG_PAGE_KEY);
        SCHEDULEDJOB_LOG_DATA_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_LOG_DATA_PAGE_KEY);
        SCHEDULEDJOB_SEARCH_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_SEARCH_PAGE_KEY);
        SCHEDULEDJOB_SEARCH_RESULTS_PAGE = JSP_ROOT + servletConfig.getInitParameter(SCHEDULEDJOB_SEARCH_RESULTS_PAGE_KEY);
    }

}
