package com.topcoder.web.query.common;

import com.topcoder.web.query.bean.DatabaseBean;

import javax.servlet.ServletConfig;
import java.util.ArrayList;

/**
 * Constants for the query tool
 * @author Greg Paul
 */
public class Constants {

    public static String QUERY_PACKAGE;

    public static String ERROR_PAGE;
    public static String LOGIN_PAGE;
    public static String DB_SELECTION_PAGE;
    public static String COMMAND_LIST_PAGE;
    public static String QUERY_LIST_PAGE;
    public static String COMMAND_DETAIL_PAGE;
    public static String QUERY_DETAIL_PAGE;
    public static String MODIFY_GROUP_PAGE;
    public static String MODIFY_COMMAND_PAGE;
    public static String MODIFY_QUERY_PAGE;
    public static String MODIFY_QUERY_INPUT_PAGE;
    public static String MODIFY_INPUT_PAGE;
    public static String MODIFY_COMMAND_QUERY_PAGE;
    public static String QUERY_SEARCH_PAGE;

    public static String TASK_PARAM;
    public static String STEP_PARAM;
    public static String HANDLE_PARAM;
    public static String PASSWORD_PARAM;
    public static String DB_PARAM;
    public static String COMMAND_ID_PARAM;
    public static String QUERY_ID_PARAM;
    public static String INPUT_ID_PARAM;
    public static String GROUP_ID_PARAM;
    public static String COMMAND_DESC_PARAM;
    public static String QUERY_NAME_PARAM;
    public static String COLUMN_INDEX_PARAM;
    public static String QUERY_TEXT_PARAM;
    public static String INPUT_CODE_PARAM;
    public static String INPUT_DESC_PARAM;
    public static String DATA_TYPE_ID_PARAM;
    public static String GROUP_DESC_PARAM;
    public static String OPTIONAL_PARAM;
    public static String DEFAULT_VALUE_PARAM;
    public static String SORT_ORDER_PARAM;
    public static String RANKING_PARAM;
    public static String SERVLET_PATH_PARAM;
    public static String SEARCH_CRITERIA_PARAM;

    public static String LOGIN_TASK;
    public static String DB_SELECTION_TASK;
    public static String COMMAND_LIST_TASK;
    public static String QUERY_LIST_TASK;
    public static String COMMAND_DETAIL_TASK;
    public static String QUERY_DETAIL_TASK;
    public static String MODIFY_GROUP_TASK;
    public static String MODIFY_COMMAND_TASK;
    public static String MODIFY_QUERY_TASK;
    public static String MODIFY_QUERY_INPUT_TASK;
    public static String MODIFY_INPUT_TASK;
    public static String MODIFY_COMMAND_QUERY_TASK;
    public static String QUERY_SEARCH_TASK;

    public static String LOGIN_NAME;
    public static String DB_SELECTION_NAME;
    public static String COMMAND_LIST_NAME;
    public static String QUERY_LIST_NAME;
    public static String COMMAND_DETAIL_NAME;
    public static String QUERY_DETAIL_NAME;
    public static String MODIFY_GROUP_NAME;
    public static String MODIFY_COMMAND_NAME;
    public static String MODIFY_QUERY_NAME;
    public static String MODIFY_QUERY_INPUT_NAME;
    public static String MODIFY_INPUT_NAME;
    public static String MODIFY_COMMAND_QUERY_NAME;
    public static String QUERY_SEARCH_NAME;

    public static String NEW_STEP;
    public static String SAVE_STEP;
    public static String REMOVE_STEP;

    public static ArrayList DB_LIST;

    /* hard coding these two because they are not well defined in the db
     * and are hard coded in the query runners
     */
    public static int[] DATA_TYPE_IDS = {1001, 1002, 1003, 1004, 1005};
    public static String[] DATA_TYPE_DESCS = {"Integer Input", "Decimal Input", "Date Input", "Sort Direction", "String"};


