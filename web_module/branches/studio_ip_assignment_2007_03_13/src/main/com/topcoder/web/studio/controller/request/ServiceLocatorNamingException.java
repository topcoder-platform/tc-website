package com.topcoder.web.studio.controller.request;

/**
 * 
 * @author Bauna
 * @version 1.0
 */
public class ServiceLocatorNamingException extends Exception {

    /**
     * 
     */
    public ServiceLocatorNamingException() {
        super();
    }

    /**
     * @param message
     */
    public ServiceLocatorNamingException(String message) {
        super(message);
    }

    /**
     * @param cause
     */
    public ServiceLocatorNamingException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message
     * @param cause
     */
    public ServiceLocatorNamingException(String message, Throwable cause) {
        super(message, cause);
    }

}
