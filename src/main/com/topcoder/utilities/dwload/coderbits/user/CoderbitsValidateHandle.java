/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.coderbits.user;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.topcoder.web.common.StringUtils;

/**
 * This class is commonly use to validate the coderbits handle and/or password.
 *
 * @author TMALBONPH
 * @version 1.0
 */
public final class CoderbitsValidateHandle {

    /**
     * Logger.
     */
    private static final Logger LOG = LogManager.getLogger(CoderbitsValidateHandle.class);

    /**
     * The max handle length.
     */
    public final static int MAX_HANDLE_LENGTH = 30; //15;

    /**
     * The min handle length
     */
    public final static int MIN_HANDLE_LENGTH = 2;

    /**
     * The punctuation allowed in the password.
     */
    public final static String PUNCTUATION = "-_.{}[]()";

    /**
     * The punctuation allowed in the handle.
     */
    public final static String HANDLE_PUNCTUATION = "-_.{}[]";

    /**
     * The alphabets the handle can contain.
     */
    public final static String HANDLE_ALPHABET = StringUtils.ALPHABET_ALPHA_EN +
            StringUtils.ALPHABET_DIGITS_EN + HANDLE_PUNCTUATION;

    /**
     * The alphabets the password can contain.
     */
    public final static String PASSWORD_ALPHABET = StringUtils.ALPHABET_ALPHA_EN +
            StringUtils.ALPHABET_DIGITS_EN + PUNCTUATION;

    /**
     * <p>
     * Represents list of patterns to extract invalid handle.
     * </p>
     * <p>
     * Initialised in a place and never changed after.
     * </p>
     */
    private final static Pattern[] INVALID_HANDLE_PATTERNS = new Pattern[] {Pattern.compile("(.*?)es"),
        Pattern.compile("(.*?)s"), Pattern.compile("_*(.*?)_*")};

    /**
     * DB connection. Only set during call to validateHandle().
     */
    private static Connection connection;

    /**
     * Default constructor, hidden to prevent instantiation.
     */
    private CoderbitsValidateHandle() {
        // Does nothing.
    }

    /**
     * Clear Connection handle.
     */
    public static void clear() {
        CoderbitsValidateHandle.connection = null;
    }

    /**
     * <p>
     * This method would validate if the given handle is valid and non-offensive.
     * </p>
     * <p>
     * @see Excerpted from ~/web/src/main/com/topcoder/reg/RegistrationHelper.java
     * </p>
     *
     * @param connection the DB connection.
     * @param handle
     *            The handle to check, assumed not null.
     * @return null if the given handle is available, valid and non-offensive; error description there there is at
     *         least one violated discipline.
     * @throws PersistenceException
     *             If there is any error while validating against DB for invalid handles.
     */
    public static String validateHandle(Connection connection, final String handle) throws Exception {
        String result = null;
        CoderbitsValidateHandle.connection = connection;

        if (handle.contains(" ")) {
            result = "Handle may not contain a space";
            return result;
        }

        int limit = handle.length();
        if (limit < MIN_HANDLE_LENGTH) {
            result = "Handle too short. The minimum handle size must be (" + MIN_HANDLE_LENGTH + ")";
            return result;
        }

        if (limit > MAX_HANDLE_LENGTH) {
            result = "Handle too long. The maximum handle size must be (" + MAX_HANDLE_LENGTH + ")";
            return result;
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
     * <p>
     * Checks whether given handle exactly matches invalid handle in persistence.
     * </p>
     * <p>
     * @see Simple version of codes from ~/web/src/main/com/topcoder/reg/RegistrationHelper.java
     * </p>
     *
     * @param handle
     *            the handle to check
     * @return true, if given handle exactly matches invalid handle in persistence, false otherwise
     * @throws Exception is Thrown
     *             If there is any DB error.
     */
    private static boolean checkExactMatch(String handle) throws Exception {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean result = false;
        // check if the handle is an exact match in the list of bad words
        if (null != connection) {
            try {
                // from ~/scripts/informixoltp/query_tool/query_invalid_handle.txt
                String sql = "SELECT invalid_handle FROM invalid_handles WHERE invalid_handle = '" + handle + "'";
                stmt = connection.prepareStatement(sql);
                rs = stmt.executeQuery();
                result = rs.next();
                LOG.debug(String.format("Handle '%s' is %s", handle, result ? "not valid" : "valid"));
            } catch (SQLException e) {
                LOG.error("DB Error while testing validity of handle '" + handle + "'", e);
                throw e;
            } finally {
                close(stmt, rs);
            }
        }
        return result;
    }

    /**
     * Closes given resources gracefully.
     * Any argument can be null.
     *
     * @param stmt Statement.
     * @param rs Result set.
     */
    private static void close(Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            LOG.error("Error during closig result set.", e);
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            LOG.error("Error during closing prepared statement.", e);
        }
    }

    /**
     * <p>
     * Checks that given handle with extracted group that matches given pattern equal to invalid handle.
     * </p>
     * <p>
     * @see Excerpted from ~/web/src/main/com/topcoder/reg/RegistrationHelper.java
     * </p>
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
    private static boolean checkAgainstPattern(String handle, Pattern pattern) throws Exception {
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
     * <p>
     * Checks that given handle without some quantity of leading/trailing numbers equal to invalid handle.
     * </p>
     * <p>
     * @see Excerpted from ~/web/src/main/com/topcoder/reg/RegistrationHelper.java
     * </p>
     *
     * @param handle
     *            the handle to check
     * @return true if given handle without some quantity of leading/trailing numbers equal to invalid handle,
     *         false otherwise
     * @throws PersistenceException
     *             If there is any persistence error.
     */
    private static boolean checkLeadingTrailingNumbers(String handle) throws Exception {
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
     * <p>
     * Checks given handle against table of invalid handles.
     * </p>
     * <p>
     * Finds such invalid handle that could be made from given handle removing leading and trailing numbers or
     * adding plural affixes.
     * </p>
     * <p>
     * @see Excerpted from ~/web/src/main/com/topcoder/reg/RegistrationHelper.java
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
    private static boolean checkInvalidHandle(String handle) throws Exception {
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

}
