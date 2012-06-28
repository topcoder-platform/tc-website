/*
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * This static class is used to provide common util methods for all the processors related to copilot. It's package
 * scope and only provides static utility methods.
 * </p>
 *
 * <p>
 * Thread-safety:This class is immutable and static, and does not have any internal state, so it's thread-safe.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
class CopilotRequestProcessorUtil {

    /**
     * Private constructor which prevents from initialization.
     */
    private CopilotRequestProcessorUtil() {
       // empty
    }

    /**
     * Gets a integer value from the request by specifying request name
     *
     * @param request the request
     * @param requestName the name of request parameter
     *
     * @return the integer value or null if the request does not contain the specified request parameter.
     */
    public static Integer getIntRequestValue(HttpServletRequest request, String requestName) {
        String value = request.getParameter(requestName);

        if (value == null) return null;

        int result = Integer.parseInt(value);

        return result;
    }


    /**
     * Gets a Long value from the request by specifying request name
     *
     * @param request the request
     * @param paramName the name of request parameter
     *
     * @return the Long value or null if the request does not contain the specified request parameter.
     */
    public static Long getLongRequestValue(HttpServletRequest request, String paramName) {
        String value = request.getParameter(paramName);

        if (value == null) return null;

        Long result = Long.parseLong(value);

        return result;
    }

    /**
     * Gets a map which stores the copilot's TopCoder handle, user id and TopCoder head image path by the given
     * copilot profile id.
     *
     * @param copilotProfileId the copilot profile id.
     * @return a map with copilot's information.
     * @throws Exception if any error occurs.
     */
    public static Map<String, String> getCopilotProfileInfo(long copilotProfileId) throws Exception {

        Request r = new Request();
        // command - copilot_profile
        r.setContentHandle("copilot_profile");
        r.setProperty("uid", String.valueOf(copilotProfileId));

        // query copilot_user_info with the specified user id
        ResultSetContainer result = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("copilot_profile_info");
        Map<String, String> info = new HashMap<String, String>();

        // Build the result map
        if (result.size() != 0) {
            if (result.getItem(0, "handle").getResultData() != null) {
                info.put("handle", result.getStringItem(0, "handle"));
            }

            if (result.getItem(0, "user_id").getResultData() != null) {
                info.put("userId", result.getStringItem(0, "user_id"));
            }

            if (result.getItem(0, "image_path").getResultData() != null) {
                info.put("imagePath", result.getStringItem(0, "image_path"));
            }
        }

        return info;
    }
    
    /**
     * Gets a map which stores the copilot's TopCoder handle, user id and TopCoder head image path by the given
     * copilot user id.
     *
     * @param userId the copilot profile id.
     * @return a map with copilot's information.
     * @throws Exception if any error occurs.
     */
    public static Map<String, String> getCopilotInfo(long userId) throws Exception {

        Request r = new Request();
        // command - copilot_profile
        r.setContentHandle("copilot_profile");
        r.setProperty("uid", String.valueOf(userId));

        // query copilot_user_info with the specified user id
        ResultSetContainer result = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("copilot_user_info");
        Map<String, String> info = new HashMap<String, String>();

        // Build the result map
        if (result.size() != 0) {
            if (result.getItem(0, "handle").getResultData() != null) {
                info.put("handle", result.getStringItem(0, "handle"));
            }

            if (result.getItem(0, "user_id").getResultData() != null) {
                info.put("userId", result.getStringItem(0, "user_id"));
            }

            if (result.getItem(0, "image_path").getResultData() != null) {
                info.put("imagePath", result.getStringItem(0, "image_path"));
            }
        }

        return info;
    }

    /**
     * Utility method to encode JSON data for the google visuallization charts.
     *
     * @param propertyNames the property names of the json.
     * @param data  the data used to generated.
     * @return the generated json string.
     */
    public static String encodeJsonData(String[] propertyNames, List<List<String>> data) {
        StringBuffer result = new StringBuffer();
        // json start
        result.append('[');

        int count = 0;

        for (List<String> row : data) {
            result.append('{');
            int i = 0;
            for (String value : row) {
                result.append(propertyNames[i]);
                result.append(":");
                result.append(value);
                if (i++ < row.size() - 1) {
                    result.append(',');
                }
            }
            result.append('}');
            if (count++ < data.size() - 1) {
                result.append(',');
            }
        }

        // json end
        result.append(']');

        return result.toString();
    }

}
