package com.topcoder.common.web.error;


public class SurveyInvalidException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SurveyInvalidException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SurveyInvalidException(String message) {
        super(message);
    }


}
