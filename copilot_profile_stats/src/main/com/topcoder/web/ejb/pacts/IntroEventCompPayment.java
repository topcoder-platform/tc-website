package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment for an introductory event component contest.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class IntroEventCompPayment extends ComponentContestReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment for an introductory event component contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     * @param placed the placement of the coder in the contest
     */
    public IntroEventCompPayment(long coderId, double grossAmount, long contestId, int placed) {
        super(INTRO_EVENT_COMP_PAYMENT, coderId, grossAmount, contestId, placed);
    }

    /**
     * Create a payment for an introductory event component contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     */
    public IntroEventCompPayment(long coderId, double grossAmount, long contestId) {
        this(coderId, grossAmount, contestId, 0);
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
     * Processor for winning tournament bonus in component contests.
     *
     * @author Cucu
     */
    protected static class Processor extends ComponentContestReferencePayment.Processor {

        /**
         * Get a description for this payment.
         *
         * @param payment the payment to lookup the description.
         * @return a description for this payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ComponentContestReferencePayment p = (ComponentContestReferencePayment) payment;

            return getContestName(p.getContestId()) + " contest " + getOrdinal(p.getPlaced());
        }

        /**
         * Get when the event took date, i.e. the contest end date.
         *
         * @param payment the payment to look for its date.
         * @return the end date of the contest
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            ComponentContestReferencePayment p = (ComponentContestReferencePayment) payment;

            return getEndDate(p.getContestId());
        }

    }

}
