package com.topcoder.web.query.common;

/**
 * Thrown if a query tool resource is accessed without proper authentication.
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 */

public class LoginFailedException extends Exception {

    public LoginFailedException() {
        super();
    }

    public LoginFailedException(String message) {
        super(message);
    }

    public LoginFailedException(Throwable t) {
        super(t.getMessage());
    }

    public LoginFailedException(String message, String page) {
        super(message);
    }
}

