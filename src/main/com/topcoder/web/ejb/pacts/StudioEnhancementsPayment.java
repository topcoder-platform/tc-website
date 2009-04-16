/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment class for Studio enhancements.
 *
 * This class will store payment information and will provide a custom processor class
 * to allow specific functionality for this payment type.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 * @version 1.0 (PACTS Release Assembly 1.1.1)
 */
public class StudioEnhancementsPayment extends StudioContestReferencePayment {

    /**
     * <p>A <code>long</code> containing the serial Version UID of this class
     *
     * Note: Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Creates a Studio enhancements payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the contest.
     * @param contestId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public StudioEnhancementsPayment(long coderId, double grossAmount, String client, long contestId, int placed) {
        super(STUDIO_ENHANCEMENTS_PAYMENT, coderId, grossAmount, client, contestId, placed);
    }

    /**
     * Creates a Studio enhancements payment using the specified parameters.
     *
     * Note: this constructor will default placed to 0.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the contest.
     * @param contestId project that is being paid.
     */
    public StudioEnhancementsPayment(long coderId, double grossAmount, String client, long contestId) {
        this(coderId, grossAmount, client, contestId, 0);
    }

    /**
     * Creates a Studio enhancements payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public StudioEnhancementsPayment(long coderId, double grossAmount, long contestId, int placed) {
        this(coderId, grossAmount, null, contestId, placed);
    }

    /**
     * Creates a Studio enhancements payment using the specified parameters.
     *
     * Note: this constructor will default placed to 0.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId project that is being paid.
     */
    public StudioEnhancementsPayment(long coderId, double grossAmount, long contestId) {
        this(coderId, grossAmount, null, contestId, 0);
    }

    /**
     * Get a processor for this type of payment.
     *
     * @return a processor for this type of payment.
     */
    @Override
    protected BasePayment.Processor getProcessor() {
        return new Processor();
    }

    /**
     * Processor for Studio enhancements payments.
     *
     * This class will implement <code>lookupDescription</code> to allow custom description
     * generation for the Studio enhancements payment and <code>lookupEventDate</code> to retrieve
     * event's date.
     */
    protected static class Processor extends StudioContestReferencePayment.Processor {

        /**
         * <p>A <code>String</code> containing the payment description suffix.
         */
        private static final String PAYMENT_DESCRIPTION_SUFFIX = " - Enhancements";

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         * @throws SQLException if any error occurs while accessing the database.
         */
        @Override
        public String lookupDescription(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getContestName(p.getContestId()) + PAYMENT_DESCRIPTION_SUFFIX;
        }

        /**
         * Gets the date of the contest.
         *
         * @param payment payment whose contest date is retrieved
         * @return the date of the contest.
         * @throws SQLException if any error occurs while accessing the database.
         */
        @Override
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getEndDate(p.getContestId());
        }
    }
}
