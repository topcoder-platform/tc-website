package com.topcoder.security.login;

import com.topcoder.security.GeneralSecurityException;

/**
 * @author Heather Van Aelst
 * @version 0.1
 */
public class AuthenticationException extends GeneralSecurityException {

    public AuthenticationException() {
        super();
    }

    public AuthenticationException(String message) {
        super(message);
    }

}
