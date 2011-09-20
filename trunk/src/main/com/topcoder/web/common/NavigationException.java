package com.topcoder.web.common;

/**
 * Thrown by RequestProcessors to indicate an error caused by a malformed request.
 * the message (if given) given will be presented on the error page as well as the url (if present)
 *
 * @author Ambrose Feinstein
 */
public class NavigationException extends TCWebException {
    String url;

    public NavigationException() {
        super();
    }

    public NavigationException(String message) {
        super(message);
    }

    public NavigationException(String message, String url) {
        super(message);
        this.url = url;
    }

    public NavigationException(Throwable nestedException) {
        super("Sorry, the resource you requested does not exist.", nestedException);
    }

    public NavigationException(String message, Throwable nestedException) {
        super(message, nestedException);
    }

    public NavigationException(String message, String url, Throwable nestedException) {
        super(message, nestedException);
        this.url = url;
    }

    public boolean hasUrl() {
        return url != null;
    }

    public String getUrl() {
        return url;
    }

}

