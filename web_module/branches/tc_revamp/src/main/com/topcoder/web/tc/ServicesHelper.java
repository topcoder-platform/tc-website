/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.util.errorhandling.BaseException;
import com.topcoder.web.tc.action.ContestServicesActionException;
import com.topcoder.web.tc.dto.AbstractContestsFilter;
import com.topcoder.web.tc.dto.ContestsFilter;
import com.topcoder.web.tc.dto.DateIntervalSpecification;
import com.topcoder.web.tc.dto.DateIntervalType;
import com.topcoder.web.tc.dto.Filterable;
import com.topcoder.web.tc.dto.ReviewOpportunitiesFilter;
import com.topcoder.web.tc.dto.UpcomingContestsFilter;

/**
 * <p>
 * This is a helper classes used in this component.
 * </p>
 * <p>
 * The class is thread safe because it's immutable.
 * </p>
 * 
 * @author duxiaoyang
 * @version 1.0
 */
public final class ServicesHelper {

    /**
     * <p>
     * Private default constructor makes this class not instantiable.
     * </p>
     */
    private ServicesHelper() {
    }

    /**
     * <p>
     * Checks the validity of an integer parameter. If the parameter is not
     * positive or -1, IllegalArgumentException will be logged and thrown.
     * </p>
     * 
     * @param param
     *            the parameter to check.
     * @param paramName
     *            the name of the parameter.
     * @param signature
     *            the signature of the method to which the parameter is passed.
     * @param logger
     *            the logger used to log information.
     * @throws IllegalArgumentException
     *             if the given parameter is not positive or -1.
     */
    public static void checkNumber(int param, String paramName,
            String signature, Logger logger) {
        if (param <= 0 && param != -1) {
            throw Log4jUtility.logException(logger, signature,
                    new IllegalArgumentException(paramName
                            + " cannot be zero or negative (except -1)."));
        }
    }

    /**
     * <p>
     * Checks the validity of a string parameter. If the parameter is null or
     * empty, IllegalArgumentException will be logged and thrown.
     * </p>
     * 
     * @param param
     *            the parameter to check.
     * @param paramName
     *            the name of the parameter.
     * @param signature
     *            the signature of the method to which the parameter is passed.
     * @param logger
     *            the logger used to log information.
     * @throws IllegalArgumentException
     *             if the given parameter is null or empty.
     */
    public static void checkString(String param, String paramName,
            String signature, Logger logger) {
        checkObject(param, paramName, signature, logger);
        if (param.trim().length() == 0) {
            throw Log4jUtility.logException(logger, signature,
                    new IllegalArgumentException(paramName
                            + " cannot be empty string."));
        }
    }

    /**
     * <p>
     * Checks the validity of an object parameter. If the parameter is null,
     * IllegalArgumentException will be logged and thrown.
     * </p>
     * 
     * @param param
     *            the parameter to check.
     * @param paramName
     *            the name of the parameter.
     * @param signature
     *            the signature of the method to which the parameter is passed.
     * @param logger
     *            the logger used to log information.
     * @throws IllegalArgumentException
     *             if the given parameter is null.
     */
    public static void checkObject(Object param, String paramName,
            String signature, Logger logger) {
        if (param == null) {
            throw Log4jUtility
                    .logException(logger, signature,
                            new IllegalArgumentException(paramName
                                    + " cannot be null."));
        }
    }

    /**
     * <p>
     * Checks the validity of an object configuration. If the configuration is
     * null, ContestServicesConfigurationException will be logged and thrown.
     * </p>
     * 
     * @param config
     *            the configuration to check.
     * @param configName
     *            the name of the configuration.
     * @throws ContestServicesConfigurationException
     *             if the given parameter is null.
     */
    public static void checkConfigObject(Object config, String configName)
            throws ContestServicesConfigurationException {
        if (config == null) {
            throw new ContestServicesConfigurationException(configName
                    + " is not set.");
        }
    }

    /**
     * <p>
     * Logs an exception if it is not logged.
     * </p>
     * 
     * @param <T>
     *            the type of the exception to log.
     * @param exception
     *            the exception to log.
     * @param signature
     *            the signature of the method from which the exception is
     *            thrown.
     * @param logger
     *            the logger used to log information.
     * @return the exception itself, with logged flag set.
     */
    public static <T extends BaseException> T logException(Logger logger,
            String signature, T exception) {
        if (!exception.isLogged()) {
            Log4jUtility.logException(logger, signature, exception);
            exception.setLogged(true);
        }
        return exception;
    }

