package com.topcoder.web.jobposting.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class Constants {

    public static String JOB_HIT_TYPE_PARAM = null;
    public static String JOB_HIT_PREFIX = null;
    public static int CLICK_THRU_ID = -1;
    public static int JOB_POSTING_ID = -1;
    public static String JOB_ID_PARAM = null;

    public static void init(ServletConfig servletConfig) throws ServletException {
        JOB_HIT_TYPE_PARAM = servletConfig.getInitParameter("job_hit_type_param");
        JOB_HIT_PREFIX = servletConfig.getInitParameter("job_hit_prefix");
        CLICK_THRU_ID = getIntParameter(servletConfig, "click_thru_id");
        JOB_POSTING_ID = getIntParameter(servletConfig, "job_posting_id");
        JOB_ID_PARAM = servletConfig.getInitParameter("job_id_param");
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
