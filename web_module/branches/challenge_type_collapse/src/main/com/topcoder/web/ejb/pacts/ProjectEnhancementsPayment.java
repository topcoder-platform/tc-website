package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for project enhancements work.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author ywu 
 *
 */
public class ProjectEnhancementsPayment extends CockpitProjectReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Creates a enhancement payment associated with a cockpit project.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public ProjectEnhancementsPayment(long coderId, double grossAmount, String client, long projectId) {
        super(PROJECT_ENHANCEMENTS_PAYMENT, coderId, grossAmount, client, projectId);
    }

    /**
     * Creates a enhancement payment associated with a cockpit project.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public ProjectEnhancementsPayment(long coderId, double grossAmount, long projectId) {
        this(coderId, grossAmount, null, projectId);
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
     * Processor for project enhancements payments.
     * It just provides a method for generating a description for the component enhancements.
     *
     * @author ywu
     */
    protected static class Processor extends CockpitProjectReferencePayment.Processor {

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            return super.lookupReferenceDescription(payment) + " - Enhancements";
        }
    }
}
