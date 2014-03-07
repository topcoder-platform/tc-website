/*
 * Copyright (C) 2013 - 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.util.DataProvider;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;

/**
 * This class contains a collection of helper method.
 * <p>
 * <strong>Thread Safety:</strong> This class is thread-safe.
 * </p>
 * sendEmailAfterActivation
 * <p>
 * Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log: Updated
 * sendResetPasswordEmail method to send the reset password token in the body of email.
 * </p>
 * <p>
 * Change in v1.2 (Release Assembly - TopCoder Website Social Login)
 * <ol>
 * <li>Add a session key <code>SOCIAL_ACCOUNT_SESSION_KEY</code> for the current logged in social account.</li>
 * <ol>
 * </p>
 * <p>
 * Change in v1.3 (F2F - TopCoder Reg2 - Send Email After user activation)
 * <ol>
 * <li>Add new method <code>sendEmailAfterActivation()</code> for sending an email for greeting a new user.</li>
 * <ol>
 * </p>
 *
 * @author sampath01, leo_lol, Urmass ,ecnu_haozi, TCSDEVELOPER
 * @version 1.3
 * @since 1.0
 */
public final class RegistrationHelper {

    /**
     * Email regular expression.
     */
    public static final String EMAIL_REGEX = "\\b(^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@([A-Za-z0-9-])+((\\.com)"
        + "|(\\.net)|(\\.org)|(\\.info)|(\\.edu)|(\\.mil)|(\\.gov)|(\\.biz)|(\\.ws)|(\\.us)|(\\.tv)|(\\.cc)"
        + "|(\\.aero)|(\\.arpa)|(\\.coop)|(\\.int)|(\\.jobs)|(\\.museum)|(\\.name)|(\\.pro)|(\\.travel)|(\\.nato)"
        + "|(\\..{2,3})|(\\.([A-Za-z0-9-])+\\..{2,3}))$)\\b";

