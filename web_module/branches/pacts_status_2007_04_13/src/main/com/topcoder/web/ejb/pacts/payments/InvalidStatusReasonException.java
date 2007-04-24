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
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     */
    public InvalidStatusReasonException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param cause
     */
    public InvalidStatusReasonException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     * @param cause
     */
    public InvalidStatusReasonException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

}
