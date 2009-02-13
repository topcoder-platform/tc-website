package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This is an exception class used by the data interface bean
 * and EJB in response to an invalid update request from the user.
 *
 * @author  Dave Pecora
 * @version 1.00, 04/01/2002
 */

public class IllegalUpdateException extends Exception {
    /**
     * Constructs a <code>IllegalUpdateException</code> object
     * with no message.
     */
    public IllegalUpdateException() {
        super();
    }

    /**
     * Constructs a <code>IllegalUpdateException</code> object
     * with no message.
     */
    public IllegalUpdateException(String s) {
        super(s);
    }
}
