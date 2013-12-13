/*
 * Copyright (C) 2011-2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.json.object.JSONObject;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.ExtendedThreadLocalSessionContext;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.LongHibernateProcessor;
import com.topcoder.web.common.LongHibernateProcessor.HibernateSessionHouse;
import com.topcoder.web.common.security.SSOCookieService;
import com.topcoder.web.common.security.SSOCookieServiceImpl;

/**
 * <p>
 * This class is used by this component only. Provide some common utility
 * methods.
 * </p>
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 * @author AleaActaEst, microsky, VolodymyrK
 * @version 1.1
 */
final class Helper {
    
    /**
     * The SSO cookie service provider.
     * @since 1.1
     */
    private static SSOCookieService ssoCookieService = new SSOCookieServiceImpl();;

    /**
     * <p>
     * This is a logger which will be used to perform logging operations.
     * </p>
     * <p>
     * It's created upon initialization with the class name of this class as the logger name.
     * </p>
     * <p>
     * After initiaization, it must be non-null.
     * </p>
     */
    private static final Logger log = Logger.getLogger(Helper.class);
    
    /**
     * <p>
     * Private constructor.
     * </p>
     */
    private Helper() {
    }

    /**
     * <p>
     * Checks whether the parameter is null.
     * </p>
     * @param param the parameter to check
     * @param paramName the name of the parameter
     * @throws IllegalArgumentException if the parameter is null
     */
    static void checkNull(final Object param, final String paramName) {
        if (param == null) {
            throw new IllegalArgumentException("The parameter '" + paramName + "' should not be null.");
        }
    }

    /**
     * <p>
     * Checks whether a string is null or empty, if it is,
     * <code>IllegalArgumentException</code> is thrown.
     * </p>
     * @param param the string to check
     * @param paramName the parameter name
     * @throws IllegalArgumentException if the string is null or empty
     */
    static void checkString(final String param, final String paramName) {
        Helper.checkNull(param, paramName);

        if (param.trim().length() == 0) {
            throw new IllegalArgumentException("The parameter '" + paramName + "' should not be empty.");
        }
    }

    /**
     * <p>
     * Checks whether a string is null or empty, if it is,
     * <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the string to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the string is null or empty
     */
    static void checkState(final String param, final String paramName) {
        if (param == null || param.trim().length() == 0) {
            throw new IllegalStateException("The parameter '" + paramName + "' should not be empty.");
        }
    }
    
    /**
     * Write a specified json object use http servlet response.
     * 
     * @param response
     *            the response used to write json object.
     * @param json
     *            the json object to write.
     * @param success
     *            whether to write as success info or not.
     * @throws IOException
     *             if any exception occurs when write.
     */
    static void writeJSONResult(HttpServletResponse response, JSONObject json, boolean success) throws IOException {
        if(json != null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            PrintWriter writer = response.getWriter();
            
            JSONObject ret = new JSONObject();
            
            if (success) {
                ret.setNestedObject("success", json);
            } else {
                ret.setNestedObject("error", json);
            }
            
            writer.write(ret.toJSONString());
            writer.close();
        }
    }
    
    /**
     * Write a specified json object use http servlet response, as success message.
     * 
     * @param response
     *            the response used to write json object.
     * @param json
     *            the json object to write.
     * @throws IOException
     *             if any exception occurs when write.
     */
    static void writeJSONResult(HttpServletResponse response, JSONObject json) throws IOException {
        writeJSONResult(response, json, true);
    }
    
    /**
     * Retrieve user id from SSO cookie.
     * 
     * @param request
     *            the request to analyze
     * @return retrieved used id
     * @throws MemberPhotoUploadException
     *             if can't find the user or the user is guest.
     */
    static long getUserId(HttpServletRequest request) throws MemberPhotoUploadException {
        Long userId = null;
        try {
            userId = ssoCookieService.getUserIdFromSSOCookie(request);
        } catch (Exception e) {
            throw new MemberPhotoUploadException("Can't retrieve user ID from SSO cookie.", e);
        }

        if (userId == null) {
            throw new MemberPhotoUploadException("You must login first.");
        }

        return userId;
    }
       
    /**
     * Start communication.
     * 
     * @param request the http request.
     */
    static void beginCommunication(HttpServletRequest request) {
        if (String.valueOf(true).equals(request.getAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG))) {
            throw new RuntimeException("Active conversation exists, can not start another");
        } else {
            HibernateSessionHouse house =
                    (HibernateSessionHouse) request.getSession().getAttribute(LongHibernateProcessor.HIBERNATE_SESSION_KEY);
            if (house != null) {
                logDebugMsg("bind existing hibernate session");
                ExtendedThreadLocalSessionContext.bind(house.getSession());
            } else {
                logDebugMsg("didn't fine the hibernate session, we'll have to create one");
            }

            HibernateUtils.begin();
            request.setAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG, String.valueOf(true));
        }
    }
    
    /**
     * End communication.
     * 
     * @param request the http request.
     */
    static void endCommunication(HttpServletRequest request) {
        logDebugMsg("close conversation");
        //only close if there is something to close
        if (String.valueOf(true).equals(request.getAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG))) {
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.closeSession(); // Unbind is automatic here
            cleanup(request);
        } else if (HibernateUtils.getSession().isOpen()) {
            logDebugMsg("we're not closing a conversation that has an open session");
        }
    }

    /**
     * Clean up hibernate flags.
     * 
     * @param request
     *            the http request.
     */
    static private void cleanup(HttpServletRequest request) {
        logDebugMsg("cleanup");
        request.removeAttribute(LongHibernateProcessor.END_OF_CONVERSATION_FLAG);
        request.removeAttribute(LongHibernateProcessor.ACTIVE_CONVERSATION_FLAG);
        request.getSession().removeAttribute(LongHibernateProcessor.HIBERNATE_SESSION_KEY);
    }

    /**
     * Logs the DEBUG message.
     * @param message
     *            the message to log.
     */
    static void logDebugMsg(String message) {
        if (log != null && log.isDebugEnabled()) {
            log.debug(message);
        }
    }

    /**
     * Logs the ERROR message.
     * @param <T>
     *            the error type.
     * @param message
     *            the message to log.
     * @param e
     *            the error
     * @return the passed in exception.
     */
    static <T extends Throwable> T logError(String message, T e) {
        if (log != null) {
            log.error(message, e);
        }
        return e;
    }
    
}