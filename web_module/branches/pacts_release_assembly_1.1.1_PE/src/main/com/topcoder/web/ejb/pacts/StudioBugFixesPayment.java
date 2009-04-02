/*
 * Copyright (c) 2001-2009 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

import java.util.Date;


/**
 * <p>
 * Payment for Studio Bug Fixes.
 * </p>
 * 
 * <p>
 * VERY IMPORTANT: remember to update serialVersionUID if needed.
 * </p>
 *
 * @author TCSASSEMBLY
 * @version 1.0
 *
 * @since PACTS Release Assembly
 */
public class StudioBugFixesPayment extends StudioContestReferencePayment {
    /**
     * Please change that number if you affect the fields in a way that will affect the serialization for this object,
     * i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a new payment for a TC Studio Bug Fixes.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     * @param placed placement of the coder in the contest.
     */
    public StudioBugFixesPayment(long coderId, double grossAmount, long contestId, int placed) {
        super(STUDIO_BUG_FIXES_PAYMENT, coderId, grossAmount, contestId, placed);
    }

    /**
     * Create a new payment for a TC Studio Bug Fixes.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     */
    public StudioBugFixesPayment(long coderId, double grossAmount, long contestId) {
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
     * Processor for studio contests. It generates a payment description like "Icons Design Contest - Bug fixes", and
     * returns as the event date the contest end date.
     *
     * @author TCSASSEMBLY
     * @version 1.0
     *
     * @since PACTS Release Assembly
     */
    protected static class Processor extends StudioContestReferencePayment.Processor {
        /**
         * Get a description for the payment.
         *
         * @param payment payment to generate a description.
         *
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getContestName(p.getContestId()) + " - Bug fixes";
        }

        /**
         * Get the date of the contest.
         *
         * @param payment payment whose contest date is retrieved
         *
         * @return the date of the contest.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getEndDate(p.getContestId());
        }
    }
}
