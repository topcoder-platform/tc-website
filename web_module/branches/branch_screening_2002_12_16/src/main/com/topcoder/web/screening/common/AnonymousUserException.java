package com.topcoder.web.screening.common;

/**
 * Exception to indicate that a login is required.
 * @author Porgery
 */
public class AnonymousUserException extends ScreeningException {
    
    /** Holds value of property redirect. */
    private String redirect;
    
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
     * Constructs an instance of <code>AnonymousUserException</code> with the specified detail message.
     * @param msg the detail message.
     */
    public AnonymousUserException(String msg, String redirect) {
        super(msg);
        setRedirect(redirect);
    }
    
    /** Getter for property redirect.
     * @return Value of property redirect.
     */
    public String getRedirect() {
        return this.redirect;
    }
    
    /** Setter for property redirect.
     * @param redirect New value of property redirect.
     */
    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }
    
}
