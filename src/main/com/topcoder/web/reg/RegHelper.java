/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.InvalidHandleDAOException;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;

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
 * <p>
 * Change log for version 1.2
 * <ul>
 * <li>Add method {@link #addSecurityStuff(User)}</li>
 * <li>Add method {@link #revertSecurityStuff(User, Exception)}</li>
 * <li>Add method {@link #validate(UserDTO)} </li>
 * <li>Add method {@link #populateUser(UserDTO)} </li>
 * <li>Add constant {@link #EMAIL_REGEX}</li>
 * <li>Add constant {@link #VALID_EMAIL_PATTERN}</li>
 * <li>Add constant {@link #CAPTCHA_APPLICATION_KEY}</li>
 * <li>Add constant {@link #CAPTCHA_RELATIVE_DIR}</li>
 * </ul>
 * </p>
 * 
 * @author live_world, leo_lol
 * @version 1.2
 * @since 1.0
 */
public final class RegHelper {

    /**
     * Represents the logger.
     */
    protected static final Logger LOGGER = Logger.getLogger(RegHelper.class);

    /**
     * Email regular expression.
     */
    private static final String EMAIL_REGEX = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    /**
     * Represents the valid email pattern. It's declared public on purpose so
     * that other class may access it there is a need.
     */
    public static final Pattern VALID_EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);

    /**
     * This is the key, referencing the id-captcha_word map.
     */
    public static final String CAPTCHA_APPLICATION_KEY = "captcha_application_key";

    /**
     * This constant stores the relative path of captcha images.
     */
    public static final String CAPTCHA_RELATIVE_DIR = "i/captcha/";

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
    private static final Pattern[] INVALID_HANDLE_PATTERNS = new Pattern[] { Pattern.compile("(.*?)es"),
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
     * This method would validate {@link UserDTO}.
     * 
     * @param userDTO
     *            UserDTO to validate.
     * @return An instance of {@link Map} containing validation result.
     */
    public static Map<String, String> validate(UserDTO userDTO) {
        if (null == userDTO) {
            throw new IllegalArgumentException("userDTO cannot be null");
        }
        Map<String, String> info = new HashMap<String, String>();
        if (isEmptyString(userDTO.getFirstName())) {
            info.put("firstName", "First name is required");
        }

        if (isEmptyString(userDTO.getLastName())) {
            info.put("lastName", "Last name is required");
        }

        // check if the handle is valid.
        String handleValidationResult = RegHelper.validateHandle(userDTO.getHandle());
        if (null != handleValidationResult) {
            info.put("handle", handleValidationResult);
        }

        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();

        // check handle availability
        if (!info.containsKey("handle")) {
            if (userDAO.find(userDTO.getHandle(), true) != null) {
                info.put("handle", "The handle - '" + userDTO.getHandle()
                        + "' is already registered, please use another one.");
            }
        }

        if (isEmptyString(userDTO.getPassword())) {
            info.put("password", "Password is required");
        }

        if (isEmptyString(userDTO.getEmail())) {
            info.put("email", "Email is required");
        } else {
            Matcher matcher = RegHelper.VALID_EMAIL_PATTERN.matcher(userDTO.getEmail().trim());
            if (!matcher.matches()) {
                info.put("email", "Please input valid email address");
            } else {
                if (userDAO.find(null, null, null, userDTO.getEmail().trim()).size() > 0) {
                    info.put("email", "The email - '" + userDTO.getEmail()
                            + "' is already registered, please use another one.");
                }
            }
        }

        if (!info.containsKey("password") && !userDTO.getPassword().equals(userDTO.getConfirmPassword())) {
            info.put("password", "password and confirm password should be exactly same");
        }

        return info;
    }

    /**
     * This class is to populate the {@link User} instance according to
     * front-end input data.
     * 
     * @param userDTO
     *            From which to populate User instance. Not null.
     * @return Instance of {@link User}.
     */
    public static User populateUser(UserDTO userDTO) {
        if (null == userDTO) {
            throw new IllegalArgumentException("userDTO cannot be null");
        }
        User user = new User();
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setHandle(userDTO.getHandle());
        if (null != userDTO.getEmail()) {
            Email emailAdd = new Email();
            emailAdd.setAddress(userDTO.getEmail());
            emailAdd.setPrimary(Boolean.TRUE);
            emailAdd.setEmailTypeId(Email.TYPE_ID_PRIMARY);
            emailAdd.setStatusId(Email.STATUS_ID_UNACTIVE);
            emailAdd.setUser(user);
            user.addEmailAddress(emailAdd);
        }
        user.setPassword(userDTO.getPassword());
        // create a new coder record
        Coder coder = new Coder();
        // coder.setCompCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        // coder.setCoderType(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL));
        user.setCoder(coder);
        return user;
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
     * @return null if the given handle is available, valid and non-offensive;
     *         error description there there is at least one violated
     *         discipline.
     * @since 1.1
     */
    public static String validateHandle(String handle) {
        String result = null;
        // check empty
        if (isEmptyString(handle)) {
            result = "Please fill your handle";
            return result;
        }

        handle = handle.trim();

        // check length
        final int len = handle.length();

        if (len < Constants.MIN_HANDLE_LENGTH) {
            result = "The handle must be at least " + Constants.MIN_HANDLE_LENGTH + " characters long.";
            return result;
        }

        if (len > Constants.MAX_HANDLE_LENGTH) {
            result = "The handle must be at most " + Constants.MAX_HANDLE_LENGTH + " characters long.";
            return result;
        }

        if (!StringUtils.containsOnly(handle, Constants.HANDLE_ALPHABET, false)) {
            result = "The handle may contain only letters, numbers and " + Constants.HANDLE_PUNCTUATION;
            return result;
        }

        if (StringUtils.containsOnly(handle, Constants.HANDLE_PUNCTUATION, false)) {
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

    /**
     * Adds the user to security groups.
     * 
     * @param user
     *            the user to be created
     * @throws Exception
     *             any exception while creation
     * @since 1.1
     */
    @SuppressWarnings("unchecked")
    public static void addSecurityStuff(User user) throws Exception {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            // 132456 is a dump user id for creating user.this is from existing
            // code.
            TCSubject tcs = new TCSubject(132456);

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            // create the security user entry
            UserPrincipal myPrincipal = pmr.createUser(user.getId(), user.getHandle(), user.getPassword(), tcs,
                    DBMS.JTS_OLTP_DATASOURCE_NAME);

            // add them to these two as well. eventually i'm guessing we'll
            // rearrange security and this'll change
            Collection<GroupPrincipal> groups = pmr.getGroups(tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            GroupPrincipal anonGroup = RegHelper.findGroupPrincipal(groups, "Anonymous");
            if (anonGroup != null) {
                pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }
            GroupPrincipal userGroup = RegHelper.findGroupPrincipal(groups, "Users");
            if (userGroup != null) {
                pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            // refresh the cached object
            SecurityHelper.getUserSubject(user.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } finally {
            RegHelper.closeContext(LOGGER, ctx);
        }

    }

    /**
     * Reverts the security stuff.
     * 
     * @param user
     *            the User to revert
     * @param exception
     *            the occurred exception
     */
    public static void revertSecurityStuff(User user, Exception exception) throws Exception {
        if (user != null && user.getId() != null) {
            Context ctx = null;
            try {
                ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemote pmr = pmrh.create();
                pmr.removeUser(new UserPrincipal("", user.getId().longValue()), new TCSubject(132456));

            } catch (Throwable ex) {
                throw new Exception("problem in exception callback for user: " + user.getId() + " "
                        + exception.getMessage(), ex);
            } finally {
                RegHelper.closeContext(LOGGER, ctx);
            }
        }
    }
}