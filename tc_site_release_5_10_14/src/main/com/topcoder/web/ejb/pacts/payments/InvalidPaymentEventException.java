/*
* StateTransitionFailure
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

/**
 * @author Pablo Wolfus (Pablo)
 * @version $Id$
 */
public class InvalidPaymentEventException extends Exception {

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
