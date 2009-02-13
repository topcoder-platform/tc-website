/*
* InvalidStatusException
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class InvalidStatusException extends Exception {

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