    /**
     * Email pattern.
     */
    public static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);

    /**
     * Pattern for lower case letters.
     */
    private static final Pattern LOWER_CASE_PATTERN = Pattern.compile("[a-z]");

    /**
     * Pattern for upper case letters.
     */
    private static final Pattern UPPER_CASE_PATTERN = Pattern.compile("[A-Z]");

    /**
     * Compiled {@link Pattern} instance of punctuation symbols.
     */
    private static final Pattern SYMBOL_PATTERN = Pattern.compile("\\p{Punct}");

    /**
     * Compiled {@link Pattern} instance to find numeric digits.
     */
    private static final Pattern NUMBER_PATTERN = Pattern.compile("\\d");

    /**
     * <p>
     * Represents list of patterns to extract invalid handle.
     * </p>
     * <p>
     * Initialized in a place and never changed after.
     * </p>
     */
    private static final Pattern[] INVALID_HANDLE_PATTERNS = new Pattern[] {Pattern.compile("(.*?)es"),
        Pattern.compile("(.*?)s"), Pattern.compile("_*(.*?)_*")};

    /**
     * Represents the logger.
     */
    protected static final Logger LOGGER = Logger.getLogger(RegistrationHelper.class);

    /**
     * This is the key, referencing the id-captcha_word map.
     */
    public static final String CAPTCHA_APPLICATION_KEY = "captcha_application_key";

    /**
     * This constant stores the relative path of captcha images.
     */
    public static final String CAPTCHA_RELATIVE_DIR = "i/captcha/";

    /**
     * Key to hold the next page URL.
     */
    public static final String NEXT_PAGE_SESSION_KEY = "next_page_session_key";

    /**
     * Key to hold current logged in social account.
     * @since 1.2
     */
    public static final String SOCIAL_ACCOUNT_SESSION_KEY = "social_account_session_key";

    /**
     * Handle punctuation.
     */
    public final static String HANDLE_PUNCTUATION = "-_.{}[]";

    /**
     * Permit handle chars.
     */
    public final static String HANDLE_ALPHABET = StringUtils.ALPHABET_ALPHA_EN + StringUtils.ALPHABET_DIGITS_EN
        + HANDLE_PUNCTUATION;

    /**
     * Method to calculate the strength of the password.
     *
     * @param password
     *            The password to calculate
     * @return rank of strength, minus means unacceptable scenarios.
     */
    public static int calculatePasswordStrength(String password) {
        int result = 0;
        password = password.trim();

        final int len = password.length();
        if (password.substring(len - 1).matches("\\d")) {
            return -1;
        }

        // Check if it has lower case characters.
        Matcher matcher = LOWER_CASE_PATTERN.matcher(password);
        if (matcher.find()) {
            result++;
        }

        // Check if it has upper case character.
        matcher = UPPER_CASE_PATTERN.matcher(password);
        if (matcher.find()) {
            result++;
        }

        // Check if it has punctuation symbol
        matcher = SYMBOL_PATTERN.matcher(password);
        if (matcher.find()) {
            result++;
        }

        // Check if it has number.
        matcher = NUMBER_PATTERN.matcher(password);
        if (matcher.find()) {
            result++;
        }
        return result;
    }

    /**
     * This method checks if the given string is null or empty.
     *
     * @param var
     *            String to validate.
     * @param varName
     *            Name of the variable.
     * @param clazz
     *            Class of the exception to throw.
     * @throws T
     *             If the string to validate fails.
     */
    public static <T extends Throwable> void checkNotNullOrEmpty(String varName, String var, Class<T> clazz) throws T {
        if (null == var || var.trim().length() == 0) {
            throw constructException(varName + " cannot be null or empty", clazz);
        }
    }

    /**
     * This method checks if the given variable is null.
     *
     * @param var
     *            Object to validate.
     * @param varName
     *            Name of the variable to check.
     * @param clazz
     *            Class of the exception to throw.
     * @throws T
     *             If the string to validate fails.
     */
    public static <T extends Throwable> void checkNotNull(String varName, Object var, Class<T> clazz) throws T {
        if (null == var) {
            throw constructException(varName + " cannot be null", clazz);
        }
    }

    /**
     * This method is to construct an exception instance according to the given message.
     *
     * @param msg
     *            Exception message.
     * @param clazz
     *            Exception type.
     * @return Instance of T or null if this method fails.
     */
    static <T extends Throwable> T constructException(String msg, Class<T> clazz) {
        try {
            Constructor<T> ctor = clazz.getConstructor(new Class[] {String.class});
            return ctor.newInstance(msg);
        } catch (SecurityException e) {
            // drop all exceptions quietly.
        } catch (NoSuchMethodException e) {
            // drop all exceptions quietly.
        } catch (IllegalArgumentException e) {
            // drop all exceptions quietly.
        } catch (InstantiationException e) {
            // drop all exceptions quietly.
        } catch (IllegalAccessException e) {
            // drop all exceptions quietly.
        } catch (InvocationTargetException e) {
            // drop all exceptions quietly.
        }
        return null;
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
     * @param senderName
     *            the sender's name
     * @throws Exception
     *             if any errors occurs while sending email
     */
    public static void sendEmail(String subject, String content, String toAddress, String fromAddress,
        String senderName) throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        mail.setBody(content);
        mail.addToAddress(toAddress, TCSEmailMessage.TO);
        mail.setFromAddress(fromAddress, senderName);
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
     * @param senderName
     *            the sender's name
     * @throws Exception
     *             if any exception occurs while sending the email
     */
    public static void sendActivationEmail(String subject, String activationCode,
        String activationEmailBodyTemplateFile, String toAddress, String fromAddress, String senderName, String url)
        throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        String msg = readFileAsString(activationEmailBodyTemplateFile);
        msg = msg.replace("%ACTIVATION_CODE%", activationCode).replace("%ACTIVATION_URL%", url);
        sendEmail(subject, msg, toAddress, fromAddress, senderName);
    }

    /**
     * Sends the reset password email. This method was updated to send the reset password token in the body of
     * email.
     *
     * @param emailSetting
     *            the email setting
     * @param toEmail
     *            the to email address
     * @param token
     *            the access token
     * @param handle
     *            the user's handle
     * @param expire
     *            the expire date string
     * @throws Exception
     *             if any exception occurs while sending the mail.
     */
    public static void sendResetPasswordEmail(EmailSetting emailSetting, String toEmail, String token, String handle,
        String expire) throws Exception {
        // send the email
        String msg =
            readFileAsString(emailSetting.getEmailBodyTemplateFile()).replace("{token}", token)
                .replace("{handle}", handle).replace("{expire}", expire);
        sendEmail(emailSetting.getEmailSubject(), msg, toEmail, emailSetting.getEmailFromAddress(),
            emailSetting.getSenderName());
    }

    /**
     * Sends the welcome email for a newly registered user.
     *
     * @param subject
     *            the email subject
     * @param userHandle
     *            the registered user handle
     * @param emailBodyTemplateFile
     *            the email body template file
     * @param toAddress
     *            the to address
     * @param fromAddress
     *            the from address
     * @param senderName
     *            the sender's name
     * @throws Exception
     *             if any exception occurs while sending the email
     * @since 1.3
     */
    public static void sendEmailAfterActivation(String subject, String userHandle,
        String emailBodyTemplateFile, String toAddress, String fromAddress, String senderName)
        throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(subject);
        String msg = readFileAsString(emailBodyTemplateFile);
        msg = msg.replace("%USER_HANDLE%", userHandle);
        mail.setSubject(subject);
        mail.setBody(msg);
        mail.addToAddress(toAddress, TCSEmailMessage.TO);
        mail.setFromAddress(fromAddress, senderName);
        // use this updated html email sender
        EmailEngine.sendHtml(mail);
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
        BufferedReader in =
            new BufferedReader(new InputStreamReader(RegistrationHelper.class.getResourceAsStream("/" + filePath)));
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
     * This method would validate if the given handle is valid and non-offensive
     *
     * @param handle
     *            The handle to check, assumed not null.
     * @param action
     *            The action needing validation to perform.
     * @return null if the given handle is available, valid and non-offensive; error description there there is at
     *         least one violated discipline.
     * @throws PersistenceException
     *             If there is any error while validating against DB for invalid handles.
     */
    public static String validateHandle(String handle) throws PersistenceException {
        String result = null;

        if (handle.contains(" ")) {
            result = "Handle may not contain a space";
        }

        if (!StringUtils.containsOnly(handle, HANDLE_ALPHABET, false)) {
            result = "The handle may contain only letters, numbers and " + HANDLE_PUNCTUATION;
            return result;
        }

        if (StringUtils.containsOnly(handle, HANDLE_PUNCTUATION, false)) {
            result = "The handle may not contain only punctuation.";
            return result;
        }

        if (handle.toLowerCase().trim().startsWith("admin")) {
            result = "Please choose another handle, not starting with admin.";
            return result;
        }
        if (checkInvalidHandle(handle)) {
            result = "The handle you entered is not valid.";
            return result;
        }

        return result;
    }

    /**
     * Checks whether given handle exactly matches invalid handle in persistence.
     *
     * @param handle
     *            the handle to check
     * @return true, if given handle exactly matches invalid handle in persistence, false otherwise
     * @throws PersistenceException
     *             If there is any DB error.
     * @since 1.1
     */
    private static boolean checkExactMatch(String handle) throws PersistenceException {
        // check if the handle is an exact match in the list of bad words
        return DataProvider.isExactInvalidHandle(handle);
    }

    /**
     * <p>
     * Checks given handle against table of invalid handles.
     * </p>
     * <p>
     * Finds such invalid handle that could be made from given handle removing leading and trailing numbers or
     * adding plural affixes.
     * </p>
     *
     * @param handle
     *            the handle to check
     * @return true, if given handle literally match invalid handle or founded such invalid handle that could be
     *         made from given handle removing leading and trailing numbers or adding plural affixes, false
     *         otherwise
     * @throws PersistenceException
     *             If there is any persistence tier error.
     */
    private static boolean checkInvalidHandle(String handle) throws PersistenceException {
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
     * Checks that given handle without some quantity of leading/trailing numbers equal to invalid handle.
     *
     * @param handle
     *            the handle to check
     * @return true if given handle without some quantity of leading/trailing numbers equal to invalid handle,
     *         false otherwise
     * @throws PersistenceException
     *             If there is any persistence error.
     */
    private static boolean checkLeadingTrailingNumbers(String handle) throws PersistenceException {
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
     * Checks that given handle with extracted group that matches given pattern equal to invalid handle.
     *
     * @param handle
     *            the handle to check
     * @param pattern
     *            the pattern to be extracted from handle
     * @return true if given handle with extracted group matches given pattern equal to invalid handle, false
     *         otherwise
     * @throws PersistenceException
     *             If there is any Persistence error.
     */
    private static boolean checkAgainstPattern(String handle, Pattern pattern) throws PersistenceException {
        Matcher matcher = pattern.matcher(handle);
        if (matcher.matches()) {
            String extractedHandle = matcher.group(1);
            if (!extractedHandle.equals(handle) && extractedHandle.length() > 0) {
                return checkExactMatch(extractedHandle);
            }
        }
        return false;
    }

    /**
     * This utility method checks if the given string is null or empty.
     *
     * @param s
     *            String to check.
     * @return true if the given string is null or empty; false otherwise.
     */
    public static boolean isNullOrEmptyString(String s) {
        return null == s || s.trim().length() == 0;
    }

}
