package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;


/**
 * Payment for a problem testing.  It can optionally refer to a round id.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 */
public class ProblemTestingPayment extends AlgorithmRoundReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * This is used if there is no reference to a round.
     */
    private String roundName = null;

    /**
     * Create a payment for problem testing referring to a round.
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round containing the tested problems.
     */
    public ProblemTestingPayment(long coderId, double grossAmount, long roundId) {
        super(PROBLEM_TESTING_PAYMENT, coderId, grossAmount, roundId);
    }

    /**
     * Create a payment for problem testing that doesn't have a reference to a round.
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundName name of the round paid.
     */
    public ProblemTestingPayment(long coderId, double grossAmount, String roundName) {
        super(PROBLEM_TESTING_PAYMENT, coderId, grossAmount, 0);
        this.roundName = roundName;
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
     * Get the name of the round, when there is no reference for it.
     *
     * @return the name of the round, when there is no reference for it.
     */
    public String getRoundName() {
        return roundName;
    }

    /**
     * Return whether this payment has a reference to a round.
     *
     * @return whether this payment has a reference to a round.
     */
    public boolean hasReference() {
        return getRoundId() > 0;
    }

    /**
     * Processor for problem testing.
     *
     * @author Cucu
     */
    protected static class Processor extends AlgorithmRoundReferencePayment.Processor {

        /**
         * Get a description for this payment.
         *
         * @param payment the payment to lookup the description.
         * @return a description for this payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ProblemTestingPayment p = (ProblemTestingPayment) payment;

            if (p.hasReference()) {
                return "Problem Testing for " + getRoundName(p.getRoundId());
            }

            if (p.getRoundName() != null && p.getRoundName().trim().length() > 0) {
                return "Problem Testing for " + p.getRoundName();
            }

            return "Problem Testing";
        }

        /**
         * Get when the event took date, i.e. the round end date, or today if there is no reference to a round.
         *
         * @param payment the payment to look for its date.
         * @return the end date of the round
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            ProblemTestingPayment p = (ProblemTestingPayment) payment;

            if (p.hasReference()) {
                return getEndDate(p.getRoundId());
            }
            return new Date();
        }

        /**
         * Get the name of the referenced round.
         *
         * @return the name of the referenced round.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            ProblemTestingPayment p = (ProblemTestingPayment) payment;

            if (p.hasReference()) {
                return getRoundName(p.getRoundId());
            }
            return p.getRoundName();
        }

    }

}
