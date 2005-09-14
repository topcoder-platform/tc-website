package com.topcoder.web.corp.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

public class TCESConstants {

    // jsp-related
    public static String JSP_ROOT = null;
    public static String TCES_PACKAGE = null;
    public static String ERROR_PAGE = null;
    public static String LOGIN_PAGE = null;
    public static String LOGIN_OK_PAGE = null;
    public static String MAIN_PAGE = null;
    public static String CAMPAIGN_DETAIL_PAGE = null;
    public static String POSITION_INTEREST_PAGE = null;
    public static String CAMPAIGN_INTEREST_PAGE = null;
    public static String DEMOGRAPHIC_PAGE = null;
    public static String MEMBER_PROFILE_PAGE = null;
    public static String CODER_DEMOGRAPHICS_PAGE = null;
    public static String COMPETITION_HISTORY_PAGE = null;
    public static String COMPETITION_STATISTICS_PAGE = null;
    public static String PROBLEM_SUBMISSIONS_PAGE = null;
    public static String PROBLEM_STATISTICS_PAGE = null;
    public static String PROBLEM_STATEMENT_PAGE = null;
    public static String MEMBER_INTEREST_PAGE = null;

    public static String MAIN_NAME = null;
    public static String CAMPAIGN_DETAIL_NAME = null;
    public static String CAMPAIGN_INTEREST_NAME = null;
    public static String POSITION_INTEREST_NAME = null;
    public static String MEMBER_PROFILE_NAME = null;

    public static String LOGIN_TASK = null;
    public static String LOGIN_TASK_STEP_VIEW = null;
    public static String LOGIN_TASK_STEP_AUTH = null;
    public static String MAIN_TASK = null;
    public static String CAMPAIGN_DETAIL_TASK = null;
    public static String CAMPAIGN_INTEREST_TASK = null;
    public static String POSITION_INTEREST_TASK = null;
    public static String DEMOGRAPHIC_TASK = null;
    public static String MEMBER_PROFILE_TASK = null;
    public static String CODER_DEMOGRAPHICS_TASK = null;
    public static String COMPETITION_HISTORY_TASK = null;
    public static String COMPETITION_STATISTICS_TASK = null;
    public static String PROBLEM_SUBMISSIONS_TASK = null;
    public static String PROBLEM_STATISTICS_TASK = null;
    public static String PROBLEM_STATEMENT_TASK = null;
    public static String MEMBER_INTEREST_TASK = null;
    public static String RESUME_DOWNLOAD_TASK = null;

    // SORT_X constants are used by PositionInterestTask and CampaignInterestTask.
    public static String SORT_HANDLE = "ha";
    public static String SORT_RATING = "ra";
    public static String SORT_STATE = "st";
    public static String SORT_TYPE = "type";
    public static String SORT_SCHOOL = "sc";
    public static String SORT_HITDATE = "hd";
    public static String SORT_COUNTRY = "country";
    public static String SORT_POSITION = "p";

    public static String SORT_ORDER_ASC = null;
    public static String SORT_ORDER_DES = null;

    public static String TASK_PARAM = null;
    public static String STEP_PARAM = null;
    public static String SORT_PARAM = null;
    public static String SORT_ORDER_PARAM = null;
    public static String BACK_SORT_PARAM = null;
    public static String BACK_SORT_ORDER_PARAM = null;
    public static String USER_ID_PARAM = null;
    public static String HANDLE_PARAM = null;
    public static String PASSWORD_PARAM = null;
    public static String CAMPAIGN_ID_PARAM = null;
    public static String JOB_ID_PARAM = null;
    public static String MEMBER_ID_PARAM = null;
    public static String ROUND_ID_PARAM = null;
    public static String PROBLEM_ID_PARAM = null;

    public static String MSG_ATTR_KEY = "message";
    public static String COMPANY_NAME_ATTR_KEY = "CompanyName";
    public static String CAMPAIGN_INFO_ATTR_KEY = "CampaignInfoList";
    public static String DEMOGRAPHIC_REFERRAL_KEY = "referral";
    public static String DEMOGRAPHIC_NOTIFY_KEY = "notify";
    public static String DEMOGRAPHIC_INFO_KEY = "info";
    public static String MEM_INFO_HANDLE_KEY = "handle";
    public static String MEM_INFO_SINCE_KEY = "membersince";
    public static String MEM_INFO_FULLNAME_KEY = "fullname";
    public static String MEM_INFO_FULLADDR_KEY = "fulladdress";
    public static String MEM_INFO_CONTACT_KEY = "contact";
    public static String MEM_INFO_MEMTYPE_KEY = "membertype";
    public static String MEM_INFO_SCHOOLNAME_KEY = "schoolname";
    public static String MEM_INFO_DEGREE_KEY = "degree";
    public static String MEM_INFO_MAJOR_KEY = "major";
    public static String MEM_INFO_GRADDATE_KEY = "graddate";
    public static String MEM_RATING_CURRENT_KEY = "current";
    public static String MEM_RATING_HIGH_KEY = "high";
    public static String MEM_RATING_LOW_KEY = "low";
    public static String MEM_RATING_PCTILE_KEY = "percentile";
    public static String MEM_RATING_NUMEVENTS_KEY = "numberofevents";
    public static String MEM_RATING_MOSTRECENT_KEY = "mostrecent";
    public static String MEM_RATING_AVGPOINTS_KEY = "avgpoints";

