package com.topcoder.shared.security;

/**
 * Thrown if security resource is accessed without proper authentication.
 * 
 * 
 * @author Greg Paul
 * @author bigjake <kitz@mit.edu>
 * @author  djFD molc@mail.ru
 * @version 1.02
 */
public class AuthenticationException extends Exception {

    /**
     * 
     */
    public AuthenticationException() {
        super();
    }

    /**
     * 
     * @see java.lang.Throwable#Throwable(String)
     */
    public AuthenticationException(String message) {
        super(message);
    }

    /**
     * 
     * @see java.lang.Throwable#Throwable(Throwable)
     */
    public AuthenticationException(Throwable t) {
        super(t); //.getMessage());
    }

    /**
     * 
     * @param message
     * @param page
     */
    public AuthenticationException(String message, String page) {
        super(message);
    }
}
