package com.topcoder.web.tc.controller.legacy.jobposting.common;

import com.topcoder.shared.util.TCResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class Constants {

    private static TCResourceBundle bundle = null;
    public static String JOB_HIT_TYPE_PARAM = null;
    public static String JOB_HIT_PREFIX = null;
    public static int CLICK_THRU_ID = -1;
    public static int JOB_POSTING_ID = -1;
    public static String JOB_ID_PARAM = null;
    public static String TASK_PARAM = null;
    public static String STEP_PARAM = null;
    public static String JOB_POSTING_PACKAGE = null;
    public static String ERROR_PAGE = null;
    public static String PROFILE_PAGE = null;
    public static String UNRATED_PAGE = null;
    public static String NO_RESUME_PAGE = null;

    public static void init(ServletConfig servletConfig) throws ServletException {
/*
        JOB_HIT_TYPE_PARAM = servletConfig.getInitParameter("job_hit_type_param");
        JOB_HIT_PREFIX = servletConfig.getInitParameter("job_hit_prefix");
        CLICK_THRU_ID = getIntParameter(servletConfig, "click_thru_id");
        JOB_POSTING_ID = getIntParameter(servletConfig, "job_posting_id");
        JOB_ID_PARAM = servletConfig.getInitParameter("job_id_param");
        TASK_PARAM = servletConfig.getInitParameter("task_param");
        STEP_PARAM = servletConfig.getInitParameter("step_param");
        JOB_POSTING_PACKAGE = servletConfig.getInitParameter("com.topcoder.web.tc.controller.legacy.jobposting.bean");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        PROFILE_PAGE = servletConfig.getInitParameter("profile_page");
*/
        bundle = new TCResourceBundle("JobPosting");
        JOB_HIT_TYPE_PARAM = bundle.getProperty("job_hit_type_param", "jt");
        JOB_HIT_PREFIX = bundle.getProperty("job_hit_prefix", "jobhit_");
        JOB_POSTING_ID = bundle.getIntProperty("job_posting_id", 2);
        CLICK_THRU_ID = bundle.getIntProperty("click_thru_id", 1);
        JOB_ID_PARAM = bundle.getProperty("job_id_param", "jid");
        TASK_PARAM = bundle.getProperty("task_param", "t");
        STEP_PARAM = bundle.getProperty("step_param", "st");
        JOB_POSTING_PACKAGE = bundle.getProperty("job_posting_package", "com.topcoder.web.tc.controller.legacy.jobposting.bean");
        ERROR_PAGE = bundle.getProperty("error_page", "errorPage.jsp");
        PROFILE_PAGE = bundle.getProperty("profile_page", "profile.jsp");
        UNRATED_PAGE = bundle.getProperty("unrated_page", "unrated.jsp");
        NO_RESUME_PAGE= bundle.getProperty("no_resume_page", "noResume.jsp");
    }
/*
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
*/
}
