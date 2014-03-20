/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.controller.request.authentication;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.EmailRequestDAO;
import com.topcoder.web.common.model.ConfirmationEmailRequest;
import com.topcoder.web.common.model.EmailRequest;
import com.topcoder.web.common.model.EmailRequestType;
import com.topcoder.web.common.model.User;

/**
 * <p>
 * This class provides a few commonly used utilities.
 * </p>
 *
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #isEmailAlreadyUsed(String, Long)} method.</li>
 *     <li>Added {@link #generateEmailConfirmation(ConfirmationEmailRequest)} method.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.2 (TopCoder Email Management Bug Race - BUGR-9479):
 * <ol>
 *      <li>Add {@link #generateEmailConfirmation(ConfirmationEmailRequest request)} to add user handle.</li>
 * </ol>
 * </p>
 * @author Standlove,TCSASSEMBLER
 * @version 1.2
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

    /**
     * <p>
     * Check the email is already used by the others or not.
     * </p>
     *
     * @param email the email address
     * @param userId the user id
     * @return true if the email is already used by the others, return false otherwise.
     * @throws IllegalArgumentException if <code>email</code> is null or empty
     * @throws HibernateException if anything wrong during calling the DAO methods
     *
     * @since 1.1
     */
    public static boolean isEmailAlreadyUsed(String email, Long userId) {
        if (email == null) {
            throw new IllegalArgumentException("The email cannot be null.");
        }
        if (email.trim().length() == 0) {
            throw new IllegalArgumentException("The email cannot be empty.");
        }
        List<User> users = DAOUtil.getFactory().getUserDAO().findByPrimaryOrSecondEmail(email);
        if (!users.isEmpty()) {
            return true;
        }
        EmailRequestDAO dao = DAOUtil.getFactory().getEmailRequestDAO();
        return dao.isEmailOccupied(email, userId);
    }

    /**
     * <p>
     * Send email to ensure the given email is valid.
     * </p>
     *
     * @param request confirmation email request
     * @throws IllegalArgumentException if the request is null or any of its fields is invalid
     * @throws Exception if anything is wrong during sending email or accessing persistence layer
     */
    public static void generateEmailConfirmation(ConfirmationEmailRequest request) throws Exception {
        if (request == null) {
            throw new IllegalArgumentException("The request cannot be null.");
        }
        if (request.getUserId() < 0) {
            throw new IllegalArgumentException("The request.userId shouldn't be negative.");
        }
        if (request.getExpirationDuration() <= 0) {
            throw new IllegalArgumentException("The request.expirationDuration should be positive.");
        }
        if (request.getToEmail() == null) {
            throw new IllegalArgumentException("The request.toEmail shouldn't be null.");
        }
        if (request.getToEmail().trim().length() == 0) {
            throw new IllegalArgumentException("The request.toEmail shouldn't be empty.");
        }
        if (request.getFromEmail() == null) {
            throw new IllegalArgumentException("The request.fromEmail shouldn't be null.");
        }
        if (request.getFromEmail().trim().length() == 0) {
            throw new IllegalArgumentException("The request.fromEmail shouldn't be empty.");
        }
        if (request.getSubject() == null) {
            throw new IllegalArgumentException("The request.subject shouldn't be null.");
        }
        if (request.getSubject().trim().length() == 0) {
            throw new IllegalArgumentException("The request.subject shouldn't be empty.");
        }
        if (request.getBody() == null) {
            throw new IllegalArgumentException("The request.body shouldn't be null.");
        }
        if (request.getBody().trim().length() == 0) {
            throw new IllegalArgumentException("The request.body shouldn't be empty.");
        }
        if (request.getRequestType() != EmailRequestType.PrimaryEmailChangeConfirmation &&
            request.getRequestType() != EmailRequestType.SecondaryEmailConfirmation) {
            throw new IllegalArgumentException("The request.requestType should be either primary or secondary.");
        }
        if (!request.getBody().contains("{requestId}") || !request.getBody().contains("{key}")
            || !request.getBody().contains("{expiredAt}")) {
            throw new IllegalArgumentException(
                "The request.body should contain requestId, key and expiredAt template.");
        }

        // generate a random key
        Random random = new Random(System.currentTimeMillis());
        int randomKey = random.nextInt();
        // calculate the expiration date
        Date expiredAt = new Date(request.getExpirationDuration() * 1000 + new Date().getTime());

        // save the request
        EmailRequestDAO dao = DAOUtil.getFactory().getEmailRequestDAO();
        EmailRequest emailRequest = new EmailRequest();
        emailRequest.setEmail(request.getToEmail());
        emailRequest.setExpiredAt(expiredAt);
        emailRequest.setUserId(request.getUserId());
        emailRequest.setRandomKey(randomKey);
        emailRequest.setRequestType(request.getRequestType());
        long requestId = dao.save(emailRequest);

        // send the email
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(request.getSubject());

        String body = request.getBody().replace("{requestId}", String.valueOf(requestId))
                .replace("{key}", String.valueOf(randomKey)).replace("{expiredAt}", String.valueOf(expiredAt.getTime()));
        body = body.replace("<HANDLE>", request.getHandle());
        mail.setBody(body);
        mail.setToAddress(request.getToEmail(), TCSEmailMessage.TO);
        mail.setFromAddress(request.getFromEmail());
        EmailEngine.send(mail);
    }
}
