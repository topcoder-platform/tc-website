/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.controller.request.authentication;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.topcoder.shared.util.logging.Logger;

/**
 * <p>
 * This class provides a few commonly used utilities.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class Util {
    /**
     * <p>
     * Logging exit of a method at debug level.
     * </p>
     * 
     * @param logger
     *            Logger instance used to log.
     * @param info
     *            Message to print.
     * @param signature
     *            method signature.
     * @param re
     *            return value of the method.
     */
    public static void logExit(Logger logger, String info, String signature,
            Object re) {
        if (logger.isDebugEnabled()) {
            if (null != info) {
                if (null != re) {
                    logger.debug(info + "\nExiting: " + signature
                            + "\nReturn: " + re);

                } else {
                    logger.debug(info + "\nExiting: " + signature);
                }
            } else {
                if (null != re) {
                    logger.debug("Exiting: " + signature + "\nReturn: " + re);
                } else {
                    logger.debug("Exiting: " + signature);
                }
            }
        }
    }

    /**
     * <p>
     * Logging entrance of a method at debug level.
     * </p>
     * 
     * @param logger
     *            Logger instance to be used.
     * @param signature
     *            method signature.
     * @param paramNames
     *            parameter names.
     * @param paramValues
     *            parameter values.
     */
    public static void logEntrance(Logger logger, String signature,
            String[] paramNames, Object[] paramValues) {
        if (logger.isDebugEnabled()) {
            if (null == paramNames || paramNames.length != paramValues.length
                    || paramNames.length == 0) {
                logger.debug("Entering: " + signature);
            } else {
                StringBuffer sb = new StringBuffer();
                sb.append("Entering: ").append(signature)
                        .append(", with parameters = [");
                for (int i = 0; i < paramNames.length - 1; i++) {
                    sb.append(paramNames[i]).append(":").append(paramValues[i])
                            .append(", ");
                }
                sb.append(paramNames[paramNames.length - 1]).append(":")
                        .append(paramValues[paramValues.length - 1])
                        .append("]");
            }
        }
    }
    
    /**
     * <p>
     * Add error message to session so that the error messages are available
     * after redirection.
     * </p>
     * 
     * @param session
     * @param key
     * @param msg
     */
    public static void addErrorToSession(HttpSession session, String key, String msg) {
        List<String> existingMsgs = (List<String>)session.getAttribute(key);
        if(null == existingMsgs) {
            existingMsgs = new ArrayList<String>();
            session.setAttribute(key, existingMsgs);
        }
        existingMsgs.add(msg);
    }
}
