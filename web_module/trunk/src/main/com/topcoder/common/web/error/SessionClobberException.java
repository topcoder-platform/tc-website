package com.topcoder.common.web.error;


public class SessionClobberException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SessionClobberException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SessionClobberException(String message) {
        super(message);
    }


}
