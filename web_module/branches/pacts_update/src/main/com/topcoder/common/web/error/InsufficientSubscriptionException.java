package com.topcoder.common.web.error;


public class InsufficientSubscriptionException extends TCException {


    /**
     * Constructor with no arguments
     */
    public InsufficientSubscriptionException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public InsufficientSubscriptionException(String message) {
        super(message);
    }


}
