/*
* InvalidStatusReasonException
*
* Created Apr 24, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class InvalidStatusReasonException extends Exception {

    /**
     * 
     */
    public InvalidStatusReasonException() {
    }

    /**
     * @param message
     */
    public InvalidStatusReasonException(String message) {
        super(message);
    }

    /**
     * @param cause
     */
    public InvalidStatusReasonException(Throwable cause) {
        super(cause);
    }

    /**
     * @param message
     * @param cause
     */
    public InvalidStatusReasonException(String message, Throwable cause) {
        super(message, cause);
    }

}
