package com.topcoder.web.screening.common;

/**
 * Exception to indicate that a login is required.
 * @author Porgery
 */
public class AnonymousUserException extends ScreeningException {
    
    /**
     * Creates a new instance of <code>AnonymousUserException</code> without detail message.
     */
    public AnonymousUserException() {
    }
    
    
    /**
     * Constructs an instance of <code>AnonymousUserException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public AnonymousUserException(String msg) {
        super(msg);
    }
    
    /**
     * <p>
     * Constructor taking a nested exception
     * </p>
     *
     * @param nestedException the nested exception
     */
    public AnonymousUserException(Throwable nestedException)
    {
        super(nestedException);
    }

    /**
     * <p>
     * Constructor taking a nested exception and a string
     * </p>
     *
     * @param message the message of this exception
     * @param nestedException the nested exception
     */
    public AnonymousUserException(String message, Throwable nestedException)
    {
        super(message, nestedException);
    }
    
}
