package com.topcoder.web.common;

/**
 * Thrown by RequestProcessors to indicate an error caused by a malformed request.
 *
 * @author Ambrose Feinstein
 */
public class NavigationException extends Exception {

    public NavigationException(String s) {
        super(s);
    }

    public NavigationException(Exception e) {
        super(e.getMessage());
    }
}
