package com.topcoder.common.web.error;


public class MaxCoderSchoolException extends TCException {


    /**
     * Constructor with no arguments
     */
    public MaxCoderSchoolException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public MaxCoderSchoolException(String message) {
        super(message);
    }


}
