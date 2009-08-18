package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;

/**
 * Throw this if an attempt is made to update or remove a user that doesn't
 * exist.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class NoSuchUserException extends DDEException {

    public NoSuchUserException() {
        super();
    }

    public NoSuchUserException(String message) {
        super(message);
    }

}
