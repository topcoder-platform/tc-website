package com.topcoder.common.web.error;


public class SurveyDatePassedException extends TCException {


    /**
     * Constructor with no arguments
     */
    public SurveyDatePassedException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public SurveyDatePassedException(String message) {
        super(message);
    }


}