    public static void init(ServletConfig servletConfig) {

        QUERY_PACKAGE = servletConfig.getInitParameter("query_package");

        ERROR_PAGE = servletConfig.getInitParameter("error_page");
        LOGIN_PAGE = servletConfig.getInitParameter("login_page");
        DB_SELECTION_PAGE = servletConfig.getInitParameter("db_selection_page");
        COMMAND_LIST_PAGE = servletConfig.getInitParameter("command_list_page");
        QUERY_LIST_PAGE = servletConfig.getInitParameter("query_list_page");
        COMMAND_DETAIL_PAGE = servletConfig.getInitParameter("command_detail_page");
        QUERY_DETAIL_PAGE = servletConfig.getInitParameter("query_detail_page");
        MODIFY_GROUP_PAGE = servletConfig.getInitParameter("modify_group_page");
        MODIFY_COMMAND_PAGE = servletConfig.getInitParameter("modify_command_page");
        MODIFY_QUERY_PAGE = servletConfig.getInitParameter("modify_query_page");
        MODIFY_QUERY_INPUT_PAGE = servletConfig.getInitParameter("modify_query_input_page");
        MODIFY_INPUT_PAGE = servletConfig.getInitParameter("modify_input_page");
        MODIFY_COMMAND_QUERY_PAGE = servletConfig.getInitParameter("modify_command_query_page");
        QUERY_SEARCH_PAGE = servletConfig.getInitParameter("query_search_page");

        TASK_PARAM = servletConfig.getInitParameter("module_key");
        STEP_PARAM = servletConfig.getInitParameter("step_param");
        HANDLE_PARAM = servletConfig.getInitParameter("handle_param");
        PASSWORD_PARAM = servletConfig.getInitParameter("password_param");
        DB_PARAM = servletConfig.getInitParameter("db_param");
        COMMAND_ID_PARAM = servletConfig.getInitParameter("command_id_param");
        QUERY_ID_PARAM = servletConfig.getInitParameter("query_id_param");
        INPUT_ID_PARAM = servletConfig.getInitParameter("input_id_param");
        GROUP_ID_PARAM = servletConfig.getInitParameter("group_id_param");
        COMMAND_DESC_PARAM = servletConfig.getInitParameter("command_desc_param");
        QUERY_NAME_PARAM = servletConfig.getInitParameter("query_name_param");
        COLUMN_INDEX_PARAM = servletConfig.getInitParameter("column_index_param");
        QUERY_TEXT_PARAM = servletConfig.getInitParameter("query_text_param");
        INPUT_CODE_PARAM = servletConfig.getInitParameter("input_code_param");
        INPUT_DESC_PARAM = servletConfig.getInitParameter("input_desc_param");
        DATA_TYPE_ID_PARAM = servletConfig.getInitParameter("data_type_id_param");
        GROUP_DESC_PARAM = servletConfig.getInitParameter("group_desc_param");
        OPTIONAL_PARAM = servletConfig.getInitParameter("optional_param");
        DEFAULT_VALUE_PARAM = servletConfig.getInitParameter("default_value_param");
        SORT_ORDER_PARAM = servletConfig.getInitParameter("sort_order_param");
        RANKING_PARAM = servletConfig.getInitParameter("ranking_param");
        SERVLET_PATH_PARAM = servletConfig.getInitParameter("servlet_path_param");
        SEARCH_CRITERIA_PARAM = servletConfig.getInitParameter("search_criteria_param");

        LOGIN_TASK = servletConfig.getInitParameter("login_task");
        DB_SELECTION_TASK = servletConfig.getInitParameter("db_selection_task");
        COMMAND_LIST_TASK = servletConfig.getInitParameter("command_list_task");
        QUERY_LIST_TASK = servletConfig.getInitParameter("query_list_task");
        COMMAND_DETAIL_TASK = servletConfig.getInitParameter("command_detail_task");
        QUERY_DETAIL_TASK = servletConfig.getInitParameter("query_detail_task");
        MODIFY_GROUP_TASK = servletConfig.getInitParameter("modify_group_task");
        MODIFY_COMMAND_TASK = servletConfig.getInitParameter("modify_command_task");
        MODIFY_QUERY_TASK = servletConfig.getInitParameter("modify_query_task");
        MODIFY_QUERY_INPUT_TASK = servletConfig.getInitParameter("modify_query_input_task");
        MODIFY_INPUT_TASK = servletConfig.getInitParameter("modify_input_task");
        MODIFY_COMMAND_QUERY_TASK = servletConfig.getInitParameter("modify_command_query_task");
        QUERY_SEARCH_TASK = servletConfig.getInitParameter("query_search_task");

        LOGIN_NAME = servletConfig.getInitParameter("login_name");
        DB_SELECTION_NAME = servletConfig.getInitParameter("db_selection_name");
        COMMAND_LIST_NAME = servletConfig.getInitParameter("command_list_name");
        QUERY_LIST_NAME = servletConfig.getInitParameter("query_list_name");
        COMMAND_DETAIL_NAME = servletConfig.getInitParameter("command_detail_name");
        QUERY_DETAIL_NAME = servletConfig.getInitParameter("query_detail_name");
        MODIFY_GROUP_NAME = servletConfig.getInitParameter("modify_group_name");
        MODIFY_COMMAND_NAME = servletConfig.getInitParameter("modify_command_name");
        MODIFY_QUERY_NAME = servletConfig.getInitParameter("modify_query_name");
        MODIFY_QUERY_INPUT_NAME = servletConfig.getInitParameter("modify_query_input_name");
        MODIFY_INPUT_NAME = servletConfig.getInitParameter("modify_input_name");
        MODIFY_COMMAND_QUERY_NAME = servletConfig.getInitParameter("modify_command_query_name");
        QUERY_SEARCH_NAME = servletConfig.getInitParameter("query_search_name");

        NEW_STEP = servletConfig.getInitParameter("new_step");
        SAVE_STEP = servletConfig.getInitParameter("save_step");
        REMOVE_STEP = servletConfig.getInitParameter("remove_step");

        DB_LIST = new ArrayList();
        DB_LIST.add(new DatabaseBean("DW", "Data Warehouse"));
        DB_LIST.add(new DatabaseBean("OLTP", "Transactional"));
        DB_LIST.add(new DatabaseBean("TCS_CATALOG", "TCS Catalog"));
        DB_LIST.add(new DatabaseBean("TCS_DW", "TCS Warehouse"));
        DB_LIST.add(new DatabaseBean("CORP_DS", "Corporate"));
        DB_LIST.add(new DatabaseBean("SCREENING_OLTP", "Screening"));
        DB_LIST.add(new DatabaseBean("GOOGLE_OLTP", "Google"));
        DB_LIST.add(new DatabaseBean("GOOGLE_DW", "Google DW"));
        DB_LIST.add(new DatabaseBean("GOOGLE_INDIA_OLTP", "Google India"));
        DB_LIST.add(new DatabaseBean("GOOGLE_INDIA_DW", "Google India DW"));
    }

}

