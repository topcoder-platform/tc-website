package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Payment that references a problem, like problem writing and problem testing.
 *
 * @author cucu
 *
 */
public abstract class AlgorithmProblemReferencePayment extends BasePayment {
    private long problemId;

    /**
     * Create a payment that references a problem.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param problemId referenced problem.
     */
    public AlgorithmProblemReferencePayment(int paymentTypeId, long coderId, double grossAmount, long problemId) {
        super(paymentTypeId, coderId, grossAmount);
        this.problemId = problemId;
    }

    /**
     * Get the id of the problem referenced.
     *
     * @return the id of the problem referenced.
     */
    public long getProblemId() {
        return problemId;
    }

    /**
     * Set the id of the problem referenced.
     *
     * @param problemId the id of the problem referenced.
     */
    public void setProblemId(long problemId) {
        fieldChanged(MODIFICATION_REFERENCE, problemId != this.problemId);
        this.problemId = problemId;
    }

    /**
     * Processor for payments that have a reference to a problem.
     * It provides a method to get the name of the problem.
     * The event date is the date of the payment.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String problemName = null;

        /**
         * Get the event date (always return today)
         *
         * @param payment the payment to retrieve its date.
         * @return the event date (always return today)
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return new Date();
        }

        /**
         * Get the name of the referenced problem.
         *
         * @return the name of the referenced problem.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getProblemName(((AlgorithmProblemReferencePayment) payment).getProblemId());
        }

        /**
         * Get the name of a problem.
         *
         * @param problemId the id of the problem to get its name.
         * @return the name of the specified problem.
         * @throws SQLException
         */
        protected String getProblemName(long problemId) throws SQLException {
            if (problemName == null) {
                lookupData(problemId);
            }
            return problemName;
        }


        /**
         * Does the actual lookup in the database for a problem name.
         *
         * @param problemId id of the problem to look up
         * @throws SQLException
         */
        private void lookupData(long problemId) throws SQLException {
            StringBuffer query = new StringBuffer(100);
            query.append(" SELECT name ");
            query.append(" FROM problem ");
            query.append(" WHERE problem_id = " + problemId);

            ResultSetContainer rsc = runSelectQuery(query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 problem found with id " + problemId);
            }

            problemName = rsc.getStringItem(0, 0);
        }

    }

}
