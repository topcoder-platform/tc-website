/*
 * Copyright (c) 2012 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;

import java.io.PrintWriter;
import java.util.Map;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.CachedQueryDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.utilities.MemberAchievementUtility;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;

/**
 * <p>
 * This class is used as a REST service for retrieval of "Currently at" value for badge (ruleId) and user (cr).
 * Returns JSON or JSONP (if GET parameter "callback" is specified) in the form
 * <pre>{"count":123}</pre>
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
    private final static String SQL_RETRIEVE_COUNT_QUERY =
        "SELECT db_schema, user_achievement_count_query FROM user_achievement_rule WHERE user_achievement_rule_id=";

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
            QueryRequest qr = new QueryRequest();
            qr.addQuery("sql_count_query", SQL_RETRIEVE_COUNT_QUERY + ruleId);
            Map data = dwaccess.getData(qr);
            ResultSetContainer rs = (ResultSetContainer) data.get("sql_count_query");
            if (rs.size() < 1) {
                throw new TCWebException("The achievement rule " + ruleId + " does not exist");
            }

            String queryName = rs.getStringItem(0, "user_achievement_count_query");
            if (queryName == null || "".equals(queryName)) {
                throw new TCWebException("The achievement rule " + ruleId + 
                        " does not have user_achievement_count_query specified");
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

            // retrieve the "currently @" for the coderId through cached data access
            DataAccessInt dAccess = new CachedDataAccess(dbSchema);
            Request r = new Request();
            r.setContentHandle("coder_achievements");
            r.setProperty("cr", String.valueOf(coderId));
            Map m = dAccess.getData(r);
            rs = (ResultSetContainer) m.get(queryName);
            if (rs == null) {
                throw new TCWebException("The achievement rule " + ruleId + 
                        " does not have query " + queryName + " in Query Tool");
            }
            if (rs.size() < 1) {
                throw new TCWebException("The achievement rule's " + ruleId + 
                        " " + queryName + " returned no result");
            }
            String count = rs.getStringItem(0, "currently_at");
            if (count == null) {
                throw new TCWebException("The achievement rule's " + ruleId + 
                        " " + queryName + " does not return currently_at");
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
