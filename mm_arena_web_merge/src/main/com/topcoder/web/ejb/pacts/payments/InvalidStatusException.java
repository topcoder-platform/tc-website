/*
* InvalidStatusException
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class InvalidStatusException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public InvalidStatusException() {
    }

    /**
     * @param message
     */
    public InvalidStatusException(String message) {
        super(message);
    }

    /**
     * @param cause
     */
    public InvalidStatusException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message
     * @param cause
     */
    public InvalidStatusException(String message, Throwable cause) {
        super(message, cause);
    }

}
