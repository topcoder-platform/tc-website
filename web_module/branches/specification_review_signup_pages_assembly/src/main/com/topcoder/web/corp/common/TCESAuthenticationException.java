package com.topcoder.web.corp.common;

/**
 * Thrown if a TCES resource is accessed without proper authentication.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class TCESAuthenticationException
        extends Exception {
    public TCESAuthenticationException() {
        super();
    }

    public TCESAuthenticationException(String message) {
        super(message);
    }

    public TCESAuthenticationException(Throwable t) {
        super(t.getMessage());
    }
}
