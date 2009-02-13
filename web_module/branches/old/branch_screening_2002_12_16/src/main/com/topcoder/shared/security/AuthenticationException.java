package com.topcoder.shared.security;

/**
 * An exception that is thrown by Authentication objects whenever
 * authentication fails.
 * @author  Porgery
 */
public class AuthenticationException extends java.lang.Exception {
    
    /**
     * Creates a new instance of <code>AuthenticationException</code> without detail message.
     */
    public AuthenticationException() {
    }
    
    
    /**
     * Constructs an instance of <code>AuthenticationException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public AuthenticationException(String msg) {
        super(msg);
    }
}
