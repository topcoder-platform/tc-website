package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.NavigationException;

/**
 * This is an exception class used by the data interface bean
 * to indicate that an input criterion to a search routine was
 * invalid.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class InvalidSearchInputException extends NavigationException {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

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
