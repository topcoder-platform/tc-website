package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This is an exception class used by the data interface bean
 * and EJB in response to a request to print a payment which
 * has already been printed but not subsequently reviewed.
 *
 * @author  Dave Pecora
 * @version 1.00, 04/01/2002
 */

public class PaymentNotReviewedException extends Exception {
    /**
     * Constructs a <code>PaymentNotReviewedException</code> object
     * with no message.
     */
    public PaymentNotReviewedException() {
        super();
    }

    /**
     * Constructs a <code>PaymentNotReviewedException</code> object
     * with no message.
     */
    public PaymentNotReviewedException(String s) {
        super(s);
    }
}
