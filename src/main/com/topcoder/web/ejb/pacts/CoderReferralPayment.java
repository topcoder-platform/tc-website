package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for coder referral.
 *
 * @author cucu
 *
 */
public class CoderReferralPayment extends ParentReferencePayment {

    /**
     * Create a coder referral payment.  The payment must be already saved to DB.
     *
     * @param parent the referred payment.
     * @param coderId the coder that is being paid.
     * @param grossAmount amount to be paid.
     */
    public CoderReferralPayment(BasePayment parent, long coderId, double grossAmount) {
        super(CODER_REFERRAL_PAYMENT, coderId, grossAmount, parent.getId());

        if (parent.getId() <= 0) {
            throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
        }
    }

    /**
     * Create a coder referral payment.
     *
     * @param coderId the coder that is being paid.
     * @param grossAmount amount to be paid.
     * @param parentId id of the referenced payment.
     */
    public CoderReferralPayment(long coderId, double grossAmount, long parentId) {
        super(CODER_REFERRAL_PAYMENT, coderId, grossAmount, parentId);
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
     * Processor for Coder referral payments.
     * It generates descriptions like "Referral bonus for Cucu SRM 300 1st place"
     *
     * @author Cucu
     *
     */
    protected static class Processor extends ParentReferencePayment.Processor {

        /**
         * Get a description for the payment.
         *
         * @payment the payment to get the description
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ParentReferencePayment p = (ParentReferencePayment) payment;

            return "Referral bonus for " + getReferredCoder(p.getParentId()) + " " + getPaymentDesc(p.getParentId());
        }
    }


}
