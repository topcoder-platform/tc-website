package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;

/**
 * Throw this if an attempt is made to login before a user has activated
 * thier account.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class UserNotActivatedException extends DDEException {

    public UserNotActivatedException() {
        super();
    }

    public UserNotActivatedException(String message) {
        super(message);
    }

}
