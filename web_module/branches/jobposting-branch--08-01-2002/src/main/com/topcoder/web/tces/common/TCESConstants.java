package com.topcoder.web.tces.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class TCESConstants {

    // jsp-related
    public static String JSP_ROOT = null;
    public static String TCES_PACKAGE = "com.topcoder.web.tces.bean";
            // com.topcoder.web.tces.bean
    public static String ERROR_PAGE = null;
    public static String LOGIN_PAGE = null;
    public static String LOGIN_OK_PAGE = "/tces/tces?task=MainTask&st=v";
    public static String MAIN_PAGE = "/tces/tces?task=MainTask&st=v";
    public static String CAMPAIGN_DETAIL_PAGE = "/tces/tces?task=CampaignDetailTask";
    public static String CAMPAIGN_INTEREST_PAGE = "/tces/tces?task=CampaignInterestTask";

    public static String LOGIN_TASK = "LoginTask";
    public static String LOGIN_TASK_STEP_VIEW = "v";
    public static String LOGIN_TASK_STEP_AUTH = "a";
    public static String MAIN_TASK = "MainTask";
    public static String CAMPAIGN_DETAIL_TASK = "CampaignDetailTask";
    public static String CAMPAIGN_INTEREST_TASK = "CampaignInterestTask";

    public static String TASK_PARAM = "task";
    public static String STEP_PARAM = null;
    public static String JOB_ID_PARAM = null;
    public static String USER_ID_PARAM = null;
    public static String HANDLE_PARAM = null;
    public static String PASSWORD_PARAM = null;
    public static String CAMPAIGN_ID_PARAM = "campid";

    public static String MSG_ATTR_KEY = null;
    public static String COMPANY_NAME_ATTR_KEY = "CompanyName";
    public static String CAMPAIGN_INFO_ATTR_KEY = "CampaignInfoList";

    public static int CLICK_THRU_ID = -1;
    public static int JOB_POSTING_ID = -1;

    public static void init(ServletConfig servletConfig) throws ServletException {
        JSP_ROOT = servletConfig.getInitParameter("jsp_root");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        LOGIN_PAGE = servletConfig.getInitParameter("login_page");
        MAIN_PAGE = servletConfig.getInitParameter("main_page");

        STEP_PARAM = servletConfig.getInitParameter("step_param");
        JOB_ID_PARAM = servletConfig.getInitParameter("job_id_param");
        USER_ID_PARAM = servletConfig.getInitParameter("job_id_param");
        HANDLE_PARAM = servletConfig.getInitParameter("handle_param");
        PASSWORD_PARAM = servletConfig.getInitParameter("password_param");

        MSG_ATTR_KEY = servletConfig.getInitParameter("msg_attr_key");

        CLICK_THRU_ID = getIntParameter(servletConfig, "click_thru_id");
        JOB_POSTING_ID = getIntParameter(servletConfig, "job_posting_id");
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
