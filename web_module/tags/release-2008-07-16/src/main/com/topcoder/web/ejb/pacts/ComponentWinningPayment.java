package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a component winning.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class ComponentWinningPayment extends ComponentProjectReferencePayment {

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
    public ComponentWinningPayment(long coderId, double grossAmount, String client, long projectId, int placed) {
        super(COMPONENT_PAYMENT, coderId, grossAmount, client, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, long projectId, int placed) {
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
    public ComponentWinningPayment(long coderId, double grossAmount, String client, long projectId) {
        this(coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, long projectId) {
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
     * Processor for component winning payments.
     * It just provides a method for generating a description from component and placement data.
     *
     * @author Cucu
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

            String type = getProjectType(p.getProjectId());

            if (p.getInstallmentNumber() == 2 && "Design".equals(type)) {
                return getComponentName(p.getProjectId()) + " - Development Support";
            } else {
                return getComponentName(p.getProjectId()) + " - " + type + ", " + getOrdinal(p.getPlaced());
            }

        }
    }
}