    /**
     * <p>
     * Gets the pagination parameters from JSON object. It will retrieve
     * columnName, sortingOrder, pageNumber, and pageSize from the given JSON
     * object.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the pagination parameters will be
     *            retrieved.
     * @return a map containing pagination parameters retrieved from given JSON
     *         object.
     * @throws ContestServicesActionException
     *             if JSON object contains invalid value for pagination
     *             parameters.
     */
    public static Map<String, Object> getParamFromJson(JSONObject jsonObject)
            throws ContestServicesActionException {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("columnName", getStringFromJson(jsonObject, "columnName"));
        params.put("sortingOrder",
                getEnumFromJson(jsonObject, "sortingOrder", SortingOrder.class));
        params.put("pageNumber", getIntegerFromJson(jsonObject, "pageNumber"));
        params.put("pageSize", getIntegerFromJson(jsonObject, "pageSize"));

        return params;
    }

    /**
     * <p>
     * Sets fields into the given filter. It will set type, subtype, catalog,
     * registrationStart, and submissionEnd for the filter, as well as specific
     * filter fields depending on the type of the filter.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which filter value will be retrieved.
     * @param filter
     *            the filter to set.
     * @param dateFormat
     *            the format of the date fields.
     * @throws ContestServicesActionException
     *             if JSON object contains invalid value for date field.
     */
    public static List<String> setFilterFields(JSONObject jsonObject,
            AbstractContestsFilter filter, String dateFormat)
            throws ContestServicesActionException {
        ArrayList<String> errors = new ArrayList<String>();
        if (jsonObject.isNestedKeyDefined("filter")) {
            JSONObject jsonFilter = jsonObject.getNestedObject("filter");
            // set fields available for all filters
            filter.setContestName(getStringFromJson(jsonFilter, "contestName"));
            filter.setType(getStringListFromJson(jsonFilter, "types"));
            filter.setSubtype(getStringListFromJson(jsonFilter, "subTypes"));
            filter.setCatalog(getStringListFromJson(jsonFilter, "catalogs"));
            filter.setRegistrationStart(getDateIntervalFromJson(jsonFilter,
                    "registrationStartDate", dateFormat, errors));
            filter.setSubmissionEnd(getDateIntervalFromJson(jsonFilter,
                    "submissionEndDate", dateFormat, errors));

            // set fields for specific filters
            if (filter instanceof ReviewOpportunitiesFilter) {
                ReviewOpportunitiesFilter roFilter = (ReviewOpportunitiesFilter) filter;
                try {
                    roFilter.setPaymentStart(ServicesHelper.getIntegerFromJson(
                            jsonFilter, "paymentStart"));
                    roFilter.setPaymentEnd(ServicesHelper.getIntegerFromJson(
                            jsonFilter, "paymentEnd"));
                    if (roFilter.getPaymentStart() > roFilter.getPaymentEnd()) {
                        errors.add("The lower bound of the payment cannot be greater than the upper bound.");
                    }
                } catch (ContestServicesActionException ex) {
                    errors.add(ex.getMessage());
                }
                roFilter.setReviewEndDate(ServicesHelper
                        .getDateIntervalFromJson(jsonFilter, "reviewEndDate",
                                dateFormat, errors));
            } else if (filter instanceof ContestsFilter) {
                ContestsFilter cFilter = (ContestsFilter) filter;
                cFilter.setContestFinalization(ServicesHelper
                        .getDateIntervalFromJson(jsonFilter,
                                "contestFinalizationDate", dateFormat, errors));
                cFilter.setWinnerHandle(ServicesHelper.getStringFromJson(
                        jsonFilter, "winnerHandle"));
            } else if (filter instanceof UpcomingContestsFilter) {
                UpcomingContestsFilter ucFilter = (UpcomingContestsFilter) filter;
                try {
                    ucFilter.setPrizeStart(ServicesHelper.getIntegerFromJson(
                            jsonFilter, "prizeLowerBound"));
                    ucFilter.setPrizeEnd(ServicesHelper.getIntegerFromJson(
                            jsonFilter, "prizeUpperBound"));
                    if (ucFilter.getPrizeStart() > ucFilter.getPrizeEnd()) {
                        errors.add("The lower bound of the prize cannot be greater than the upper bound.");
                    }
                } catch (ContestServicesActionException ex) {
                    errors.add(ex.getMessage());
                }
            }
        }
        return errors;
    }

    /**
     * <p>
     * Gets integer value from JSON object under the given key.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the value will be retrieved.
     * @param key
     *            the key of the value to retrieve.
     * @return the integer value under the given key within the JSON object, or
     *         -1 if such key cannot be found.
     * @throws ContestServicesActionException
     *             if JSON object contains invalid value for the integer field.
     */
    private static int getIntegerFromJson(JSONObject jsonObject, String key)
            throws ContestServicesActionException {
        int value = Filterable.OPEN_INTERVAL;
        if (jsonObject.isKeyDefined(key)) {
            if (jsonObject.isAvailableAsInt(key)) {
                value = jsonObject.getInt(key);
            } else if (jsonObject.isAvailableAsString(key)) {
                try {
                    value = Integer.parseInt(jsonObject.getString(key));
                } catch (NumberFormatException e) {
                    throw new ContestServicesActionException(key
                            + " is not a valid integer value", e);
                }
            }
        }
        if (value < 0 && value != Filterable.OPEN_INTERVAL) {
            throw new ContestServicesActionException(key
                    + "cannot be zero or negative (except -1)");
        }
        return value;
    }

