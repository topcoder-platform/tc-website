package com.topcoder.web.tces.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class TCESConstants {

    public static String JSP_ROOT = null;
    public static String ERROR_PAGE = null;
    public static String JOB_ID_KEY = null;
    public static String USER_ID_KEY = null;

    public static String HANDLE_KEY = null;
    public static String PASSWORD_KEY = null;
    public static String MSG_ATTR_KEY = null;

    public static int CLICK_THRU_ID = -1;
    public static int JOB_POSTING_ID = -1;

    public static void init(ServletConfig servletConfig) throws ServletException {
        JSP_ROOT = servletConfig.getInitParameter("jsp_root");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        JOB_ID_KEY = servletConfig.getInitParameter("job_id");
        USER_ID_KEY = servletConfig.getInitParameter("user_id");
        CLICK_THRU_ID = getIntParameter(servletConfig, "click_thru");
        JOB_POSTING_ID = getIntParameter(servletConfig, "job_posting");


        HANDLE_KEY = servletConfig.getInitParameter("handle");
        PASSWORD_KEY = servletConfig.getInitParameter("password");
        MSG_ATTR_KEY = servletConfig.getInitParameter("msg_attr");
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
