package com.topcoder.security;

/**
 * Thrown when a user is not defined in the database.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */

//currently not used

public class NoSuchUserException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public NoSuchUserException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs theNoSuchUserException with the
     *                specified message that describes the exception
     */
    public NoSuchUserException(String message) {
        super(message);
    }
}
