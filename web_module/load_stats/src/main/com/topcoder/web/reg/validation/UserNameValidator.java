/*
 * Copyright (C) 2005-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.InvalidHandleDAOException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.SizeValidator;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.Constants;

/**
 * <p>
 * This class provides user name validation.
 * </p>
 * <p>
 * Change log:
 * <p>
 * In version 1.1: Added validation against invalid handles.
 * </p>
 * </p>
 * <p>
 * Thread safety: This class is thread-safety as it's immutable.
 * </p>
 * @author dok, TCSDEVELOPER
 * @version 1.1
 */
public class UserNameValidator implements Validator {

    /**
     * <p>
     * Represents list of patterns to extract invalid handle.
     * </p>
     * <p>
     * Initialized in a place and never changed after.
     * </p>
     * @since 1.1
     */
    private static final Pattern[] INVALID_HANDLE_PATTERNS = new Pattern[] {Pattern.compile("\\d*(.*?)\\d*"),
                                                                            Pattern.compile("(.*?)es"),
                                                                            Pattern.compile("(.*?)s"),
                                                                            Pattern.compile("_*(.*?)_*")};

    /**
     * <p>
     * Represents logger for logging.
     * </p>
     * <p>
     * Initialized in a place and never changed after.
     * </p>
     */
    private static final Logger log = Logger.getLogger(UserNameValidator.class);

    /**
     * Represents user to provide validation on.
     */
    private User u;

    /**
     * Creates an instance of UserNameValidator with given user for validation.
     * @param u the user to provide validation on
     */
    public UserNameValidator(User u) {
        this.u = u;
    }

    /**
     * <p>
     * Validates user's inputted handle against validation rules and invalid handles.
     * </p>
     * <p>
     * Changes in 1.1:
     * <ul>
     * <li>Added validation against invalid handles list</li>
     * </ul>
     * </p>
     * @param input the user's input
     * @return BasicResult instance that could be SUCCESS, if handle is valid and has invalid flag otherwise
     * @throws InvalidHandleDAOException if any error occurs while retrieving user name or invalid handle from
     *             persistence
     */
    public ValidationResult validate(ValidationInput input) {
        log.debug("[Entering method {UserNameValidator#validate()}]");
        log.debug("[Input parameter {" + String.valueOf(input) + "}]");
        ValidationResult ret = null;
        ValidationResult nret = new NonEmptyValidator("Please enter your user name.").validate(input);
        if (nret.isValid()) {
            ValidationResult sret =
                    new SizeValidator(Constants.MIN_HANDLE_LENGTH, Constants.MAX_HANDLE_LENGTH, "user name")
                            .validate(input);
            if (sret.isValid()) {
                String handle = (String) input.getInput();
                // if they're new, or if they are changing their user name
                ValidationResult hret = null;
                if (u.getId() == null || (u.getId() != null && !u.getHandle().equals(input.getInput()))) {
                    // log.debug("in here");
                    hret =
                            new BasicResult(DAOUtil.getFactory().getUserDAO().find(handle, true) == null,
                                    "Please choose another user name.");
                }
                if (hret == null || hret.isValid()) {
                    if (!StringUtils.containsOnly(handle, Constants.HANDLE_ALPHABET, false)) {
                        ret =
                                new BasicResult(false, "Your user name may contain only letters, numbers and "
                                        + Constants.HANDLE_PUNCTUATION);
                    } else if (StringUtils.containsOnly(handle, Constants.HANDLE_PUNCTUATION, false)) {
                        ret = new BasicResult(false, "Your user name may not contain only punctuation.");
                    } else if (handle.toLowerCase().trim().startsWith("admin")) {
                        ret = new BasicResult(false, "Please choose another user name.");
                    } else if (checkInvalidHandle(handle.toLowerCase().trim())) {
                        // new validation against invalid handles
                        ret = new BasicResult(false, "The user name you entered is not valid.");
                    } else {
                        ret = ValidationResult.SUCCESS;
                    }
                } else {
                    ret = hret;
                }
            } else {
                ret = sret;
            }
        } else {
            ret = nret;
        }
        log.debug("[Exiting method {UserNameValidator#validate()}]");
        log.debug("[Output value {" + String.valueOf(ret) + "}]");
        return ret;
    }

    /**
     * <p>
     * Checks given handle against table of invalid handles.
     * </p>
     * <p>
     * Finds such invalid handle that could be made from given handle removing leading and trailing numbers or adding
     * plural affixes.
     * </p>
     * @param handle the handle to check
     * @return true, if given handle literally match invalid handle or founded such invalid handle that could be made
     *         from given handle removing leading and trailing numbers or adding plural affixes, false otherwise
     * @throws InvalidHandleDAOException if any error occurs while retrieving invalid handle from persistence
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
     * Checks that given handle without some quantity of leading/trailing numbers equal to invalid handle.
     * @param handle the handle to check
     * @return true if given handle without some quantity of leading/trailing numbers equal to invalid handle, false
     *         otherwise
     * @throws InvalidHandleDAOException if any error occurs while retrieving invalid handle from persistence
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
     * Checks that given handle with extracted group that matches given pattern equal to invalid handle.
     * @param handle the handle to check
     * @param pattern the pattern to be extracted from handle
     * @return true if given handle with extracted group matches given pattern equal to invalid handle, false otherwise
     * @throws InvalidHandleDAOException if any error occurs while retrieving invalid handle from persistence
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
     * Checks whether given handle exactly matches invalid handle in persistence.
     * @param handle the handle to check
     * @return true, if given handle exactly matches invalid handle in persistence, false otherwise
     * @throws InvalidHandleDAOException if any error occurs while retrieving invalid handle from persistence
     * @since 1.1
     */
    private static boolean checkExactMatch(String handle) {
        // check if the handle is an exact match in the list of bad words
        return DAOUtil.getQueryToolFactory().getInvalidHandleDAO().find(handle) != null;
    }
}