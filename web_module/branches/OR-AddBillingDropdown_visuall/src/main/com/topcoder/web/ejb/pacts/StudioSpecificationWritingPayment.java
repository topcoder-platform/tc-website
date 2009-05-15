/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment class for Studio Specification Writing.
 *
 * This class will store payment information and will provide a custom processor class
 * to allow specific functionality for this payment type.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author TCSDEVELOPER
 * @version 1.0 (BUGR-1843)
 */
public class StudioSpecificationWritingPayment extends StudioContestReferencePayment {

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
     * Creates a Studio specification writing payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client
     * @param contestId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public StudioSpecificationWritingPayment(long coderId, double grossAmount, String client, long contestId, int placed) {
        super(STUDIO_SPECIFICATION_WRITING_PAYMENT, coderId, grossAmount, client, contestId, placed);
    }

    /**
     * Creates a Studio specification writing payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client
     * @param contestId project that is being paid.
     */
    public StudioSpecificationWritingPayment(long coderId, double grossAmount, String client, long contestId) {
        this(coderId, grossAmount, client, contestId, 0);
    }
    
    /**
     * Creates a Studio specification writing payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public StudioSpecificationWritingPayment(long coderId, double grossAmount, long contestId, int placed) {
        this(coderId, grossAmount, null, contestId, placed);
    }

    /**
     * Creates a Studio payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId project that is being paid.
     */
    public StudioSpecificationWritingPayment(long coderId, double grossAmount, long contestId) {
        this(coderId, grossAmount, null, contestId, 0);
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
     * Processor for Studio specification writing payments.
     *
     * This class will implement <code>lookupDescription</code> to allow custom description
     * generation for the Studio specification writing payment and <code>lookupEventDate</code> to retrieve
     * event's date.
     */
    protected static class Processor extends StudioContestReferencePayment.Processor {

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

            return getContestName(p.getContestId()) + " - specification writing " + getOrdinal(p.getPlaced());
        }

        /**
         * Gets the date of the contest.
         *
         * @param payment payment whose contest date is retrieved
         * @return the date of the contest.
         * @throws SQLException if any error occurs while accessing the database.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getEndDate(p.getContestId());
        }
    }
}
