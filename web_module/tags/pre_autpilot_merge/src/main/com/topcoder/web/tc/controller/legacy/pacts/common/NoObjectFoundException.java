package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This is an exception class used by the data interface bean
 * and EJB to indicate that no such object exists.  This is
 * given in response to a user request to retrieve or update
 * a nonexistent object.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class NoObjectFoundException extends Exception {
    /**
     * Constructs a <code>NoObjectFoundException</code> object
     * with no message.
     */
    public NoObjectFoundException() {
        super();
    }

    /**
     * Constructs a <code>NoObjectFoundException</code> object
     * with no message.
     */
    public NoObjectFoundException(String s) {
        super(s);
    }
}
