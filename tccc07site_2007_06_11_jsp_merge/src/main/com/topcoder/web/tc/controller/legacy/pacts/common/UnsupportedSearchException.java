package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.NavigationException;

/**
 * This is an exception class used by the data interface bean
 * to indicate an attempt to call a search routine with search
 * criteria unsupported by the routine.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class UnsupportedSearchException extends NavigationException {
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
