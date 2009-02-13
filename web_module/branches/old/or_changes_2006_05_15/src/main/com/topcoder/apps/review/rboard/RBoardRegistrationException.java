/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.EJBException;

/**
 * Custom Exception for RBoard registration.
 *
 * @author pulky
 * @version 1.0.0
 */
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
