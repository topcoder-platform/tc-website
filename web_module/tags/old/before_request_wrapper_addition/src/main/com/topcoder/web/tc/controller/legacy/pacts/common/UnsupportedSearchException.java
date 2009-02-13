package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This is an exception class used by the data interface bean
 * to indicate an attempt to call a search routine with search
 * criteria unsupported by the routine.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class UnsupportedSearchException extends Exception {
    /**
     * Constructs a <code>UnsupportedSearchException</code> object
     * with no message.
     */
    public UnsupportedSearchException() {
        super();
    }

    /**
     * Constructs a <code>UnsupportedSearchException</code> object
     * with no message.
     */
    public UnsupportedSearchException(String s) {
        super(s);
    }
}
