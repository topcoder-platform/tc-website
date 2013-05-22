/*
 * Copyright (c) 2010 - 2013 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
 * <p>
 *      Version 1.1 (TopCoder Copilot Profile Update) Change notes:
 *      <ol>
 *          <li>Retrieve is_software_copilot and is_studio_copilot data, using query tool.</li>
 *      </ol>
 * </p>
 *
 * <p>
 *     Version 1.2 (Module Assembly - TopCoder Copilot Feedback Integration)
 *     <ol>
 *          <li>Retrieve copilot_feedback data, using query tool.</li>
 *      </ol>
 * </p>
 *
 * <p>
 *     Version 1.3 (BUGR-8151)
 *     <ol>
 *         <li>Remove getCopilotProfileInfo(long copilotProfileId), it's duplicated for getCopilotInfo</li>
 *         <li>Updates method to use commandData as input to avoid getting command data multiple times</li>
 *     </ol>
 * </p>
 *
 * <p>
 *     Version 1.4 (Release Assembly - TopCoder Copilot Feedback Updates)
 *     <ul>
 *         <li>Adds copilot feedback ratings, 4 ratings are added. Existing old feedback still do not ratings</li>
 *     </ul>
 * </p>
 * 
 * @author GreatKevin
 * @version 1.4
 */
class CopilotRequestProcessorUtil {

    private static final DateFormat COPILOT_FEEDBACK_DATE_FORMAT = new SimpleDateFormat("MMMMM dd, yyyy");

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
     * copilot user id.
     *
     * @param commandData data returned from running copilot_profile command
     *
     * @return a map with copilot's information.
     * @throws Exception if any error occurs.
     */
    public static Map<String, String> getCopilotInfo(Map<String, ResultSetContainer> commandData) throws Exception {

        ResultSetContainer result = commandData.get("copilot_user_info");
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
            
            if (result.getItem(0, "is_software_copilot").getResultData() != null) {
                info.put("is_software_copilot", result.getStringItem(0, "is_software_copilot"));
            }
            
            if (result.getItem(0, "is_studio_copilot").getResultData() != null) {
                info.put("is_studio_copilot", result.getStringItem(0, "is_studio_copilot"));
            }
        }

        return info;
    }

    /**
     * Retrieves copilot feedback data via query tool
     *
     * @param commandData data returned from running copilot_profile command
     * @return the data in a list
     * @throws Exception if there is any error.
     * @since 1.2
     */
    public static List<Map<String, String>> getCopilotFeedback(Map<String, ResultSetContainer> commandData) throws Exception {

        ResultSetContainer result = commandData.get("copilot_feedback");

        List<Map<String, String>> feedbackData = new ArrayList<Map<String, String>>();
        Iterator<ResultSetContainer.ResultSetRow> itr = result.iterator();

        while(itr.hasNext()) {
            Map<String, String> feedback = new HashMap<String, String>();
            ResultSetContainer.ResultSetRow row = itr.next();

            feedback.put("submitDate", COPILOT_FEEDBACK_DATE_FORMAT.format(row.getTimestampItem("submit_date")));
            feedback.put("feedbackAnswer", row.getStringItem("answer").toLowerCase());
            feedback.put("feedbackText", row.getStringItem("text"));
            if(row.getItem("time_rating").getResultData() != null) {
                feedback.put("timeRating", row.getStringItem("time_rating"));
            }
            if(row.getItem("quality_rating").getResultData() != null) {
                feedback.put("qualityRating", row.getStringItem("quality_rating"));
            }
            if(row.getItem("communication_rating").getResultData() != null) {
                feedback.put("communicationRating", row.getStringItem("communication_rating"));
            }
            if(row.getItem("management_rating").getResultData() != null) {
                feedback.put("managementRating", row.getStringItem("management_rating"));
            }

            feedbackData.add(feedback);
        }

        return feedbackData;
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
