package com.topcoder.web.tces.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class TCESConstants {

    public static String COMMAND = null;
    public static String ERROR_PAGE = null;
    public static String JOB_ID_KEY = null;
    public static String USER_ID_KEY = null;
    public static int CLICK_THRU_ID = -1;
    public static int JOB_POSTING_ID = -1;

    public static void init(ServletConfig servletConfig) throws ServletException {
        COMMAND = servletConfig.getInitParameter("command");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        JOB_ID_KEY = servletConfig.getInitParameter("job_id");
        USER_ID_KEY = servletConfig.getInitParameter("user_id");
        CLICK_THRU_ID = getIntParameter(servletConfig, "click_thru");
        JOB_POSTING_ID = getIntParameter(servletConfig, "job_posting");
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
