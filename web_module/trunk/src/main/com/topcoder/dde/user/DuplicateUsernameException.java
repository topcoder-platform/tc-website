package com.topcoder.dde.user;

import com.topcoder.dde.DDEException;

/**
 * This exception is thrown when someone tries to create a user with a username
 * that already exists.  Usernames should be unique.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class DuplicateUsernameException extends DDEException {

    public DuplicateUsernameException() {
        super();
    }

    public DuplicateUsernameException(String message) {
        super(message);
    }

}
