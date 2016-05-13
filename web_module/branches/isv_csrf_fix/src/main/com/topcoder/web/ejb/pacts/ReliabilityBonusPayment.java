package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for reliability bonus.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class ReliabilityBonusPayment extends ParentReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a reliability bonus payment.
     *
     * @param parent the payment for which the reliability is being paid.  It must be already saved to DB.
     * @param grossAmount amount to pay as reliability bonus
     */
    public ReliabilityBonusPayment(BasePayment parent, double grossAmount) {
        super(RELIABILITY_BONUS_PAYMENT, parent.getCoderId(), grossAmount, parent.getId());

        if (parent.getId() <= 0) {
            throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
        }
    }

    /**
     * Create a reliability bonus payment.
     *
     * @param coderId the coder that is being paid
     * @param grossAmount amount to pay as reliability bonus
     * @param parentId the id of the payment that generates the bonus.
     */
    public ReliabilityBonusPayment(long coderId, double grossAmount, long parentId) {
        super(RELIABILITY_BONUS_PAYMENT, coderId, grossAmount, parentId);
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
     * Processor for Reliability bonus payments.
     * It generates a description like "Reliability bonus for LDAP SDK interface, 1st place"
     *
     * @author Cucu
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

            return "Reliability bonus for " + getPaymentDesc(p.getParentId());
        }
    }


}
