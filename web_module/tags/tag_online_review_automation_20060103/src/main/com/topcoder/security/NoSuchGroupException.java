package com.topcoder.security;

/**
 * Thrown when a group is not defined in the database.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */

//currently not used

public class NoSuchGroupException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public NoSuchGroupException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs theNoSuchGroupException with the
     *                specified message that describes the exception
     */
    public NoSuchGroupException(String message) {
        super(message);
    }
}
