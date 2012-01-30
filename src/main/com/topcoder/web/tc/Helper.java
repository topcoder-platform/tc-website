/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.action.ContestServicesActionException;
import com.topcoder.web.tc.dto.BaseFilter;
import com.topcoder.web.tc.dto.BasePrizeFilter;
import com.topcoder.web.tc.dto.ContestStatusFilter;
import com.topcoder.web.tc.dto.DateIntervalSpecification;
import com.topcoder.web.tc.dto.DateIntervalType;
import com.topcoder.web.tc.dto.PastContestFilter;

/**
 * <p>
 * Helper class is used to check arguments. Should only be used in this
 * component.
 * </p>
 * <p>
 * Version 1.1 change notes:
 * <ul>
 * <li>Adds <code>getEDTTime(Date)</code> method to convert the time of the date
 * value to EDT time.</li>
 * </ul>
 * </p>
 * <p>
 * Version 1.2 change notes:
 * <ul>
 * <li>Adds {@link #getMemberProfileLink(long)} method to get the profile link for a coder.</li>
 * </ul>
 * </p>
 *
 * <p>
 * Changes in 1.3: Removed reference to subTypes in addFilterForSQL and parseJsonToBaseFilter methods.
 * </p>
 * 
 * <p>
 * Changes in 1.4: added rollingYear filter for PastContestFilter in method {@link #parseJsonToBaseFilter(BaseFilter)}.
 * </p>
 *
 * @author TCSDEVELOPER, pinoydream, bugbuka
 * @version 1.4
 */
