package com.topcoder.security.login;

import com.topcoder.security.GeneralSecurityException;

/**
 * Thrown when a login is no longer valid due to an expired account.
 *
 * Note: This is for future use and need not be implemented at this phase.
 */
public class LoginExpiredException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public LoginExpiredException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs the LoginExpiredException with the
     *                specified message that describes the exception
     */
    public LoginExpiredException(String message) {
        super(message);
    }

}
