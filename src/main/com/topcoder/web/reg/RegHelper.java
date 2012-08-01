/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.InvalidHandleDAO;
import com.topcoder.web.common.dao.InvalidHandleDAOException;
import com.topcoder.web.reg.action.BaseAction;

/**
 * Helper class used in this application.
 * <p>
 * Change log for version 1.1 (Release Assembly - TC Registration Site 2 Handle
 * Validation Upgrade)
 * <ul>
 * <li>Add method {@link #validateHandle(String)}</li>
 * <li>Add method {@link #checkInvalidHandle(String)}</li>
 * <li>Add method {@link #checkExactMatch(String)}</li>
 * <li>Add method {@link #checkLeadingTrailingNumbers(String)}</li>
 * <li>Add method {@link #checkAgainstPattern(String, Pattern)}</li>
 * </ul>
 * </p>
 * 
 * @author live_world, leo_lol
 * @version 1.1
 * @since 1.0
 */
public final class RegHelper {

    /**
     * <p>
     * Represents list of patterns to extract invalid handle.
     * </p>
     * <p>
     * Initialized in a place and never changed after.
     * </p>
     * 
     * @since 1.1
     */
    private static final Pattern[] INVALID_HANDLE_PATTERNS = new Pattern[] {Pattern.compile("(.*?)es"), 
        Pattern.compile("(.*?)s"), Pattern.compile("_*(.*?)_*") };

    /**
     * Private constructor.
     */
    private RegHelper() {
        // private constructor prevents to create object
    }

    /**
     * Logs the debug message.
     * 
     * @param logger
     *            the Logger instance
     * @param message
     *            the message to log
     */
    public static void logDebug(Logger logger, String message) {
        if (logger.isDebugEnabled()) {
            logger.debug(message);
        }
    }

