/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collection;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

/**
 * Helper class used in this application.
 *
 * @author live_world
 * @version 1.0
 */
public final class RegHelper {

    /**
     * Private constructor.
     */
    private RegHelper() {
        // private constructor prevents to create object
    }

    /**
     * Logs the debug message.
     *
     * @param logger the Logger instance
     * @param message the message to log
     */
    public static void logDebug(Logger logger, String message) {
        if (logger.isDebugEnabled()) {
            logger.debug(message);
        }
    }

    /**
     * Logs the info message.
     *
     * @param logger the Logger instance
     * @param message the message to log
     */
    public static void logInfo(Logger logger, String message) {
        if (logger.isInfoEnabled()) {
            logger.info(message);
        }
    }

    /**
     * <p>
     * Reads the file content as string.
     * </p>
     *
     * @param filePath the file path,the file should be on the class path
     * @return The content of file
     * @throws Exception if any error occurs while processing the request
     */
    public static String readFileAsString(String filePath) throws Exception {
        StringBuilder buf = new StringBuilder();
        BufferedReader in =
            new BufferedReader(new InputStreamReader(RegHelper.class.getResourceAsStream("/" + filePath)));
        try {
            String s;
            while ((s = in.readLine()) != null) {
                buf.append(s + System.getProperty("line.separator"));
            }
            return buf.toString();
        } finally {
            in.close();
        }
    }

    /**
     * Determines whether the given string is empty or not.
     *
     * @param string the string to check
     * @return true if it is empty
     */
    public static boolean isEmptyString(String string) {
        return string == null || string.trim().length() == 0;
    }

    /**
     * Sends an email.
     *
     * @param subject the subject of email
     * @param content the email content
     * @param toAddress the to address
     * @param fromAddress the from address
     * @throws Exception if any errors occurs while sending email
     */
    public static void sendEmail(String subject, String content, String toAddress, String fromAddress)
        throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        mail.setBody(content);
        mail.addToAddress(toAddress, TCSEmailMessage.TO);
        mail.setFromAddress(fromAddress);
        EmailEngine.send(mail);
    }

    /**
     * Sends the activation email for a newly registered user.
     *
     * @param subject the email subject
     * @param activationCode the activation code
     * @param activationEmailBodyTemplateFile the activation email body template file
     * @param toAddress the to address
     * @param fromAddress the from address
     * @throws Exception if any exception occurs while sending the email
     */
    public static void sendActivationEmail(String subject, String activationCode,
        String activationEmailBodyTemplateFile, String toAddress, String fromAddress) throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        String url =
            ApplicationServer.SERVER_NAME + "/reg2/activate.action?" + WebConstants.ACTIVATION_CODE + "="
                + activationCode;
        String msg = RegHelper.readFileAsString(activationEmailBodyTemplateFile);
        msg = msg.replace("%ACTIVATION_CODE%", activationCode).replace("%ACTIVATION_URL%", url);
        sendEmail(subject, msg, toAddress, fromAddress);
    }

    /**
     * Finds group principal by group name.
     *
     * @param groups the groups collection
     * @param groupName the group name
     * @return the group
     */
    public static GroupPrincipal findGroupPrincipal(Collection<GroupPrincipal> groups, String groupName) {
        for (GroupPrincipal group : groups) {
            if (groupName.equals(group.getName())) {
                return group;
            }
        }
        return null;
    }

    /**
     * Closes context.
     *
     * @param logger the logger to use for logging error
     * @param ctx the context to close
     */
    public static void closeContext(Logger logger, Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception e) {
                logger.error("couldn't close context", e);
            }
        }
    }
}