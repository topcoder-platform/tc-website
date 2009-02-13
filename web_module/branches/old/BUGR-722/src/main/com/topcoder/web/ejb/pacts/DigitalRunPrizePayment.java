package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run prize.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class DigitalRunPrizePayment extends DigitalRunStageReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment for a digital run prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param stageId the stage where the coder won.
     */
    public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId) {
        this(coderId, grossAmount, stageId, 0);
    }

    /**
     * Create a payment for a digital run prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param stageId the stage where the coder won.
     * @param placed the placement of the coder in the contest
     */
    public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId, int placed) {
        super(DIGITAL_RUN_PRIZE_PAYMENT, coderId, grossAmount, stageId, placed);
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
     * Processor for Digital Run prizes.
     * It generates a description like "Digital Run 2007 Stage 1, 1st place"
     *
     * @author Cucu
     *
     */
    protected static class Processor extends DigitalRunStageReferencePayment.Processor {

        /**
         * Generate a description for the payment
         *
         * @param payment to generate the description
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            DigitalRunStageReferencePayment p = (DigitalRunStageReferencePayment) payment;

            return getStageName(p.getStageId()) + ", " + getOrdinal(p.getPlaced());
        }

    }
}
