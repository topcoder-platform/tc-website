package com.topcoder.security;

/**
 * Thrown when a subject does not have access to a given permission or set of permissions.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class NotAuthorizedException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public NotAuthorizedException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs the NotAuthorizedException with the
     *                specified message that describes the exception
     */
    public NotAuthorizedException(String message) {
        super(message);
    }

}