    /**
     * Logs the info message.
     * 
     * @param logger
     *            the Logger instance
     * @param message
     *            the message to log
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
     * @param filePath
     *            the file path,the file should be on the class path
     * @return The content of file
     * @throws Exception
     *             if any error occurs while processing the request
     */
    public static String readFileAsString(String filePath) throws Exception {
        StringBuilder buf = new StringBuilder();
        BufferedReader in = new BufferedReader(new InputStreamReader(RegHelper.class
                .getResourceAsStream("/" + filePath)));
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
     * @param string
     *            the string to check
     * @return true if it is empty
     */
    public static boolean isEmptyString(String string) {
        return string == null || string.trim().length() == 0;
    }

    /**
     * Sends an email.
     * 
     * @param subject
     *            the subject of email
     * @param content
     *            the email content
     * @param toAddress
     *            the to address
     * @param fromAddress
     *            the from address
     * @throws Exception
     *             if any errors occurs while sending email
     */
    public static void sendEmail(String subject, String content, String toAddress, String fromAddress) throws Exception {
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
     * @param subject
     *            the email subject
     * @param activationCode
     *            the activation code
     * @param activationEmailBodyTemplateFile
     *            the activation email body template file
     * @param toAddress
     *            the to address
     * @param fromAddress
     *            the from address
     * @throws Exception
     *             if any exception occurs while sending the email
     */
    public static void sendActivationEmail(String subject, String activationCode,
            String activationEmailBodyTemplateFile, String toAddress, String fromAddress) throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        // TODO: change back to /reg
        String url = ApplicationServer.SERVER_NAME + "/reg2/activate.action?" + WebConstants.ACTIVATION_CODE + "="
                + activationCode;
        String msg = RegHelper.readFileAsString(activationEmailBodyTemplateFile);
        msg = msg.replace("%ACTIVATION_CODE%", activationCode).replace("%ACTIVATION_URL%", url);
        sendEmail(subject, msg, toAddress, fromAddress);
    }

    /**
     * Finds group principal by group name.
     * 
     * @param groups
     *            the groups collection
     * @param groupName
     *            the group name
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
     * @param logger
     *            the logger to use for logging error
     * @param ctx
     *            the context to close
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

    /**
     * This method would validate if the given handle is valid and non-offensive
     * 
     * @param handle
     *            The handle to check
     * @param action
     *            The action needing validation to perform.
     * @return true if the given handle is available, valid and non-offensive;
     *         false there there is at least one violated discipline.
     * @since 1.1
     */
    public static boolean validateHandle(String handle, BaseAction action) {

        // check empty
        if (isEmptyString(handle)) {
            action.addActionError("Please fill your handle");
            return false;
        }

        handle = handle.trim();

        // check length
        final int len = handle.length();

        if (len < Constants.MIN_HANDLE_LENGTH) {
            action.addActionError("The handle must be at least " + Constants.MIN_HANDLE_LENGTH
                    + " characters long.");
            return false;
        }

        if (len > Constants.MAX_HANDLE_LENGTH) {
            action.addActionError("The handle must be at most " + Constants.MAX_HANDLE_LENGTH + " characters long.");
            return false;
        }

        if (!StringUtils.containsOnly(handle, Constants.HANDLE_ALPHABET, false)) {
            action.addActionError("The handle may contain only letters, numbers and " + Constants.HANDLE_PUNCTUATION);
            return false;
        }

        if (StringUtils.containsOnly(handle, Constants.HANDLE_PUNCTUATION, false)) {
            action.addActionError("The handle may not contain only punctuation.");
            return false;
        }

        if (handle.toLowerCase().trim().startsWith("admin")) {
            action.addActionError("Please choose another handle, not starting with admin.");
            return false;
        }
        if (checkInvalidHandle(handle)) {
            action.addActionError("The handle you entered is not valid.");
            return false;
        }

        return true;
    }

    /**
     * Checks whether given handle exactly matches invalid handle in
     * persistence.
     * 
     * @param handle
     *            the handle to check
     * @return true, if given handle exactly matches invalid handle in
     *         persistence, false otherwise
     * @throws InvalidHandleDAOException
     *             if any error occurs while retrieving invalid handle from
     *             persistence
     * @since 1.1
     */
    private static boolean checkExactMatch(String handle) {
        // check if the handle is an exact match in the list of bad words
        return DAOUtil.getQueryToolFactory().getInvalidHandleDAO().find(handle) != null;
    }

    /**
     * <p>
     * Checks given handle against table of invalid handles.
     * </p>
     * <p>
     * Finds such invalid handle that could be made from given handle removing
     * leading and trailing numbers or adding plural affixes.
     * </p>
     * 
     * @param handle
     *            the handle to check
     * @return true, if given handle literally match invalid handle or founded
     *         such invalid handle that could be made from given handle removing
     *         leading and trailing numbers or adding plural affixes, false
     *         otherwise
     * @throws InvalidHandleDAOException
     *             if any error occurs while retrieving invalid handle from
     *             persistence
     * @since 1.1
     */
    private static boolean checkInvalidHandle(String handle) {
        if (checkExactMatch(handle)) {
            return true;
        }
        // check each pattern rule
        for (int i = 0; i < INVALID_HANDLE_PATTERNS.length; i++) {
            if (checkAgainstPattern(handle, INVALID_HANDLE_PATTERNS[i])) {
                return true;
            }
        }
        // check invalid word after removing some leading/trailing numbers
        return checkLeadingTrailingNumbers(handle);
    }

    /**
     * Checks that given handle without some quantity of leading/trailing
     * numbers equal to invalid handle.
     * 
     * @param handle
     *            the handle to check
     * @return true if given handle without some quantity of leading/trailing
     *         numbers equal to invalid handle, false otherwise
     * @throws InvalidHandleDAOException
     *             if any error occurs while retrieving invalid handle from
     *             persistence
     * @since 1.1
     */
    private static boolean checkLeadingTrailingNumbers(String handle) {
        int head = 0;
        // find heading and trailing digits count
        while (head < handle.length() && Character.isDigit(handle.charAt(head))) {
            head++;
        }
        if (head >= handle.length()) {
            head = handle.length() - 1;
        }
        int tail = handle.length() - 1;
        while (tail >= 0 && Character.isDigit(handle.charAt(tail))) {
            tail--;
        }
        if (tail < 0) {
            tail = 0;
        }
        // remove all possible heading and trailing digits
        for (int i = 0; i <= head; i++) {
            for (int j = handle.length(); j > tail && j > i; j--) {
                String extractedHandle = handle.substring(i, j);
                if (checkExactMatch(extractedHandle)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Checks that given handle with extracted group that matches given pattern
     * equal to invalid handle.
     * 
     * @param handle
     *            the handle to check
     * @param pattern
     *            the pattern to be extracted from handle
     * @return true if given handle with extracted group matches given pattern
     *         equal to invalid handle, false otherwise
     * @throws InvalidHandleDAOException
     *             if any error occurs while retrieving invalid handle from
     *             persistence
     * @since 1.1
     */
    private static boolean checkAgainstPattern(String handle, Pattern pattern) {
        Matcher matcher = pattern.matcher(handle);
        if (matcher.matches()) {
            String extractedHandle = matcher.group(1);
            if (!extractedHandle.equals(handle) && extractedHandle.length() > 0) {
                return checkExactMatch(extractedHandle);
            }
        }
        return false;
    }
}