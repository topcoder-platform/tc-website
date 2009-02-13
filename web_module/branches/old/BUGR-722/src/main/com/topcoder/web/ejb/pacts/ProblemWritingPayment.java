package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a problem writing.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class ProblemWritingPayment extends AlgorithmProblemReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a new payment for problem writing.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param problemId referenced problem.
     */
    public ProblemWritingPayment(long coderId, double grossAmount, long problemId) {
        super(PROBLEM_WRITING_PAYMENT, coderId, grossAmount, problemId);
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
     * A processor for problem writing payments.
     * It generates a payment description like "Problem MagicCube writing"
     *
     * @author Cucu
     */
    protected class Processor extends AlgorithmProblemReferencePayment.Processor {

        /**
         * Get a description for the payment.
         *
         * @param payment payment to generate the description.
         * @return description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            AlgorithmProblemReferencePayment p = (AlgorithmProblemReferencePayment) payment;

            return "Problem " + getProblemName(p.getProblemId()) + " writing";
        }
    }
}
