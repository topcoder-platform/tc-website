/*
 * Copyright (c) 2012 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;

import java.io.PrintWriter;
import java.util.Map;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.CachedQueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.utilities.MemberAchievementUtility;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;

/**
 * <p>
 * This class is used as a REST service for retrieval of "Currently at" value for badge and user.
 * </p>
 *
 * @author TrePe
 * @version 1.0
 */
public class MemberAchievementCurrent extends Base {

    /**
     * <p>
     * SQL select for retrieving file name that contains sql for retrieval.
     * </p>
     */ 
    private final static String SQL_RETRIEVE_COUNT_SQL_FILE =
        "SELECT db_schema, user_achievement_count_sql_file FROM user_achievement_rule WHERE user_achievement_rule_id=";

    /**
     * <p>
     * Process the request of getting "currently at" value.
     * </p>
     */
    protected void businessProcessing() throws TCWebException {
        try {
            // user id
            if (!hasParameter("cr")) {
                throw new TCWebException("Invalid Coder ID");
            }
            // achievement rule id
            if (!hasParameter("ruleId")) {
                throw new TCWebException("Invalid Rule ID");
            }

            // validate the input parameters are numbers
            long coderId = Long.parseLong(getRequest().getParameter("cr"), 10);
            long ruleId = Long.parseLong(getRequest().getParameter("ruleId"), 10);

            // retrieve the sql file name and db_schema for ruleId through cached data access
            CachedQueryDataAccess dwaccess = new CachedQueryDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
            QueryRequest r = new QueryRequest();
            r.addQuery("sql_count_file_name", SQL_RETRIEVE_COUNT_SQL_FILE + ruleId);
            Map data = dwaccess.getData(r);
            ResultSetContainer rs = (ResultSetContainer) data.get("sql_count_file_name");
            if (rs.size() < 1) {
                throw new TCWebException("The achievement rule " + ruleId + " does not exist");
            }

            String fileName = rs.getStringItem(0, "user_achievement_count_sql_file");
            if (fileName == null || "".equals(fileName)) {
                throw new TCWebException("The achievement rule " + ruleId + 
                        " does not have user_achievement_count_sql_file specified");
            }
            String dbSchema = rs.getStringItem(0, "db_schema");
            if (dbSchema == null || "".equals(dbSchema)) {
                throw new TCWebException("The achievement rule " + ruleId + " does not have db_schema specified");
            }
            // validate dbSchema and map to web version of it
            if (MemberAchievementUtility.TCS_CATALOG.equals(dbSchema)) {
                dbSchema = DBMS.TCS_OLTP_DATASOURCE_NAME;
            } else if (MemberAchievementUtility.TCS_DW.equals(dbSchema)) {
                dbSchema = DBMS.TCS_DW_DATASOURCE_NAME;
            } else if (MemberAchievementUtility.TOPCODER_DW.equals(dbSchema)) {
                dbSchema = DBMS.DW_DATASOURCE_NAME;
            } else {
                throw new TCWebException("The achievement rule " + ruleId + " uses unknown db_schema " + dbSchema);
            }

            StringBuilder sb = 
                new StringBuilder(MemberAchievementUtility.readSQLFile(Constants.MEMBER_ACHIEVEMENT_CURRENT_SQL_PATH + fileName, false));

            // replace "@userId"
            int index = sb.indexOf("@userId");
            if (index >= 0) {
                sb.replace(index, index + 7, "" + coderId);
            } else {
                throw new TCWebException("The achievement rule's " + ruleId + 
                        " user_achievement_count_sql_file does not contain @userId");
            }

            // retrieve the "currently @" for the coderId through cached data access
            CachedQueryDataAccess daccess = new CachedQueryDataAccess(dbSchema);
            r = new QueryRequest();
            r.addQuery("currently_at", sb.toString());
            data = daccess.getData(r);
            rs = (ResultSetContainer) data.get("currently_at");
            if (rs.size() < 1) {
                throw new TCWebException("The achievement rule's " + ruleId + 
                        " user_achievement_count_sql_file returned no result");
            }
            String count = rs.getStringItem(0, "currently_at");
            if (count == null) {
                throw new TCWebException("The achievement rule's " + ruleId + 
                        " user_achievement_count_sql_file does not return currently_at");
            }

            // return the count to frontend as simple JSON or JSONP
            TCResponse response = getResponse();
            PrintWriter responseWriter = response.getWriter();

            String jsonpCallback = getRequest().getParameter("callback");
            if (jsonpCallback != null) { // send JSONP
                response.setContentType("application/javascript");
                responseWriter.write(jsonpCallback);
                responseWriter.write("(");
            } else { // send JSON
                response.setContentType("application/json");
            }
            responseWriter.write("{\"count\":" + count + "}");
            if (jsonpCallback != null) {
                responseWriter.write(");");
            }
            response.flushBuffer();

            setIsNextPageInContext(false);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
