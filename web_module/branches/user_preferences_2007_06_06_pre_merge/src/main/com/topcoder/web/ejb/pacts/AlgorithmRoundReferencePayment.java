package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Payment for an algorithm that takes a refence to a round.
 *
 * @author cucu
 *
 */
public abstract class AlgorithmRoundReferencePayment extends BasePayment {
    // Referenced round.
    private long roundId;


    /**
     * Create an algorithm payment referencing a round.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param roundId the round where the coder won the prize.
     * @param placed the place the coder had in the round, used for generating the description.
     */
    public AlgorithmRoundReferencePayment(int paymentTypeId, long coderId, double grossAmount, long roundId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.roundId = roundId;
    }


    /**
     * Create an algorithm payment referencing a round.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param roundId the round where the coder won the prize.
     */
    public AlgorithmRoundReferencePayment(int paymentTypeId, long coderId, double grossAmount, long roundId) {
        this(paymentTypeId, coderId, grossAmount, roundId, 0);
    }

    /**
     * Get the id of the round where the coder won the prize.
     *
     * @return the id of the round where the coder won the prize.
     */
    public long getRoundId() {
        return roundId;
    }

    /**
     * Set the id of the round where the coder won the prize.
     *
     * @param roundId the id of the round where the coder won the prize.
     */
    public void setRoundId(long roundId) {
        fieldChanged(MODIFICATION_REFERENCE, roundId != this.roundId);
        this.roundId = roundId;
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
     * Processor for payments that have a reference to rounds.
     * It creates a description based on a round and contest name plus the placement, and uses
     * as the event date the end date of the round.
     *
     * @author Cucu
     */
    protected static class Processor extends BasePayment.Processor {
        private String roundName = null;
        private Date endDate = null;

        /**
         * Get a description for this payment.
         * The description is composed by the round name plus the placement, like "SRM 190 1st place"
         *
         * @param payment the payment to lookup the description.
         * @return a description for this payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            return getRoundName(((AlgorithmRoundReferencePayment) payment).getRoundId()) + " " + getOrdinal(payment.getPlaced());
        }

        /**
         * Get when the event took date, i.e. the round end date.
         *
         * @param payment the payment to look for its date.
         * @return the end date of the round
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return getEndDate(((AlgorithmRoundReferencePayment) payment).getRoundId());
        }

        /**
         * Get the name of the referenced round.
         *
         * @return the name of the referenced round.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getRoundName(((AlgorithmRoundReferencePayment) payment).getRoundId());
        }


        /**
         * Get the name of the round.
         *
         * @param roundId round to lookup its name.
         * @return the name of the round.
         * @throws SQLException
         */
        protected String getRoundName(long roundId) throws SQLException {
            if (roundName == null) {
                lookupData(roundId);
            }
            return roundName;
        }


        /**
         * Get the end date of a round
         *
         * @param roundId round id to lookup its end date
         * @return the end date of the round.
         * @throws SQLException
         */
        protected Date getEndDate(long roundId) throws SQLException {
            if (endDate == null) {
                lookupData(roundId);
            }
            return endDate;
        }

        /**
         * Does the actual lookup in database, finding the round name and end date
         * of the round at once.
         *
         * @param roundId round to lookup the name and end date.
         * @throws SQLException
         */
        private void lookupData(long roundId) throws SQLException {
            StringBuffer query = new StringBuffer(100);
            query.append(" select NVL(r.short_name, c.name || ' ' || r.name) as round_name,  c.end_date");
            query.append(" from round r, ");
            query.append(" contest c ");
            query.append(" where r.contest_id = c.contest_id ");
            query.append(" and r.round_id = " + roundId);

            ResultSetContainer rsc = runSelectQuery(query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 round found with id " + roundId);
            }

            roundName = rsc.getStringItem(0, "round_name");
            endDate = rsc.getTimestampItem(0, "end_date");
        }

    }


}
