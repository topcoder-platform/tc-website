/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment class for RIA Component Competition projects.
 *
 * This class will store payment information and will provide a custom processor class
 * to allow specific functionality for this payment type.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author TCSDEVELOPER
 * @version 1.0 (BUGR-1845)
 */
public class RIAComponentCompetitionPayment extends ComponentProjectReferencePayment {

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
     * Creates a RIA Component Competition payment using the specified parameters.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public RIAComponentCompetitionPayment(long coderId, double grossAmount, String client, long projectId, int placed) {
        super(RIA_COMPONENT_COMPETITION_PAYMENT, coderId, grossAmount, client, projectId, placed);
    }

    /**
     * Creates a RIA Component Competition payment using the specified parameters.
     *
     * Note: this constructor will default client to null.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public RIAComponentCompetitionPayment(long coderId, double grossAmount, long projectId, int placed) {
        this(coderId, grossAmount, null, projectId, placed);
    }

    /**
     * Creates a RIA Component Competition payment using the specified parameters.
     *
     * Note: this constructor will default placed to 0.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public RIAComponentCompetitionPayment(long coderId, double grossAmount, String client, long projectId) {
        this(coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Creates a RIA Component Competition payment using the specified parameters.
     *
     * Note: this constructor will default client to null and placed to 0.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public RIAComponentCompetitionPayment(long coderId, double grossAmount, long projectId) {
        this(coderId, grossAmount, null, projectId, 0);
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
     * Processor for RIA Component Competition payments.
     *
     * This class will implement <code>lookupDescription</code> to allow custom description
     * generation for the RIA Component Competition payment.
     */
    protected static class Processor extends ComponentProjectReferencePayment.Processor {

        /**
         * <p>A <code>String</code> containing the payment description suffix.
         */
        private static final String PAYMENT_DESCRIPTION_SUFFIX = " - RIA Component Competition";

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         * @throws SQLException if any error occurs while accessing the database.
         */
        @Override
        public String lookupDescription(BasePayment payment) throws SQLException {
            ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;

            String type = getProjectType(p.getProjectId());

            return getComponentName(p.getProjectId()) + " - " + type + PAYMENT_DESCRIPTION_SUFFIX;
        }
    }
}
