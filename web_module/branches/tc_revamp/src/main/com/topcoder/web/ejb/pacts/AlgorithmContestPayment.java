package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * Payment for an algorithm contest (e.g. SRM)
 * The payment for an user in a round is unique, so if you try to add
 * a payment whose (coderId, roundId) are already in payments, an exception is thrown.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author cucu
 */
public class AlgorithmContestPayment extends AlgorithmRoundReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment for an algorithm contest (like an SRM or tournament round)
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     */
    public AlgorithmContestPayment(long coderId, double grossAmount, long roundId) {
        this(coderId, grossAmount, roundId, 0);
    }

    /**
     * Create a payment for an algorithm contest (like an SRM or tournament round)
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     * @param placed the place that the coder had in the contest, used for creating the description.
     */
    public AlgorithmContestPayment(long coderId, double grossAmount, long roundId, int placed) {
        super(ALGORITHM_CONTEST_PAYMENT, coderId, grossAmount, roundId, placed);
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
     * Processor for algorithm contests.  It adds the functionallity of checking for duplicate
     * payments for rounds.
     *
     * @author Cucu
     */
    protected static class Processor extends AlgorithmRoundReferencePayment.Processor {

        /**
         * Returns whether a payment for an user in a round was already done.
         *
         * @param payment the payment to look for duplicates. Just the roundId and coderId are used.
         * @return whether a payment for an user in a round was already done.
         */
        public boolean isDuplicated(BasePayment payment) throws SQLException {
            AlgorithmContestPayment p = (AlgorithmContestPayment) payment;

            StringBuffer query = new StringBuffer(100);
            query.append(" SELECT count(*) ");
            query.append(" FROM payment p, payment_detail pd  ");
            query.append(" WHERE p.most_recent_detail_id = pd.payment_detail_id ");
            query.append(" AND pd.payment_type_id = " + ALGORITHM_CONTEST_PAYMENT);
            query.append(" AND pd.algorithm_round_id = " + p.getRoundId());
            query.append(" AND p.user_id = " + p.getCoderId());

            ResultSetContainer rsc = runSelectQuery(query.toString());

            return rsc.getIntItem(0, 0) > 0;
        }
    }

}
