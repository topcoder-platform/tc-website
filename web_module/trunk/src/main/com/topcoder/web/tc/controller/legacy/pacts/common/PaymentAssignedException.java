package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.TCWebException;

/**
 * This is an exception class used by the data interface bean
 * and EJB to indicate that a payment has already been assigned
 * to a contract, in response to a request to assign this payment
 * to a contract.
 *
 * @author  Dave Pecora
 * @version 1.00, 03/14/2002
 */

public class PaymentAssignedException extends TCWebException {
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
