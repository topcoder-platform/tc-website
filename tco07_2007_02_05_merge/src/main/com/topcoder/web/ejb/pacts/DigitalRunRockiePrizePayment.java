package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run Rockie prize.
 *
 * @author cucu
 *
 */
public class DigitalRunRockiePrizePayment extends DigitalRunSeasonReferencePayment {

    /**
     * Create a payment for a digital run rockie prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param seasonId the season where the coder won.
     */
    public DigitalRunRockiePrizePayment(long coderId, double grossAmount, long seasonId) {
        this(coderId, grossAmount, seasonId, 0);
    }

    /**
     * Create a payment for a digital run rockie prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param seasonId the season where the coder won.
     * @param placed the placement of the coder in the season.
     */
    public DigitalRunRockiePrizePayment(long coderId, double grossAmount, long seasonId, int placed) {
        super(DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT, coderId, grossAmount, seasonId, placed);
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
     * Processor for Digital Run Rockie prizes.
     * It generates a description like "Digital Run 2007 Rockie, 1st place"
     *
     * @author Cucu
     */
    protected static class Processor extends DigitalRunSeasonReferencePayment.Processor {

        /**
         * Generate a description for the payment
         *
         * @param payment to generate the description
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            DigitalRunSeasonReferencePayment p = (DigitalRunSeasonReferencePayment) payment;

            return getSeasonName(p.getSeasonId()) + " Rockie, " + getOrdinal(p.getPlaced());
        }
    }

}
