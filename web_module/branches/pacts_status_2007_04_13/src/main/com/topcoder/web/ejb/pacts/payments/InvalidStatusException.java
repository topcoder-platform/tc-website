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
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     */
    public InvalidStatusException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param cause
     */
    public InvalidStatusException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     * @param cause
     */
    public InvalidStatusException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

}
