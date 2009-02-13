package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment for a Component Tournament Bonus (e.g. winning TCO 06 Design contest)
 *
 * @author cucu
 *
 */
public class ComponentTournamentBonusPayment extends ComponentContestReferencePayment {

    /**
     * Create a payment for winning a tournament bonus in a component contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     * @param placed the placement of the coder in the contest
     */
    public ComponentTournamentBonusPayment(long coderId, double grossAmount, long contestId, int placed) {
        super(COMPONENT_TOURNAMENT_BONUS_PAYMENT, coderId, grossAmount, contestId, placed);
    }

    /**
     * Create a payment for winning a tournament bonus in a component contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     */
    public ComponentTournamentBonusPayment(long coderId, double grossAmount, long contestId) {
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
     * Processor forthis payment.
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
