package com.topcoder.common.web.error;


public class SurveyTakenException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SurveyTakenException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SurveyTakenException(String message) {
        super(message);
    }


}
