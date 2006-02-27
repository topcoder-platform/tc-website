package com.topcoder.web.tc.controller.legacy.resume.common;

import com.topcoder.shared.util.TCResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

public class Constants {

    private static TCResourceBundle bundle = null;

    public static String MESSAGE_KEY = null;
    public static String NAVIGATION_KEY = null;
    public static String TASK_KEY = null;
    public static String STEP_KEY = null;
    public static String ERROR_PAGE = null;
    public static String SUCCESS_PAGE = null;
    public static String UPLOAD_PAGE = null;
    public static String TASK_PACKAGE = null;

    public static void init(ServletConfig servletConfig) throws ServletException {
        bundle = new TCResourceBundle("Resume");

        MESSAGE_KEY = bundle.getProperty("message_key", "message");
        NAVIGATION_KEY = bundle.getProperty("navigation_key", "navigation");
        TASK_KEY = bundle.getProperty("task_key", "t");
        STEP_KEY = bundle.getProperty("step_key", "st");
        ERROR_PAGE = bundle.getProperty("error_page", "/errorPage.jsp");
        SUCCESS_PAGE = bundle.getProperty("success_page", "/resume/upload_success.jsp");
        UPLOAD_PAGE = bundle.getProperty("upload_page", "/resume/resume_upload.jsp");
        TASK_PACKAGE = bundle.getProperty("task_package", "com.topcoder.web.tc.controller.legacy.resume.bean");

    }

}
