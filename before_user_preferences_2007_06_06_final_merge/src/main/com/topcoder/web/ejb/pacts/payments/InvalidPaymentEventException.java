/*
* StateTransitionFailure
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author Pablo Wolfus (Pablo)
 * @version $Id$
 */
public class InvalidPaymentEventException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object. 
     */
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public InvalidPaymentEventException() {
    }

    /**
     * @param arg0
     */
    public InvalidPaymentEventException(String arg0) {
        super(arg0);
    }

    /**
     * @param arg0
     */
    public InvalidPaymentEventException(Throwable arg0) {
        super(arg0);
    }

    /**
     * @param arg0
     * @param arg1
     */
    public InvalidPaymentEventException(String arg0, Throwable arg1) {
        super(arg0, arg1);
    }

}
