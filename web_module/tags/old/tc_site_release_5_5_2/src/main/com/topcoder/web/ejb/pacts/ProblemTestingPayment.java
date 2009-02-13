package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a problem testing.
 *
 * @author cucu
 *
 */
public class ProblemTestingPayment extends AlgorithmProblemReferencePayment {

    /**
     * Create a new payment for problem testing.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param problemId referenced problem.
     */
    public ProblemTestingPayment(long coderId, double grossAmount, long problemId) {
        super(PROBLEM_TESTING_PAYMENT, coderId, grossAmount, problemId);
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
     * A processor for problem testing payments.
     * It generates a payment description like "Problem MagicCube testing"
     *
     * @author Cucu
     */
    protected static class Processor extends AlgorithmProblemReferencePayment.Processor {

        /**
         * Get a description for the payment.
         *
         * @param payment payment to generate the description.
         * @return description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            AlgorithmProblemReferencePayment p = (AlgorithmProblemReferencePayment) payment;

            return "Problem " + getProblemName(p.getProblemId()) + " testing";
        }
    }
}
