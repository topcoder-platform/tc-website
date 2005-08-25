package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;

/**
 * Throw this exception if an attempt to register a user fails for reasons
 * other than a duplicate username.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class InvalidRegistrationException extends DDEException {

    public InvalidRegistrationException() {
        super();
    }

    public InvalidRegistrationException(String message) {
        super(message);
    }

}