    public static final String ADMIN_COMPANY = "Admin Access";

    public static String[] MEM_RATING_STATSBYLEVEL_KEYS = {"level_desc",
                                                           "num_presented",
                                                           "num_submitted",
                                                           "pct_submitted",
                                                           "num_correct",
                                                           "pct_accuracy",
                                                           "pct_overall",
                                                           "avg_ptspersub",
                                                           "avg_ptsoverall",
                                                           "avg_timetosubmit"};
    public static String[] MEM_RATING_STATSBYLEVEL_TITLES = {"",
                                                             "Presented",
                                                             "Submitted",
                                                             "Submit %",
                                                             "Correct",
                                                             "Submission Accuracy",
                                                             "Overall Accuracy",
                                                             "Avg Points for Submissions",
                                                             "Avg Points Overall",
                                                             "Avg Time to Submit"};
    public static String[] MEM_RATING_STATSBYLANG_KEYS = {"lang_desc",
                                                          "num_submitted",
                                                          "pct_submitted",
                                                          "num_correct",
                                                          "pct_accuracy",
                                                          "avg_ptspersub",
                                                          "avg_timetosubmit"};
    public static String[] MEM_RATING_STATSBYLANG_TITLES = {"",
                                                            "Submitted",
                                                            "Submit %",
                                                            "Correct",
                                                            "Submission Accuracy",
                                                            "Avg Points for Submissions",
                                                            "Avg Time to Submit"};

    public static int PRO_CODER_TYPE;
    public static int STUDENT_CODER_TYPE;

    public static int PROBLEM_STATUS_OPEN;
    public static int PROBLEM_STATUS_COMPILED;

    public static DateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");
    public static NumberFormat NUMBER_FORMAT = new DecimalFormat("####0.00");

