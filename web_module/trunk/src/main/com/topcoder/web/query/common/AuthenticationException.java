package com.topcoder.web.query.common;

/**
 * Thrown if a query tool resource is accessed without proper authentication.
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 */

public class AuthenticationException extends Exception {

    public AuthenticationException() {
        super();
    }

    public AuthenticationException(String message) {
        super(message);
    }

    public AuthenticationException(Throwable t) {
        super(t.getMessage());
    }
}
