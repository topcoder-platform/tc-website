package com.topcoder.web.tces.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.text.*;

/////////////// jk: todo: place all string literal constants in web.xml
////////////////////// and update code to load them ...

public class TCESConstants {

    // jsp-related
    public static String JSP_ROOT = null;
    public static String TCES_PACKAGE = "com.topcoder.web.tces.bean";
            // com.topcoder.web.tces.bean
    public static String ERROR_PAGE = null;
    public static String AUTH_FAILED_PAGE = "/tces?task=LoginTask";
    public static String LOGIN_PAGE = "/login.jsp";
    public static String LOGIN_OK_PAGE = "/tces?task=MainTask&st=v";
    public static String MAIN_PAGE = "/main.jsp";
    public static String MAIN_GODETAIL_PAGE = "/tces?task=CampaignDetailTask";
    public static String CAMPAIGN_DETAIL_PAGE = "/campaign_detail.jsp";
    public static String POSITION_INTEREST_PAGE = "/position_interest.jsp";
    public static String CAMPAIGN_INTEREST_PAGE = "/campaign_interest.jsp";
    public static String DEMOGRAPHIC_PAGE = "/demographic_info.jsp";
    public static String MEMBER_PROFILE_PAGE = "/member_profile.jsp";
    public static String CODER_DEMOGRAPHICS_PAGE = "/coder_demographics.jsp";
    public static String COMPETITION_HISTORY_PAGE = "/competition_history.jsp";
    public static String COMPETITION_STATISTICS_PAGE = "/competition_statistics.jsp";
    public static String PROBLEM_SUBMISSIONS_PAGE = "/problem_submissions.jsp";
    public static String PROBLEM_STATISTICS_PAGE = "/problem_statistics.jsp";
    public static String PROBLEM_STATEMENT_PAGE = "/problem_statement.jsp";
    public static String MEMBER_INTEREST_PAGE = "/member_interest.jsp";

    public static String LOGIN_TASK = "LoginTask";
    public static String LOGIN_TASK_STEP_VIEW = "v";
    public static String LOGIN_TASK_STEP_AUTH = "a";
    public static String MAIN_TASK = "MainTask";
    public static String CAMPAIGN_DETAIL_TASK = "CampaignDetailTask";
    public static String CAMPAIGN_INTEREST_TASK = "CampaignInterestTask";
    public static String POSITION_INTEREST_TASK = "PositionInterestTask";
    public static String DEMOGRAPHIC_TASK = "DemographicTask";
    public static String MEMBER_PROFILE_TASK = "MemberProfileTask";
    public static String CODER_DEMOGRAPHICS_TASK = "CoderDemographicsTask";
    public static String COMPETITION_HISTORY_TASK = "CompetitionHistoryTask";
    public static String COMPETITION_STATISTICS_TASK = "CompetitionStatisticsTask";
    public static String PROBLEM_SUBMISSIONS_TASK = "ProblemSubmissionsTask";
    public static String PROBLEM_STATISTICS_TASK = "ProblemStatisticsTask";
    public static String PROBLEM_STATEMENT_TASK = "ProblemStatementTask";
    public static String MEMBER_INTEREST_TASK = "MemberInterestTask";

    public static String SORT_HANDLE = "ha";
    public static String SORT_RATING = "ra";
    public static String SORT_STATE = "state";
    public static String SORT_TYPE = "type";
    public static String SORT_SCHOOL = "sc";
    public static String SORT_HITDATE = "hd";

    public static String SORT_ORDER_ASC = "a";
    public static String SORT_ORDER_DES = "d";

    public static String TASK_PARAM = "task";
    public static String STEP_PARAM = null;
    public static String SORT_PARAM = "sort";
    public static String SORT_ORDER_PARAM = "so";
    public static String USER_ID_PARAM = null;
    public static String HANDLE_PARAM = null;
    public static String PASSWORD_PARAM = null;
    public static String CAMPAIGN_ID_PARAM = "cid";
    public static String JOB_ID_PARAM = null;
    public static String MEMBER_ID_PARAM = "mid";
    public static String ROUND_ID_PARAM = "rd";
    public static String PROBLEM_ID_PARAM = "pm";

    public static String MSG_ATTR_KEY = null;
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

    public static String[] MEM_RATING_STATSBYLEVEL_KEYS = {"level_desc",
                                                           "num_presented",
                                                           "num_submitted",
                                                           "pct_submitted",
                                                           "num_correct",
                                                           "pct_accuracy",
                                                           "pct_overall",
                                                           "avg_ptspersub",
                                                           "avg_ptsoverall",
                                                           "avg_timetosubmit" };
    public static String[] MEM_RATING_STATSBYLEVEL_TITLES = {"",
                                                             "Presented",
                                                             "Submitted",
                                                             "Submit %",
                                                             "Correct",
                                                             "Submission Accuracy",
                                                             "Overall Accuracy",
                                                             "Avg Points for Submissions",
                                                             "Avg Points Overall",
                                                             "Avg Time to Submit" };
    public static String[] MEM_RATING_STATSBYLANG_KEYS = {"lang_desc",
                                                          "num_submitted",
                                                          "pct_submitted",
                                                          "num_correct",
                                                          "pct_accuracy",
                                                          "avg_ptspersub",
                                                          "avg_timetosubmit" };
    public static String[] MEM_RATING_STATSBYLANG_TITLES = {"",
                                                           "Submitted",
                                                           "Submit %",
                                                           "Correct",
                                                           "Submission Accuarcy",
                                                           "Avg Points for Submissions",
                                                           "Avg Time to Submit" };

    public static int PRO_CODER_TYPE  = 2;
    public static int STUDENT_CODER_TYPE = 1;

    public static DateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");
    public static NumberFormat NUMBER_FORMAT = new DecimalFormat("####0.00");

    public static void init(ServletConfig servletConfig) throws ServletException {
        JSP_ROOT = servletConfig.getInitParameter("jsp_root");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");

        STEP_PARAM = servletConfig.getInitParameter("step_param");
        JOB_ID_PARAM = servletConfig.getInitParameter("job_id_param");
        USER_ID_PARAM = servletConfig.getInitParameter("user_id_param");
        HANDLE_PARAM = servletConfig.getInitParameter("handle_param");
        PASSWORD_PARAM = servletConfig.getInitParameter("password_param");

        MSG_ATTR_KEY = servletConfig.getInitParameter("msg_attr_key");

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
