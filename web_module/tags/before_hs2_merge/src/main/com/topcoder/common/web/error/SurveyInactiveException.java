package com.topcoder.common.web.error;


public class SurveyInactiveException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SurveyInactiveException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SurveyInactiveException(String message) {
        super(message);
    }


}
