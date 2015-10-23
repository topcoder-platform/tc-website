package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Negative payment (credit).
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author VolodymyrK
 *
 */          
public class NegativePayment extends ParentReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a negative payment.
     *
     * @param parent the payment for which the negaitve payment is to be linked to.  It must be already saved to DB.
     * @param grossAmount amount
     */
    public NegativePayment(BasePayment parent, double grossAmount) {
        super(NEGATIVE_PAYMENT, parent.getCoderId(), grossAmount, parent.getId());

        if (parent.getId() <= 0) {
            throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
        }
    }

    /**
     * Create a negative bonus payment.
     *
     * @param coderId the coder that is being paid
     * @param grossAmount amount
     * @param parentId the id of the payment that generates the bonus.
     */
    public NegativePayment(long coderId, double grossAmount, long parentId) {
        super(NEGATIVE_PAYMENT, coderId, grossAmount, parentId);
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
     * Processor for  egative payments.
     * It generates a description like "Negative payment for LDAP SDK interface, 1st place"
     *
     * @author VolodymyrK
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

            return "Negative payment for " + getPaymentDesc(p.getParentId());
        }
    }


}
