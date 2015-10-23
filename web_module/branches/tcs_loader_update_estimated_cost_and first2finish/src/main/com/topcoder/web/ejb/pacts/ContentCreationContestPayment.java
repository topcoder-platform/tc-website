/*
 * Copyright (c) 2010 TopCoder Inc.  All Rights Reserved.
 */

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for contest creation winner.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author FireIce
 * @version 1.0
 * @since Content Creation Contest Online Review and TC Site Integration Assembly 1.0
 */
public class ContentCreationContestPayment extends ComponentProjectReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a payment for the winner (or another place!) of a content creation.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ContentCreationContestPayment(long coderId, double grossAmount, String client, long projectId, int placed) {
        super(CONTENT_CREATION_PAYMENT, coderId, grossAmount, client, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a content creation.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ContentCreationContestPayment(long coderId, double grossAmount, long projectId, int placed) {
        this(coderId, grossAmount, null, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a content creation.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public ContentCreationContestPayment(long coderId, double grossAmount, String client, long projectId) {
        this(coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Create a payment for the winner (or another place!) of a content creation.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public ContentCreationContestPayment(long coderId, double grossAmount, long projectId) {
        this(coderId, grossAmount, null, projectId, 0);
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
     * Processor for content creation payments.
     * It just provides a method for generating a description for the content creation.
     *
     * @author TCSASSEMBLER
     */
    protected static class Processor extends ComponentProjectReferencePayment.Processor {

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         * @throws SQLException if any sql error occurs.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;

            String type = getProjectType(p.getProjectId());

            return getComponentName(p.getProjectId()) + " - " + type + ", " + getOrdinal(p.getPlaced());
        }
    }
}
