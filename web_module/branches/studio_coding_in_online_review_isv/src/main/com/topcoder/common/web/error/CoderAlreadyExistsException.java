package com.topcoder.common.web.error;


public class CoderAlreadyExistsException extends TCException {


    /**
     * Constructor with no arguments
     */
    public CoderAlreadyExistsException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public CoderAlreadyExistsException(String message) {
        super(message);
    }


}
