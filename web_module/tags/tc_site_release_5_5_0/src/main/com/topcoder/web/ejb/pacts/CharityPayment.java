package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for charity.
 * A charity payment is the consequence of a "real" payment, for example a SRM payment.
 * So, the charity payments are stored with an amount of 0.00, and referring to the
 * payment that caused charity.
 *
 * @author cucu
 *
 */
public class CharityPayment extends ParentReferencePayment {

    /**
     * Generate a charity payment for the specified payment.
     *
     * @param parent payment to generate the charity payment.
     */
    public CharityPayment(BasePayment parent) {
        super(CHARITY_PAYMENT, parent.getCoderId(), 0.0, parent.getId());

        if (parent.getId() <= 0) {
            throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
        }
    }

    /**
     * Generate a charity payment.
     *
     * @param coderId coder paying to charity
     * @param parentId parent payment, i.e. the payment that the coder is paid for.
     */
    public CharityPayment(long coderId, long parentId) {
        super(CHARITY_PAYMENT, coderId, 0.0, parentId);
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
     * Processor for Charity Payments.
     * It generates descriptions like "Paid to Charity: SRM 345, 2nd place"
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

            return "Paid to Charity: " + getPaymentDesc(p.getParentId());
        }
    }


}
