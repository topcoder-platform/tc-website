package com.topcoder.shared.security;

/**
 * Well, it is not very clear what is AuthenticationException... Is it
 * Exception occured in the authentification process? Possible
 * SecurityException is more suitable here. It would include Authentification
 * exceptions as well as Authorization exceptions and, possible some others.
 * 
 * Original skeleton statement says: "Thrown if security resource is accessed
 * without proper authentication." From the context conceptually follow that
 * it rather authorization exception.
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
        super(t.getMessage());
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
