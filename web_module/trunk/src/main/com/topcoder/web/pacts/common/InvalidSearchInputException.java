package com.topcoder.web.pacts.common;

/**
 * This is an exception class used by the data interface bean
 * to indicate that an input criterion to a search routine was
 * invalid.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class InvalidSearchInputException extends Exception {
    /**
     * Constructs a <code>InvalidSearchInputException</code> object
     * with no message.
     */
    public InvalidSearchInputException() {
        super();
    }

    /**
     * Constructs a <code>InvalidSearchInputException</code> object
     * with no message.
     */
    public InvalidSearchInputException(String s) {
        super(s);
    }
}
