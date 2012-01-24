package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run V2 Top Performers.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author pulky
 *
 */
public class DigitalRunV2TopPerformersPayment extends DigitalRunTrackReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * Create a payment for a digital run prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param trackId the track where the coder won.
     */
    public DigitalRunV2TopPerformersPayment(long coderId, double grossAmount, long trackId) {
        this(coderId, grossAmount, trackId, 0);
    }

    /**
     * Create a payment for a digital run prize.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param trackId the track where the coder won.
     * @param placed the placement of the coder in the contest
     */
    public DigitalRunV2TopPerformersPayment(long coderId, double grossAmount, long trackId, int placed) {
        super(DIGITAL_RUN_V2_TOP_PERFORMERS_PAYMENT, coderId, grossAmount, trackId, placed);
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
     * It generates a description like "2008 July Design Track Top Performers, 1st place"
     *
     * @author pulky
     *
     */
    protected static class Processor extends DigitalRunTrackReferencePayment.Processor {

        /**
         * Generate a description for the payment
         *
         * @param payment to generate the description
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            DigitalRunTrackReferencePayment p = (DigitalRunTrackReferencePayment) payment;

            return getTrackName(p.getTrackId()) + " Top Performers " + getOrdinal(p.getPlaced());
        }

    }
}
