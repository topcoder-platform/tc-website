package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.common.TCWebException;

/**
 * This is an exception class used by the data interface bean
 * and EJB to indicate an attempt to update a payment after it
 * has been paid.
 *
 * @author  Dave Pecora
 * @version 1.00, 04/01/2002
 */

public class PaymentPaidException extends TCWebException {
    /**
     * Constructs a <code>PaymentPaidException</code> object
     * with no message.
     */
    public PaymentPaidException() {
        super();
    }

    /**
     * Constructs a <code>PaymentPaidException</code> object
     * with no message.
     */
    public PaymentPaidException(String s) {
        super(s);
    }
}
