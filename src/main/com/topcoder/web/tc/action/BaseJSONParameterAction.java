/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.JSONDecoder;
import com.topcoder.json.object.io.JSONDecodingException;
import com.topcoder.json.object.io.StandardJSONDecoder;
import com.topcoder.web.tc.ContestServicesConfigurationException;
import com.topcoder.web.tc.Helper;

/**
 * <p>
 * This is the base class for the actions that have a JSON object as parameter.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable. However,
 * dedicated instance of struts action will be created by the struts framework
 * to process the user request, so the struts actions don't need to be
 * thread-safe.
 * </p>
 * 
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public abstract class BaseJSONParameterAction extends ActionSupport implements
        ServletRequestAware {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = BaseJSONParameterAction.class
            .getName();

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(BaseJSONParameterAction.class). It is used throughout
     * the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(BaseJSONParameterAction.class);

    /**
     * <p>
     * The name of the http parameter that is a JSON string as the input to this
     * action. It is set through setter and doesn't have a getter. It cannot be
     * null or empty. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It can be changed
     * after it is initialized as part of variable declaration to: "parameter".
     * It is used in getParameterAsJSONObject(), setParameterKey().
     * </p>
     */
    private String parameterKey = "parameter";

    /**
     * <p>
     * The date format string used to parse dates in the JSON string. It has
     * both getter and setter. It cannot be null or empty. (Note that the above
     * statement applies only after the setter has been called as part of the
     * IoC initialization. This field's value has no restriction before the IoC
     * initialization) It can be changed after it is initialized as part of
     * variable declaration to: "MM/dd/yyyy". It is used in
     * getDateFormatString(), setDateFormatString().
     * </p>
     */
    private String dateFormatString = "MM/dd/yyyy";

    /**
     * <p>
     * The http servlet request. This is injected by Struts. It is set through
     * setter and doesn't have a getter. It cannot be null. It does not need to
     * be initialized when the instance is created. It is used in
     * setServletRequest(), getParameterAsJSONObject().
     * </p>
     */
    private HttpServletRequest servletRequest;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    protected BaseJSONParameterAction() {
        // Empty
    }

    /**
     * <p>
     * Get the input parameter as a JSON object.
     * </p>
     * 
     * @return the input parameter as a JSON object
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    protected JSONObject getParameterAsJSONObject()
            throws ContestServicesActionException {
        // Log the entry
        final String signature = CLASS_NAME + ".getParameterAsJSONObject()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        JSONDecoder decoder = new StandardJSONDecoder();
        try {
            JSONObject result = (JSONObject) decoder.decode(servletRequest
                    .getParameter(parameterKey));

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);

            return result;
        } catch (ClassCastException e) {
            throw Helper.logException(LOGGER,
                    new ContestServicesActionException(
                            "ClassCastException occurs while decoding", e),
                    signature);
        } catch (JSONDecodingException e) {
            throw Helper.logException(LOGGER,
                    new ContestServicesActionException(
                            "JSONDecodingException occurs while decoding", e),
                    signature);
        }
    }

    /**
     * <p>
     * Setter method for the parameterKey, simply set the value to the namesake
     * field.
     * </p>
     * 
     * @param parameterKey
     *            The name of the http parameter that is a JSON string as the
     *            input to this action
     */
    public void setParameterKey(String parameterKey) {
        this.parameterKey = parameterKey;
    }

    /**
     * <p>
     * Getter method for dateFormatString, simply return the value of the
     * namesake field.
     * </p>
     * 
     * @return the dateFormatString
     */
    protected String getDateFormatString() {
        return dateFormatString;
    }

    /**
     * <p>
     * Setter method for the dateFormatString, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param dateFormatString
     *            The date format string used to parse dates in the JSON string.
     */
    public void setDateFormatString(String dateFormatString) {
        this.dateFormatString = dateFormatString;
    }

    /**
     * <p>
     * Setter method for the servletRequest, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param servletRequest
     *            The http servlet request. This is injected by Struts.
     */
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
    }

    /**
     * <p>
     * This method is called right after the dependency of this class is fully
     * injected. It checks if the injected values are valid.
     * </p>
     * 
     * @throws ContestServicesConfigurationException
     *             if any of the injected values is invalid.
     */
    public void checkConfiguration() {
        // Check the value of the following fields according to their legal
        // value specification in the field
        // variable documentation:
        checkStringNotNullAndEmptyForConfiguration("parameterKey", parameterKey);
        checkStringNotNullAndEmptyForConfiguration("dateFormatString",
                dateFormatString);
    }

    /**
     * <p>
     * Throw ContestServicesConfigurationException if the parameter is null or
     * empty.
     * </p>
     * 
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws ContestServicesConfigurationException
     *             if the argument does not meet the request
     */
    private static void checkStringNotNullAndEmptyForConfiguration(String name,
            String param) {
        if (param == null || param.trim().length() == 0) {
            throw new ContestServicesConfigurationException("The argument "
                    + name + " cannot be null or empty.");
        }
    }
}
