package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.TCWebException;

/**
 * This is an exception class used by the data interface bean
 * and EJB to indicate that no such status exists.  This is
 * given in response to a user request to update an object status
 * to an invalid status.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class NoSuchStatusException extends TCWebException {
    /**
     * Constructs a <code>NoSuchStatusException</code> object
     * with no message.
     */
    public NoSuchStatusException() {
        super();
    }

    /**
     * Constructs a <code>NoSuchStatusException</code> object
     * with no message.
     */
    public NoSuchStatusException(String s) {
        super(s);
    }
}
