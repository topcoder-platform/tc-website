package com.topcoder.web.common;

/**
 * Thrown by RequestProcessors to indicate an error caused by a malformed request.
 *
 * @author Ambrose Feinstein
 */
public class NavigationException extends TCWebException {
    public NavigationException() {
        super();
    }
    public NavigationException(String message) {
        super(new Exception(message));
    }
    public NavigationException(Throwable nestedException) {
        super("Sorry, the resource you requested does not exist.", nestedException);
    }
    public NavigationException(String message, Throwable nestedException) {
        super(message, nestedException);
    }
}