public final class Helper {
    /**
     * <p>
     * Represent the date format pattern.
     * </p>
     */
    private static final String DATE_FORMAT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * <p>
     * Represents the light css styles for coder handles.
     * </p>
     */	 
    private static final String[] LIGHT_STYLES =
        {"coderTextOrange", "coderTextWhite", "coderTextGray",
            "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    /**
     * <p>
     * Represents the dark css styles for coder handles.
     * </p>
     */
    private static final String[] DARK_STYLES =
        {"coderTextOrange", "coderTextBlack", "coderTextGray",
            "coderTextGreen", "coderTextBlue", "coderTextYellow", "coderTextRed"};

    /**
     * <p>
     * Private constructor. Make sure no instance of this class will be created.
     * </p>
     */
    private Helper() {
        // Empty
    }

    /**
     * <p>
     * Throw IllegalArgumentException if the parameter is null.
     * </p>
     * 
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws IllegalArgumentException
     *             if the argument does not meet the request
     */
    public static void checkNotNull(String name, Object param) {
        if (param == null) {
            throw new IllegalArgumentException("The argument " + name
                    + " cannot be null.");
        }
    }

    /**
     * <p>
     * Throw IllegalArgumentException if the parameter is not positive or not
     * -1.
     * </p>
     * 
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws IllegalArgumentException
     *             if the argument does not meet the request
     */
    public static void checkPageNumberAndSize(String name, int param) {
        if (param <= 0 && param != -1) {
            throw new IllegalArgumentException("The argument " + name
                    + " must be positive or -1.");
        }
    }

    /**
     * <p>
     * Throw ContestServicesConfigurationException if the parameter is null.
     * </p>
     * 
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws ContestServicesConfigurationException
     *             if the argument does not meet the request
     */
    public static void checkNotNullForConfiguration(String name, Object param) {
        if (param == null) {
            throw new ContestServicesConfigurationException("The argument "
                    + name + " cannot be null.");
        }
    }

    /**
     * <p>
     * Throw ContestServicesConfigurationException if the parameter is negative.
     * </p>
     * 
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws ContestServicesConfigurationException
     *             if the argument does not meet the request
     */
    public static void checkNotNegativeForConfiguration(String name, long param) {
        if (param < 0) {
            throw new ContestServicesConfigurationException("The argument "
                    + name + " must be non-negative.");
        }
    }

    /**
     * <p>
     * Add the filter string for sql.
     * </p>
     * 
     * @param filter
     *            the filter
     * @param contestName
     *            the contest name
     * @return the sql string
     * @throws HibernateException
     *             if any error occurs
     */
    public static String addFilterForSQL(BaseFilter filter, String contestName) {
        String sql = "";

        // Add filter for types
        if (checkListNotNullAndNotEmpty(filter.getTypes())) {
            sql += addListToFilter("projectCategory.name",
                    filter.getTypes());
        }

        // Add filter for catalogs
        if (checkListNotNullAndNotEmpty(filter.getCatalogs())) {
            sql += Helper.addListToFilter("projectCatalog.name",
                    filter.getCatalogs());
        }

        // Add filter for contestName
        if (checkStringNotNullAndNotEmptyOfBoolean(filter.getContestName())) {
            sql += " AND projectNameInfo.value LIKE '%"
                    + filter.getContestName() + "%'";
        }

        // Add filter for registrationStartDate
        if (filter.getRegistrationStartDate() != null) {
            sql += addDateToFilter("registrationPhase.scheduledStartTime",
                    filter.getRegistrationStartDate());
        }

        // Add filter for submissionEndDate
        if (filter.getSubmissionEndDate() != null) {
            sql += addDateToFilter("submissionPhase.scheduledEndTime",
                    filter.getSubmissionEndDate());
        }

        // Add filter for contestFinalizationDate
        if (filter.getContestFinalizationDate() != null) {
            if ("ActiveContest".equals(contestName)) {
                sql += " and finalReviewPhase.phaseTypeId=:finalReviewPhaseTypeId";
                sql += addDateToFilter("finalReviewPhase.scheduledEndTime",
                        filter.getContestFinalizationDate());
            } else if ("PastContest".equals(contestName)) {
                sql += addDateToFilter("approvalPhase.actualEndTime",
                        filter.getContestFinalizationDate());
            } else if ("ContestStatus".equals(contestName)) {
                sql += addDateToFilter("finalReviewPhase.actualEndTime",
                        filter.getContestFinalizationDate());
            }
        }

        return sql;
    }

    /**
     * <p>
     * Add the order string for sql.
     * </p>
     * 
     * @param columnName
     *            the column name
     * @param sortingOrder
     *            the sorting order
     * @return the sql string
     */
    public static String addOrderForSQL(String columnName,
            SortingOrder sortingOrder) {
        String sql = "";
        if ((columnName != null && columnName.trim().length() != 0 && sortingOrder != null)) {
            sql += " order by " + columnName;
            if (sortingOrder == SortingOrder.ASCENDING) {
                sql += " asc ";
            } else {
                sql += " desc ";
            }
        }
        return sql;
    }

    /**
     * <p>
     * Add the page for query.
     * </p>
     * 
     * @param query
     *            the query
     * @param pageNumber
     *            the page number
     * @param pageSize
     *            the page size
     */
    public static void setPageForQuery(final Query query, int pageNumber,
            int pageSize) {
        if (pageNumber > 0 && pageSize > 0) {
            query.setMaxResults(pageSize);
            query.setFirstResult((pageNumber - 1) * pageSize);
        }
    }

    /**
     * <p>
     * Get the correct page for prize filter.
     * </p>
     * 
     * @param pageNumber
     *            the page number
     * @param pageSize
     *            the page size
     * @param list
     *            the list of dTO
     * @return the list of dTO
     */
    public static <T extends Object> List<T> getPageForPrize(int pageNumber,
            int pageSize, List<T> list) {
        // Get the correct page for prize filter
        int fromIndex = (pageNumber - 1) * pageSize;
        if (fromIndex > list.size()) {
            fromIndex = list.size();
        }
        int toIndex = fromIndex + pageSize;
        if (toIndex > (list.size())) {
            toIndex = list.size();
        }
        return list.subList(fromIndex, toIndex);

    }

    /**
     * <p>
     * Check the string whether be null or empty.
     * </p>
     * 
     * @param str
     *            the string to check
     * @return the string whether be null or empty
     */
    public static boolean checkStringNotNullAndNotEmptyOfBoolean(String str) {
        if (str != null && str.trim().length() != 0) {
            return true;
        }
        return false;
    }

    /**
     * <p>
     * Check the list whether be null or empty.
     * </p>
     * 
     * @param list
     *            the list to check
     * @return the list whether be null or empty
     */
    private static boolean checkListNotNullAndNotEmpty(List<String> list) {
        if (list != null && !list.isEmpty()) {
            return true;
        }
        return false;
    }

    /**
     * <p>
     * Add the List element to filter.
     * </p>
     * 
     * @param name
     *            the column name
     * @param list
     *            the list
     * @return the string need append to sql
     */
    private static String addListToFilter(String name, List<String> list) {
        StringBuffer sb = new StringBuffer();
        sb.append(" AND ");
        sb.append(name);
        sb.append(" IN ('");
        int n = list.size() - 1;
        for (int i = 0; i < n; i++) {
            sb.append(list.get(i));
            sb.append("', '");
        }
        sb.append(list.get(n));
        sb.append("')");
        return sb.toString();
    }

    /**
     * <p>
     * Add the DateIntervalSpecification element to filter.
     * </p>
     * 
     * @param name
     *            the column name
     * @param dateInterval
     *            the DateIntervalSpecification instance
     * @return the string need append to sql
     * @throws HibernateException
     *             if any error occurs
     */
    private static String addDateToFilter(String name,
            DateIntervalSpecification dateInterval) {
        if (dateInterval.getIntervalType() == null) {
            throw new HibernateException(
                    "The dateInterval.IntervalType can not be null.");
        }
        StringBuffer sb = new StringBuffer();
        sb.append(" AND ");
        sb.append(name);
        if (dateInterval.getIntervalType() == DateIntervalType.BEFORE) {
            sb.append(" < '");
            sb.append(dateToString(DateIntervalType.BEFORE.toString(),
                    dateInterval.getFirstDate()));
            sb.append("'");
        } else if (dateInterval.getIntervalType() == DateIntervalType.AFTER) {
            sb.append(" > '");
            sb.append(dateToString(DateIntervalType.AFTER.toString(),
                    dateInterval.getFirstDate()));
            sb.append("'");
        } else if (dateInterval.getIntervalType() == DateIntervalType.ON) {
            sb.append(" = '");
            sb.append(dateToString(DateIntervalType.ON.toString(),
                    dateInterval.getFirstDate()));
            sb.append("'");
        } else if (dateInterval.getIntervalType() == DateIntervalType.BETWEEN_DATES) {
            sb.append(" BETWEEN '");
            sb.append(dateToString(DateIntervalType.BETWEEN_DATES.toString(),
                    dateInterval.getFirstDate()));
            sb.append("' AND '");
            sb.append(dateToString(DateIntervalType.BETWEEN_DATES.toString(),
                    dateInterval.getSecondDate()));
            sb.append("'");
        } else if (dateInterval.getIntervalType() == DateIntervalType.BEFORE_CURRENT_DATE) {
            sb.append(" < CURRENT");
        } else if (dateInterval.getIntervalType() == DateIntervalType.AFTER_CURRENT_DATE) {
            sb.append(" > CURRENT");
        }

        return sb.toString();
    }

    /**
     * <p>
     * Transfer the date to string.
     * </p>
     * 
     * @param date
     *            the date
     * @param name
     *            the name
     * @return the string of date
     * @throws HibernateException
     *             if any error occurs
     */
    private static String dateToString(String name, Date date) {
        if (date == null) {
            throw new HibernateException("The date with " + name
                    + " can not be null.");
        }
        SimpleDateFormat df = new SimpleDateFormat(DATE_FORMAT_PATTERN);
        return df.format(date);
    }

    /**
     * <p>
     * Parse the parameters from json object.
     * </p>
     * 
     * @param jsonObject
     *            the json object
     * @return the parameters map
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    public static Map<String, Object> parseJsonToParam(JSONObject jsonObject)
            throws ContestServicesActionException {
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("columnName", getStringFromJson(jsonObject, "columnName"));
            String order = getStringFromJson(jsonObject, "sortingOrder");
            if (order != null) {
                map.put("sortingOrder", SortingOrder.valueOf(order));
            }

            map.put("pageNumber", getIntFromJson(jsonObject, "pageNumber"));
            map.put("pageSize", getIntFromJson(jsonObject, "pageSize"));
            return map;
        } catch (NumberFormatException e) {
            throw new ContestServicesActionException(
                    "pageNumber or pageSize in JSON is invalid number.", e);
        } catch (IllegalArgumentException e) {
            throw new ContestServicesActionException(
                    "sortingOrder in JSON is invalid.", e);
        }
    }

    /**
     * <p>
     * Parse the json to filter
     * </p>
     * 
     * @param filter
     *            the filter
     * @param jsonObject
     *            the json object
     * @param dateFormat
     *            the date format string
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    public static List<String> parseJsonToBaseFilter(BaseFilter filter,
            JSONObject jsonObject, String dateFormat)
            throws ContestServicesActionException {
        ArrayList<String> errors = new ArrayList<String>();
        try {
            if (jsonObject.isNestedKeyDefined("filter")) {
                JSONObject jsonFilter = jsonObject.getNestedObject("filter");
                filter.setTypes(getListFromJson(jsonFilter, "types"));
                filter.setCatalogs(getListFromJson(jsonFilter, "catalogs"));
                filter.setContestName(getStringFromJson(jsonFilter,
                        "contestName"));

                filter.setRegistrationStartDate(getDateIntervalFromJson(
                        jsonFilter, "registrationStartDate", dateFormat, errors));
                filter.setSubmissionEndDate(getDateIntervalFromJson(jsonFilter,
                        "submissionEndDate", dateFormat, errors));
                filter.setContestFinalizationDate(getDateIntervalFromJson(
                        jsonFilter, "contestFinalizationDate", dateFormat,
                        errors));

                if (filter instanceof BasePrizeFilter) {
                    BasePrizeFilter basePrizeFilter = (BasePrizeFilter) filter;
                    basePrizeFilter.setPrizeLowerBound(getIntFromJson(
                            jsonFilter, "prizeLowerBound"));
                    basePrizeFilter.setPrizeUpperBound(getIntFromJson(
                            jsonFilter, "prizeUpperBound"));
                    if (basePrizeFilter.getPrizeLowerBound() > basePrizeFilter
                            .getPrizeUpperBound()) {
                        errors.add("The lower bound of the prize cannot be greater than the upper bound.");
                    }
                }

                if (filter instanceof PastContestFilter) {
                    ((PastContestFilter) filter)
                            .setWinnerHandle(getStringFromJson(jsonFilter,
                                    "winnerHandle"));
                    ((PastContestFilter) filter)
                    .setRollingYear(getStringFromJson(jsonFilter,
                            "rollingYear"));
                }
                if (filter instanceof ContestStatusFilter) {
                    ((ContestStatusFilter) filter)
                            .setWinnerHandle(getStringFromJson(jsonFilter,
                                    "winnerHandle"));
                }
            }
        } catch (NumberFormatException e) {
            errors.add("The lower bound or the upper bound of the prize is an invalid number.");
        }
        return errors;
    }

    /**
     * <p>
     * Get the string from json object.
     * </p>
     * 
     * @param jsonObject
     *            the json object
     * @param key
     *            the key name
     * @return the string
     */
    private static String getStringFromJson(JSONObject jsonObject, String key) {
        if (jsonObject.isKeyDefined(key) && jsonObject.isAvailableAsString(key)) {
            return jsonObject.getString(key);
        }

        return null;
    }

    /**
     * <p>
     * Get the integer from json object.
     * </p>
     * 
     * @param jsonObject
     *            the json object
     * @param key
     *            the key name
     * @return the integer
     * @exception NumberFormatException
     *                if the <code>String</code> does not contain a parsable
     *                integer.
     */
    private static int getIntFromJson(JSONObject jsonObject, String key) {
        if (jsonObject.isKeyDefined(key)) {
            if (jsonObject.isAvailableAsInt(key)) {
                return jsonObject.getInt(key);
            } else if (jsonObject.isAvailableAsString(key)) {
                return new Integer(jsonObject.getString(key));
            }
        }

        return -1;
    }

    /**
     * <p>
     * Get the list from json object.
     * </p>
     * 
     * @param jsonObject
     *            the json object
     * @param key
     *            the key name
     * @return the list
     */
    private static List<String> getListFromJson(JSONObject jsonObject,
            String key) {
        if (jsonObject.isKeyDefined(key) && jsonObject.isAvailableAsArray(key)) {
            List<String> result = new ArrayList<String>();
            JSONArray array = jsonObject.getArray(key);
            for (int i = 0; i < array.getSize(); i++) {
                if (array.isAvailableAsString(i)) {
                    result.add(array.getString(i));
                }
            }
            return result;
        }

        return null;
    }

    /**
     * <p>
     * Get the date interval from json object.
     * </p>
     * 
     * @param jsonObject
     *            the json object
     * @param key
     *            the key name
     * @param errors
     *            the error list.
     * @return the date interval
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    private static DateIntervalSpecification getDateIntervalFromJson(
            JSONObject jsonObject, String key, String dateFormat,
            List<String> errors) throws ContestServicesActionException {
        try {
            if (jsonObject.isKeyDefined(key)
                    && jsonObject.isNestedKeyDefined(key)) {
                DateIntervalSpecification result = new DateIntervalSpecification();
                JSONObject jObj = jsonObject.getNestedObject(key);
                String type = getStringFromJson(jObj, "intervalType");
                if (type == null) {
                    errors.add(key + "'s intervalType in JSON can not be null.");
                }
                DateIntervalType intervalType = null;
                try {
                    intervalType = DateIntervalType.valueOf(type);
                    result.setIntervalType(intervalType);
                } catch (IllegalArgumentException e) {
                    throw new ContestServicesActionException(key
                            + "'s intervalType in JSON is invalid.", e);
                }

                SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
                String firstDate = getStringFromJson(jObj, "firstDate");
                if (intervalType == DateIntervalType.AFTER
                        || intervalType == DateIntervalType.BEFORE
                        || intervalType == DateIntervalType.ON
                        || intervalType == DateIntervalType.BETWEEN_DATES) {
                    if (firstDate == null) {
                        throw new ContestServicesActionException(key
                                + "'s type is " + intervalType
                                + ", start date in JSON can not be null.");
                    }
                    result.setFirstDate(sdf.parse(firstDate));
                }
                String secondDate = getStringFromJson(jObj, "secondDate");
                if (intervalType == DateIntervalType.BETWEEN_DATES) {
                    if (secondDate == null) {
                        errors.add(key
                                + "'s type is BETWEEN_DATES, end date in JSON can not be null.");
                    }
                    result.setSecondDate(sdf.parse(secondDate));
                    if (!result.getFirstDate().before(result.getSecondDate())) {
                        errors.add("The start date of the '" + key
                                + "' cannot be later than the end date.");
                    }
                }

                return result;
            }
        } catch (IllegalArgumentException e) {
            throw new ContestServicesActionException("dateFormat[" + dateFormat
                    + "] in instance is invalid.", e);
        } catch (ParseException e) {
            errors.add("The input date is invalid.");
        }

        return null;
    }

    /**
     * <p>
     * Logs for entrance into public methods at <code>DEBUG</code> level.
     * </p>
     * 
     * @param logger
     *            The logger object.
     * @param signature
     *            The signature of the method to be logged.
     * @param paramNames
     *            The names of parameters to log.
     * @param params
     *            The values of parameters to log.
     */
    public static void logEntrance(Logger logger, String signature,
            String[] paramNames, Object[] params) {
        logger.debug("[Entering the method {" + signature + "}]");

        if (paramNames != null && params != null) {
            logger.debug(parametersToString(paramNames, params));
        }
    }

    /**
     * <p>
     * Logs for exit into public methods at <code>DEBUG</code> level.
     * </p>
     * 
     * @param logger
     *            The logger object.
     * @param signature
     *            The signature of the method to be logged.
     * @param startTime
     *            The start time of entering method
     * @param outputResult
     *            the output result
     */
    public static void logExit(Logger logger, String signature, long startTime,
            Object outputResult) {
        long endTime = System.currentTimeMillis();
        logger.debug("[Exiting the method {" + signature
                + "}.  Time of execution {" + (endTime - startTime) + "ms}]");

        if (outputResult != null) {
            logger.debug("[Return result {" + outputResult + "}]");
        }
    }

    /**
     * <p>
     * Logs the given exception and message at <code>ERROR</code> level.
     * </p>
     * 
     * @param <T>
     *            the throwable exception
     * @param logger
     *            The logger object
     * @param exception
     *            The exception to log
     * @param method
     *            the method name
     * @return the exception
     */
    public static <T extends Throwable> T logException(Logger logger,
            T exception, String method) {
        // Log exception at ERROR level
        logger.error(
                "[Error in method {" + method + "}: Details {"
                        + exception.getMessage() + "}]", exception);
        return exception;
    }

    /**
     * Converts to time of the date to EDT time.
     * 
     * @param date
     *            the date value.
     * @return the converted date.
     */
    public static Date getEDTTime(Date date) {
        try {
            SimpleDateFormat format1 = new SimpleDateFormat();
            format1.setTimeZone(TimeZone.getDefault());
            SimpleDateFormat format2 = new SimpleDateFormat();
            format2.setTimeZone(TimeZone.getTimeZone("EST5EDT"));
            String dateStr = format1.format(date);
            return format2.parse(dateStr);
        } catch (ParseException ex) {
            return date;
        }
    }

    /**
     * <p>
     * Transfer the parameters to String.
     * </p>
     * 
     * @param paramNames
     *            The names of parameters to log.
     * @param params
     *            The values of parameters to log.
     * @return the parameter string
     */
    private static String parametersToString(String[] paramNames,
            Object[] params) {
        StringBuffer sb = new StringBuffer("[Input parameters: {");

        for (int i = 0; i < params.length; i++) {
            if (i > 0) {
                // Append a comma
                sb.append(", ");
            }
            sb.append(paramNames[i] + ":" + String.valueOf(params[i]));
        }
        sb.append("}]");

        return sb.toString();
    }
    
    /**
     * <p>
     * Gets the profile link for a coder.
     * </p>
     *
     * @param coderId the id of the coder.
     * @return the profile link of the coder.
     * @throws Exception if any error occurs.
     */	 
    public static String getMemberProfileLink(long coderId) throws Exception {
        return HandleTag.getLink(coderId, null, null, null, null, LIGHT_STYLES, DARK_STYLES, false);
    }
}
