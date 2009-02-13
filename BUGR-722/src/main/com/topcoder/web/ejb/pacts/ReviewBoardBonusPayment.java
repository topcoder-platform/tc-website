/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for review board bonus.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: ReviewBoardBonusPayment.java 70102 2008-04-28 16:40:20Z pulky $
 * Create Date: Apr 23, 2008
 */
public class ReviewBoardBonusPayment extends ParentReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a review board bonus payment.
     *
     * @param parent the payment for which the review board bonus is being paid.  It must be already saved to DB.
     * @param grossAmount amount to pay as review board bonus
     */
    public ReviewBoardBonusPayment(BasePayment parent, double grossAmount) {
        super(REVIEW_BOARD_BONUS_PAYMENT, parent.getCoderId(), grossAmount, parent.getId());

        if (parent.getId() <= 0) {
            throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
        }
    }

    /**
     * Create a review board bonus payment.
     *
     * @param coderId the coder that is being paid
     * @param grossAmount amount to pay as revire board bonus
     * @param parentId the id of the payment that generates the bonus.
     */
    public ReviewBoardBonusPayment(long coderId, double grossAmount, long parentId) {
        super(REVIEW_BOARD_BONUS_PAYMENT, coderId, grossAmount, parentId);
    }

    /**
     * Get a processor for this type of payment.
     *
     * @return a processor for this type of payment.
     */
    protected BasePayment.Processor getProcessor() {
        return new Processor();
    }

    /**
     * Processor for review board bonus payments.
     * It generates a description like "Review Board bonus for LDAP SDK interface, 1st place"
     *
     * @author pulky
     */
    protected static class Processor extends ParentReferencePayment.Processor {

        /**
         * Generate a description for the payment
         *
         * @param payment to generate the description
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ParentReferencePayment p = (ParentReferencePayment) payment;

            return "Review Board bonus for " + getPaymentDesc(p.getParentId());
        }
    }


}
