package com.topcoder.security.policy;

import com.topcoder.security.GeneralSecurityException;

/**
 * Thrown when an invalid permission type is used.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class InvalidPermissionException extends GeneralSecurityException {

    /**
     * Class constructor
     */
    public InvalidPermissionException() {
        super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs the InvalidPermissionException with the
     *                specified message that describes the exception
     */
    public InvalidPermissionException(String message) {
        super(message);
    }
}
