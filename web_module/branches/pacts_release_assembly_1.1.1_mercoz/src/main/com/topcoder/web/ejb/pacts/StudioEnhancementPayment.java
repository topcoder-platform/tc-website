/*
 * Copyright (c) 2001-2009 TopCoder Inc.  All Rights Reserved.
 */

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment for a studio enhancement winner.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * Copyright (c) 2001-2009 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author mercoz
 */
public class StudioEnhancementPayment extends StudioContestReferencePayment {
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a new payment for a TC Studio Contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     * @param placed placement of the coder in the contest.
     */
    public StudioEnhancementPayment(long coderId, double grossAmount, long contestId, int placed) {
        super(TC_STUDIO_ENHANCEMENT_PAYMENT, coderId, grossAmount, contestId, placed);
    }

    /**
     * Create a new payment for a TC Studio Contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     */
    public StudioEnhancementPayment(long coderId, double grossAmount, long contestId) {
        this(coderId, grossAmount, contestId, 0);
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
     * Processor for studio contests.
     * It generates a payment description like "Icons Design Contest 1st place", and returns as the
     * event date the contest end date.
     *
     * @author mercoz
     */
    protected static class Processor extends StudioContestReferencePayment.Processor {

        /**
         * Get a description for the payment.
         *
         * @param payment payment to generate a description.
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getContestName(p.getContestId()) + " contest " + getOrdinal(p.getPlaced());
        }

        /**
         * Get the date of the contest.
         *
         * @param payment payment whose contest date is retrieved
         * @return the date of the contest.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getEndDate(p.getContestId());
        }
    }
}
