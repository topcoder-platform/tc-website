package com.topcoder.shared.security;

/**
 * Thrown by methods in Authentication.
 *
 * @author Greg Paul
 */ 
public class AuthenticationException extends Exception {

    public AuthenticationException(String s) {
        super(s);
    }

    public AuthenticationException(Exception e) {
        super(e.getMessage());
    }
}
