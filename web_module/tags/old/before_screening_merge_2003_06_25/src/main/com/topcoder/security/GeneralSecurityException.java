package com.topcoder.security;

import com.topcoder.util.TCException;

/**
 * A general exception for the security manager. All security related 
 * exceptions should subclass from this exception.
 *
 * @author Heather Van Aelst
 * @version 0.1
 */
public class GeneralSecurityException extends TCException {

    /**
     * Class constructor
     */
    public GeneralSecurityException() {
	super();
    }

    /**
     * Class constructor
     *
     * @param message Constructs the GeneralSecurityException with the
     *                specified message that describes the exception
     */
    public GeneralSecurityException(String message) {
	super(message);
    }

}
