package com.topcoder.common.web.error;


public class InquiryAlreadyExistsException extends TCException {


    /**
     * Constructor with no arguments
     */
    public InquiryAlreadyExistsException() {
    }


    /**
     * Constructor for handler with error message as parameter
     */
    public InquiryAlreadyExistsException(String message) {
        super(message);
    }


}
