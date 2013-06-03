/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap;

import com.topcoder.util.errorhandling.BaseException;

/**
 * <p>A checked exception to be thrown by <code>LDAPClient</code> to indicate on errors encountered while communicating,
 * authenticating to <code>LDAP</code> server or managing <code>LDAP</code> entries.</p>
 *
 * <p>
 * Version 1.1 (Impersonation Login Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #isUnknownUserHandle()} method.</li>
 *   </ol>
 * </p>
 *
 * @author isv
 * @version 1.1 (LDAP Authentication Release Assembly v1.0)
 */
public class LDAPClientException extends BaseException {

    /**
     * <p>An <code>int</code> providing the error code for the case when there is an attempt to login by user who have
     * their account set with not <code>Active</code> status.</p>
     */
    private static final int USER_NOT_ACTIVE = 1;

    /**
     * <p>An <code>int</code> providing the error code for the case when there is an attempt to login by user who have
     * provided invalid credentials for authentication.</p>
     */
    private static final int INVALID_CREDENTIALS = 2;

    /**
     * <p>An <code>int</code> providing the error code for the case when there is an unexpected error encountered.</p>
     */
    private static final int UNEXPECTED_ERROR = 3;

    /**
     * <p>An <code>int</code> providing the error code for the case when there is no <code>LDAP</code> entry found
     * matching the specified user ID.</p>
     */
    private static final int UNKNOWN_USER_ID = 4;

    /**
     * <p>An <code>int</code> providing the error code for the case when there is no <code>LDAP</code> entry found
     * matching the specified user handle.</p>
     */
    private static final int UNKNOWN_USER_HANDLE = 5;

    /**
     * <p>An <code>int</code> providing the error code referencing the concrete cause of failure.</p>
     */
    private int errorCode = 0;

    /**
     * <p>Constructs new <code>LDAPClientException</code> instance with specified message and error code referencing the
     * case for the error.</p>
     *
     * @param message a <code>String</code> providing the description for the error.
     * @param errorCode an <code>int</code> providing the error code to be used to distinguish the error cases.
     */
    private LDAPClientException(String message, int errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    /**
     * <p>Constructs new <code>LDAPClientException</code> instance </p>
     *
     * @param message a <code>String</code> providing the description for the error.
     * @param cause a <code>Throwable</code> providing the original cause of error.
     * @param errorCode an <code>int</code> providing the error code to be used to distinguish the error cases.
     */
    private LDAPClientException(String message, Throwable cause, int errorCode) {
        super(message, cause);
        this.errorCode = errorCode;
    }

    /**
     * <p>A factory method to be used for creating exceptions indicating that there is an attempt to login by user who
     * don't have their account set with <code>Active</code> state.</p>
     *
     * @param handle a <code>String</code> providing the username for user who have triggered this exception.
     * @return a <code>LDAPClientException</code> to be thrown. 
     */
    static LDAPClientException createUserNotActiveException(String handle) {
        LDAPClientException exception =
            new LDAPClientException("Account for user '" + handle  + "' is not active", USER_NOT_ACTIVE);
        return exception;
    }

    /**
     * <p>A factory method to be used for creating exceptions indicating that there is an attempt to login by user who
     * don't have their account set with <code>Active</code> state.</p>
     *
     * @param handle a <code>String</code> providing the username for user who have triggered this exception.
     * @return a <code>LDAPClientException</code> to be thrown.
     */
    static LDAPClientException createInvalidCredentialsException(String handle) {
        LDAPClientException exception
            = new LDAPClientException("Could not authenticate user " + handle + " due to invalid credentials",
                                      INVALID_CREDENTIALS);
        return exception;
    }

    /**
     * <p>A factory method to be used for creating exceptions indicating that there is an unexpected error encountered
     * while communicating to <code>LDAP</code> server or managing entries in <code>LDAP</code> directory.</p>
     *
     * @param cause a <code>Throwable</code> providing the original cause of error.
     * @return a <code>LDAPClientException</code> to be thrown.
     */
    static LDAPClientException createUnexpectedErrorException(Throwable cause) {
        return new LDAPClientException("LDAPClient failed to perform due to unexpected error", cause, UNEXPECTED_ERROR);
    }

    /**
     * <p>A factory method to be used for creating exceptions indicating that there were no <code>LDAP</code> entry
     * found corresponding to <code>TopCoder</code> member account with specified ID.</p>
     *
     * @param userId a <code>long</code> providing the user ID.
     * @return a <code>LDAPClientException</code> to be thrown.
     */
    static LDAPClientException createUserIDNotFoundException(long userId) {
        LDAPClientException exception =
            new LDAPClientException("Could not find TopCoder member LDAP entry for user ID: " + userId,
                                    UNKNOWN_USER_ID);
        return exception;
    }

    /**
     * <p>A factory method to be used for creating exceptions indicating that there were no <code>LDAP</code> entry
     * found corresponding to <code>TopCoder</code> member account with specified handle.</p>
     *
     * @param handle a <code>String</code> providing the user handle.
     * @return a <code>LDAPClientException</code> to be thrown.
     */
    static LDAPClientException createUserHandleNotFoundException(String handle) {
        LDAPClientException exception =
            new LDAPClientException("Could not find TopCoder member LDAP entry for user handle: " + handle,
                                    UNKNOWN_USER_HANDLE);
        return exception;
    }

    /**
     * <p>Checks if this exception indicates on case when there is an attempt to login by user who have their account
     * set with not <code>Active</code> status.</p>
     *
     * @return <code>true</code> if user account is not active; <code>false</code> otherwise.
     */
    public boolean isUserStatusNotActive() {
        return this.errorCode == USER_NOT_ACTIVE;
    }

    /**
     * <p>Checks if this exception indicates on case when there is an attempt to login by user who have provided invalid
     * credentials for authentication.</p>
     *
     * @return <code>true</code> if user can not be successfully authenticated due to invalid credentials;
     *         <code>false</code> otherwise.
     */
    public boolean isInvalidCredentialProvided() {
        return this.errorCode == INVALID_CREDENTIALS;
    }

    /**
     * <p>Checks if this exception indicates on case when there is an unexpected error encountered while communicating
     * to <code>LDAP</code> server or managing entries in <code>LDAP</code> directory.</p>  
     *
     * @return <code>true</code> if there was unexpected error encountered; <code>false</code> otherwise.
     */
    public boolean isUnexpectedError() {
        return this.errorCode == UNEXPECTED_ERROR;
    }

    /**
     * <p>Checks if this exception indicates on case when there is no <code>LDAP</code> entry matching the specified
     * user ID have been found.</p> 
     *
     * @return <code>true</code> if there was unexpected error encountered; <code>false</code> otherwise.
     */
    public boolean isUnknownUserId() {
        return this.errorCode == UNKNOWN_USER_ID;
    }

    /**
     * <p>Checks if this exception indicates on case when there is no <code>LDAP</code> entry matching the specified
     * user handle have been found.</p>
     *
     * @return <code>true</code> if there was no LDAP entry matching the user handle found; <code>false</code>
     *         otherwise.
     */
    public boolean isUnknownUserHandle() {
        return this.errorCode == UNKNOWN_USER_HANDLE;
    }
}
