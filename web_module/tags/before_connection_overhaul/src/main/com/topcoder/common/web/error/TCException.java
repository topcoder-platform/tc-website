package com.topcoder.common.web.error;

public class TCException extends Exception {
    /**
     * Constructor with no arguments
     */
    public TCException() {
    }

    /**
     * Constructor for handler with error message as parameter
     */
    public TCException(String message) {
        super(message);
    }

}
