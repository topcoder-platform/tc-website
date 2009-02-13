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
 * @version $Id: InvalidPaymentEventException.java 64933 2007-09-06 20:20:22Z cucu $
 */
public class InvalidPaymentEventException extends Exception {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
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