    public static void init(ServletConfig servletConfig) throws ServletException {

/*
        bundle = new TCResourceBundle("TCES");

        JSP_ROOT = bundle.getProperty("jsp_root", "");
        TCES_PACKAGE = bundle.getProperty("tces_package", "");
        ERROR_PAGE = bundle.getProperty("error_page", "");

        AUTH_FAILED_PAGE = bundle.getProperty("auth_failed_page", "");
        LOGIN_PAGE = bundle.getProperty("login_page", "");
        LOGIN_OK_PAGE = bundle.getProperty("login_ok_page", "");
        MAIN_PAGE = bundle.getProperty("main_page", "");
        MAIN_GODETAIL_PAGE = bundle.getProperty("main_godetail_page", "");
        CAMPAIGN_DETAIL_PAGE = bundle.getProperty("campaign_detail_page", "");
        POSITION_INTEREST_PAGE = bundle.getProperty("position_interest_page", "");
        CAMPAIGN_INTEREST_PAGE = bundle.getProperty("campaign_interest_page", "");
        DEMOGRAPHIC_PAGE = bundle.getProperty("demographic_page", "");
        MEMBER_PROFILE_PAGE = bundle.getProperty("member_profile_page", "");
        CODER_DEMOGRAPHICS_PAGE = bundle.getProperty("coder_demographics_page", "");
        COMPETITION_HISTORY_PAGE = bundle.getProperty("competition_history_page", "");
        COMPETITION_STATISTICS_PAGE = bundle.getProperty("competition_statistics_page", "");
        PROBLEM_SUBMISSIONS_PAGE = bundle.getProperty("problem_submissions_page", "");
        PROBLEM_STATISTICS_PAGE = bundle.getProperty("problem_statistics_page", "");
        PROBLEM_STATEMENT_PAGE = bundle.getProperty("problem_statement_page", "");
        MEMBER_INTEREST_PAGE = bundle.getProperty("member_interest_page", "");
        LOGIN_TASK = bundle.getProperty("login_task", "");
        LOGIN_TASK_STEP_VIEW = bundle.getProperty("login_task_step_view", "");
        LOGIN_TASK_STEP_AUTH = bundle.getProperty("login_task_step_auth", "");
        MAIN_TASK = bundle.getProperty("main_task", "");
        CAMPAIGN_DETAIL_TASK = bundle.getProperty("campaign_detail_task", "");
        CAMPAIGN_INTEREST_TASK = bundle.getProperty("campaign_interest_task", "");
        POSITION_INTEREST_TASK = bundle.getProperty("position_interest_task", "");
        DEMOGRAPHIC_TASK = bundle.getProperty("demographic_task", "");
        MEMBER_PROFILE_TASK = bundle.getProperty("member_profile_task", "");
        CODER_DEMOGRAPHICS_TASK = bundle.getProperty("coder_demographics_task", "");
        COMPETITION_HISTORY_TASK = bundle.getProperty("competition_history_task", "");
        COMPETITION_STATISTICS_TASK = bundle.getProperty("competition_statistics_task", "");
        PROBLEM_SUBMISSIONS_TASK = bundle.getProperty("problem_submissions_task", "");
        PROBLEM_STATISTICS_TASK = bundle.getProperty("problem_statistics_task", "");
        PROBLEM_STATEMENT_TASK = bundle.getProperty("problem_statement_task", "");
        MEMBER_INTEREST_TASK = bundle.getProperty("member_interest_task", "");
        RESUME_DOWNLOAD_TASK = bundle.getProperty("resume_download_task", "");

        SORT_ORDER_ASC = bundle.getProperty("sort_order_asc", "");
        SORT_ORDER_DES = bundle.getProperty("sort_order_des", "");

        TASK_PARAM = bundle.getProperty("task_param", "");
        STEP_PARAM = bundle.getProperty("step_param", "");
        SORT_PARAM = bundle.getProperty("sort_param", "");
        SORT_ORDER_PARAM = bundle.getProperty("sort_order_param", "");
        BACK_SORT_PARAM = bundle.getProperty("back_sort_param", "");
        BACK_SORT_ORDER_PARAM = bundle.getProperty("back_sort_order_param", "");
        USER_ID_PARAM = bundle.getProperty("user_id_param", "");
        HANDLE_PARAM = bundle.getProperty("handle_param", "");
        PASSWORD_PARAM = bundle.getProperty("password_param", "");
        CAMPAIGN_ID_PARAM = bundle.getProperty("campaign_id_param", "");
        JOB_ID_PARAM = bundle.getProperty("job_id_param", "");
        MEMBER_ID_PARAM = bundle.getProperty("member_id_param", "");
        ROUND_ID_PARAM = bundle.getProperty("round_id_param", "");
        PROBLEM_ID_PARAM = bundle.getProperty("problem_id_param", "");

        PRO_CODER_TYPE = bundle.getIntProperty("pro_coder_type", 2);
        STUDENT_CODER_TYPE = bundle.getIntProperty("student_coder_type", 1);
        PROBLEM_STATUS_OPEN = bundle.getIntProperty("problem_status_open", 120);
        PROBLEM_STATUS_COMPILED = bundle.getIntProperty("problem_status_compiled", 121);

        MAIN_NAME = bundle.getProperty("main_name", "Main");
        CAMPAIGN_DETAIL_NAME = bundle.getProperty("campaign_detail_name", "Campaign Detail");
        CAMPAIGN_INTEREST_NAME = bundle.getProperty("campaign_interest_name", "Campaign Interest");
        POSITION_INTEREST_NAME = bundle.getProperty("position_interest_name", "Position Interest");
        MEMBER_PROFILE_NAME = bundle.getProperty("member_profile_name", "Member Profile");

        JSP_ROOT = bundle.getProperty("jsp_root", "");
        ERROR_PAGE = bundle.getProperty("error_page", "");
*/

        JSP_ROOT = servletConfig.getInitParameter("jsp_root");
        TCES_PACKAGE = servletConfig.getInitParameter("tces_package");
        ERROR_PAGE = JSP_ROOT + servletConfig.getInitParameter("error_page");

        LOGIN_PAGE = servletConfig.getInitParameter("login_page");
        MAIN_PAGE = JSP_ROOT + servletConfig.getInitParameter("main_page");
        CAMPAIGN_DETAIL_PAGE = JSP_ROOT + servletConfig.getInitParameter("campaign_detail_page");
        POSITION_INTEREST_PAGE = JSP_ROOT + servletConfig.getInitParameter("position_interest_page");
        CAMPAIGN_INTEREST_PAGE = JSP_ROOT + servletConfig.getInitParameter("campaign_interest_page");
        DEMOGRAPHIC_PAGE = JSP_ROOT + servletConfig.getInitParameter("demographic_page");
        MEMBER_PROFILE_PAGE = JSP_ROOT + servletConfig.getInitParameter("member_profile_page");
        CODER_DEMOGRAPHICS_PAGE = JSP_ROOT + servletConfig.getInitParameter("coder_demographics_page");
        COMPETITION_HISTORY_PAGE = JSP_ROOT + servletConfig.getInitParameter("competition_history_page");
        COMPETITION_STATISTICS_PAGE = JSP_ROOT + servletConfig.getInitParameter("competition_statistics_page");
        PROBLEM_SUBMISSIONS_PAGE = JSP_ROOT + servletConfig.getInitParameter("problem_submissions_page");
        PROBLEM_STATISTICS_PAGE = JSP_ROOT + servletConfig.getInitParameter("problem_statistics_page");
        PROBLEM_STATEMENT_PAGE = JSP_ROOT + servletConfig.getInitParameter("problem_statement_page");
        MEMBER_INTEREST_PAGE = JSP_ROOT + servletConfig.getInitParameter("member_interest_page");

        LOGIN_TASK = servletConfig.getInitParameter("login_task");
        LOGIN_TASK_STEP_VIEW = servletConfig.getInitParameter("login_task_step_view");
        LOGIN_TASK_STEP_AUTH = servletConfig.getInitParameter("login_task_step_auth");
        MAIN_TASK = servletConfig.getInitParameter("main_task");
        CAMPAIGN_DETAIL_TASK = servletConfig.getInitParameter("campaign_detail_task");
        CAMPAIGN_INTEREST_TASK = servletConfig.getInitParameter("campaign_interest_task");
        POSITION_INTEREST_TASK = servletConfig.getInitParameter("position_interest_task");
        DEMOGRAPHIC_TASK = servletConfig.getInitParameter("demographic_task");
        MEMBER_PROFILE_TASK = servletConfig.getInitParameter("member_profile_task");
        CODER_DEMOGRAPHICS_TASK = servletConfig.getInitParameter("coder_demographics_task");
        COMPETITION_HISTORY_TASK = servletConfig.getInitParameter("competition_history_task");
        COMPETITION_STATISTICS_TASK = servletConfig.getInitParameter("competition_statistics_task");
        PROBLEM_SUBMISSIONS_TASK = servletConfig.getInitParameter("problem_submissions_task");
        PROBLEM_STATISTICS_TASK = servletConfig.getInitParameter("problem_statistics_task");
        PROBLEM_STATEMENT_TASK = servletConfig.getInitParameter("problem_statement_task");
        MEMBER_INTEREST_TASK = servletConfig.getInitParameter("member_interest_task");
        RESUME_DOWNLOAD_TASK = servletConfig.getInitParameter("resume_download_task");

        SORT_ORDER_ASC = servletConfig.getInitParameter("sort_order_asc");
        SORT_ORDER_DES = servletConfig.getInitParameter("sort_order_des");

        TASK_PARAM = servletConfig.getInitParameter("task_param");
        STEP_PARAM = servletConfig.getInitParameter("step_param");
        SORT_PARAM = servletConfig.getInitParameter("sort_param");
        SORT_ORDER_PARAM = servletConfig.getInitParameter("sort_order_param");
        BACK_SORT_PARAM = servletConfig.getInitParameter("back_sort_param");
        BACK_SORT_ORDER_PARAM = servletConfig.getInitParameter("back_sort_order_param");
        USER_ID_PARAM = servletConfig.getInitParameter("user_id_param");
        HANDLE_PARAM = servletConfig.getInitParameter("handle_param");
        PASSWORD_PARAM = servletConfig.getInitParameter("password_param");
        CAMPAIGN_ID_PARAM = servletConfig.getInitParameter("campaign_id_param");
        JOB_ID_PARAM = servletConfig.getInitParameter("job_id_param");
        MEMBER_ID_PARAM = servletConfig.getInitParameter("member_id_param");
        ROUND_ID_PARAM = servletConfig.getInitParameter("round_id_param");
        PROBLEM_ID_PARAM = servletConfig.getInitParameter("problem_id_param");

        PRO_CODER_TYPE = getIntParameter(servletConfig, "pro_coder_type");
        STUDENT_CODER_TYPE = getIntParameter(servletConfig, "student_coder_type");
        PROBLEM_STATUS_OPEN = getIntParameter(servletConfig, "problem_status_open");
        PROBLEM_STATUS_COMPILED = getIntParameter(servletConfig, "problem_status_compiled");

        MAIN_NAME = servletConfig.getInitParameter("main_name");
        CAMPAIGN_DETAIL_NAME = servletConfig.getInitParameter("campaign_detail_name");
        CAMPAIGN_INTEREST_NAME = servletConfig.getInitParameter("campaign_interest_name");
        POSITION_INTEREST_NAME = servletConfig.getInitParameter("position_interest_name");
        MEMBER_PROFILE_NAME = servletConfig.getInitParameter("member_profile_name");
    }


    private static int getIntParameter(ServletConfig servletConfig, String key)
            throws ServletException {
        int ret = -1;
        try {
            ret = Integer.parseInt(servletConfig.getInitParameter(key));
        } catch (Exception e) {
            throw new ServletException("Could not parse integer for key: " + key);
        }
        return ret;
    }


}

