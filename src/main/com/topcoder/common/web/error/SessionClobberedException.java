package com.topcoder.common.web.error;


public class SessionClobberedException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SessionClobberedException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SessionClobberedException(String message) {
        super(message);
    }


}