    /**
     * <p>
     * Gets DateIntervalSpecification value from JSON object under the given
     * key.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the value will be retrieved.
     * @param key
     *            the key of the value to retrieve.
     * @param errors
     *            the error list.
     * @return the DateIntervalSpecification value under the given key within
     *         the JSON object, or null if such key cannot be found.
     * @throws ContestServicesActionException
     *             if JSON object contains invalid value for the
     *             DateIntervalSpecification.
     */
    private static DateIntervalSpecification getDateIntervalFromJson(
            JSONObject jsonObject, String key, String dateFormat,
            List<String> errors) throws ContestServicesActionException {
        if (jsonObject.isKeyDefined(key) && jsonObject.isNestedKeyDefined(key)) {
            DateIntervalSpecification result = new DateIntervalSpecification();
            JSONObject dateObject = jsonObject.getNestedObject(key);

            DateIntervalType intervalType = getEnumFromJson(dateObject,
                    "intervalType", DateIntervalType.class);
            if (intervalType == null) {
                throw new ContestServicesActionException(key
                        + "'s intervalType cannot be null");
            }
            result.setIntervalType(intervalType);

            try {
                SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
                String firstDate = getStringFromJson(dateObject, "firstDate");
                if (intervalType == DateIntervalType.AFTER
                        || intervalType == DateIntervalType.BEFORE
                        || intervalType == DateIntervalType.ON
                        || intervalType == DateIntervalType.BETWEEN_DATES) {
                    if (firstDate == null) {
                        errors.add(key + "'s type is " + intervalType
                                + ", the start date cannot be null");
                    }
                    result.setFirstDate(sdf.parse(firstDate));
                }
                String secondDate = getStringFromJson(dateObject, "secondDate");
                if (intervalType == DateIntervalType.BETWEEN_DATES) {
                    if (secondDate == null) {
                        errors.add(key + "'s type is " + intervalType
                                + ", the end date cannot be null");
                    }
                    result.setSecondDate(sdf.parse(secondDate));
                    if (!result.getFirstDate().before(result.getSecondDate())) {
                        errors.add("The start date of the '" + key
                                + "' cannot be later than the end date.");
                    }
                }
            } catch (ParseException e) {
                errors.add("The input date is invalid.");
            }
            return result;
        }
        return null;
    }

    /**
     * <p>
     * Gets enumeration value from JSON object under the given key.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the value will be retrieved.
     * @param key
     *            the key of the value to retrieve.
     * @param clazz
     *            the class of the enumeration to retrieve.
     * @return the enumeration value under the given key within the JSON object,
     *         or null if such key cannot be found.
     * @throws ContestServicesActionException
     *             if the value contained in JSON is not valid.
     */
    private static <T extends Enum<T>> T getEnumFromJson(JSONObject jsonObject,
            String key, Class<T> clazz) throws ContestServicesActionException {
        String name = getStringFromJson(jsonObject, key);
        if (name == null) {
            return null;
        }
        try {
            return Enum.valueOf(clazz, name);
        } catch (IllegalArgumentException e) {
            throw new ContestServicesActionException(key
                    + " is not a valid value for " + clazz.getSimpleName(), e);
        }
    }

    /**
     * <p>
     * Gets string value from JSON object under the given key.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the value will be retrieved.
     * @param key
     *            the key of the value to retrieve.
     * @return the string value under the given key within the JSON object, or
     *         null if such key cannot be found.
     */
    private static String getStringFromJson(JSONObject jsonObject, String key) {
        if (jsonObject.isKeyDefined(key) && jsonObject.isAvailableAsString(key)) {
            return jsonObject.getString(key);
        }
        return null;
    }

    /**
     * <p>
     * Gets list value from JSON object under the given key.
     * </p>
     * 
     * @param jsonObject
     *            the JSON object from which the value will be retrieved.
     * @param key
     *            the key of the value to retrieve.
     * @return the list value under the given key within the JSON object, or
     *         null if such key cannot be found.
     */
    private static List<String> getStringListFromJson(JSONObject jsonObject,
            String key) {
        if (jsonObject.isKeyDefined(key) && jsonObject.isAvailableAsArray(key)) {
            List<String> list = new ArrayList<String>();
            JSONArray jsonArray = jsonObject.getArray(key);
            for (int i = 0; i < jsonArray.getSize(); i++) {
                if (jsonArray.isAvailableAsString(i)) {
                    list.add(jsonArray.getString(i));
                }
            }
            return list;
        }
        return null;
    }
}
