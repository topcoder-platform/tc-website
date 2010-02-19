package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for bug fixes work.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 *
 */
public class BugFixesPayment extends ComponentProjectReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public BugFixesPayment(long coderId, double grossAmount, String client, long projectId, int placed) {
        super(BUG_FIXES_PAYMENT, coderId, grossAmount, client, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public BugFixesPayment(long coderId, double grossAmount, long projectId, int placed) {
        this(coderId, grossAmount, null, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public BugFixesPayment(long coderId, double grossAmount, String client, long projectId) {
        this(coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public BugFixesPayment(long coderId, double grossAmount, long projectId) {
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
     * Processor for bug fixes payments.
     * It just provides a method for generating a description for the bugfix.
     *
     * @author pulky
     */
    protected static class Processor extends ComponentProjectReferencePayment.Processor {

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;
            return getComponentName(p.getProjectId()) + " - Bug Fixes";
        }
    }
}
