package com.topcoder.shared.security;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 15, 2003 6:30:49 PM
 */

public class AuthorizationException extends Exception {

    public AuthorizationException() {
    }
    public AuthorizationException(String message) {
        super(message);
    }
    public AuthorizationException(Throwable t) {
        super(t);
    }
    public AuthorizationException(String message, Throwable t) {
        super(message, t);
    }
}
