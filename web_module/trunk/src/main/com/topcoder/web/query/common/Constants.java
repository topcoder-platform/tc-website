package com.topcoder.web.query.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import java.text.*;

/**
 * Constants for the query tool
 * @author Greg Paul
 */
public class Constants {

    public static String QUERY_PACKAGE = null;
    public static String ERROR_PAGE = null;
    public static String LOGIN_PAGE = null;
    public static String COMMAND_LIST_PAGE = null;
    public static String COMMAND_DETAIL_PAGE = null;
    public static String QUERY_DETAIL_PAGE = null;
    public static String MODIFY_GROUP_PAGE = null;
    public static String MODIFY_COMMAND_PAGE = null;
    public static String MODIFY_QUERY_PAGE = null;
    public static String MODIFY_QUERY_INPUT_PAGE = null;
    public static String MODIFY_INPUT_PAGE = null;
    public static String DB_SELECTION_PAGE = null;

    public static String TASK_PARAM = null;
    public static String HANDLE_PARAM = null;
    public static String PASSWORD_PARAM = null;
    public static String DB_PARAM = null;
    public static String COMMAND_PARAM = null;
    public static String QUERY_PARAM = null;
    public static String INPUT_PARAM = null;
    public static String GROUP_PARAM = null;

    public static String LOGIN_TASK = null;

    public static void init(ServletConfig servletConfig) throws ServletException {
        
        QUERY_PACKAGE = servletConfig.getInitParameter("query_package");
        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        LOGIN_PAGE = servletConfig.getInitParameter("login_page");
        COMMAND_LIST_PAGE = servletConfig.getInitParameter("command_list_page");
        COMMAND_DETAIL_PAGE = servletConfig.getInitParameter("command_detail_page");
        QUERY_DETAIL_PAGE = servletConfig.getInitParameter("query_detail_page");
        MODIFY_GROUP_PAGE = servletConfig.getInitParameter("modify_group_page");
        MODIFY_COMMAND_PAGE = servletConfig.getInitParameter("modify_command_page");
        MODIFY_QUERY_PAGE = servletConfig.getInitParameter("modify_query_page");
        MODIFY_QUERY_INPUT_PAGE = servletConfig.getInitParameter("modify_query_input_page");
        MODIFY_INPUT_PAGE = servletConfig.getInitParameter("modify_input_page");
        DB_SELECTION_PAGE = servletConfig.getInitParameter("db_selection_page");

        TASK_PARAM = servletConfig.getInitParameter("task_param");
        HANDLE_PARAM = servletConfig.getInitParameter("handle_param");
        PASSWORD_PARAM = servletConfig.getInitParameter("password_param");
        DB_PARAM = servletConfig.getInitParameter("db_param");
        COMMAND_PARAM = servletConfig.getInitParameter("command_param");
        QUERY_PARAM = servletConfig.getInitParameter("query_param");
        INPUT_PARAM = servletConfig.getInitParameter("input_param");
        GROUP_PARAM = servletConfig.getInitParameter("group_param");

        LOGIN_TASK = servletConfig.getInitParameter("login_task");

    }
}

