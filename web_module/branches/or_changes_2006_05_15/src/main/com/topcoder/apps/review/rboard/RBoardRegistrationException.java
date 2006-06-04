package com.topcoder.apps.review.rboard;

import javax.ejb.EJBException;

public class RBoardRegistrationException extends EJBException {
    /**
     * Constructor with no arguments
     */
    public RBoardRegistrationException() {
    }

    /**
     * Constructor for handler with error message as parameter
     */
    public RBoardRegistrationException(String message) {
        super(message);
    }

}
