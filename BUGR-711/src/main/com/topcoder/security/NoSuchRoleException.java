package com.topcoder.security;

/**
 * Thrown when a role is not defined in the database.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */

//currently not used

public class NoSuchRoleException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public NoSuchRoleException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs theNoSuchRoleException with the
     *                specified message that describes the exception
     */
    public NoSuchRoleException(String message) {
        super(message);
    }
}
