package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.NavigationException;

/**
 * This is an exception class used by the data interface bean
 * and EJB to indicate that a payment has already been assigned
 * to a contract, in response to a request to assign this payment
 * to a contract.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class PaymentAssignedException extends NavigationException {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Constructs a <code>PaymentAssignedException</code> object
     * with no message.
     */
    public PaymentAssignedException() {
        super();
    }

    /**
     * Constructs a <code>PaymentAssignedException</code> object
     * with no message.
     */
    public PaymentAssignedException(String s) {
        super(s);
    }
}
