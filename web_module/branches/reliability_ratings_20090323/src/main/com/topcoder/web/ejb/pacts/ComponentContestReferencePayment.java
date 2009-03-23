package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a component contest.
 *
 * @author cucu
 *
 */
public abstract class ComponentContestReferencePayment extends BasePayment {
    private long contestId;

    /**
     * Create a payment that references a component contest.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     */
    public ComponentContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId) {
        this(paymentTypeId, coderId, grossAmount, contestId, 0);
    }

    /**
     * Create a payment that references a component contest.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId contest that is being paid.
     * @param placed the placement of the coder in the contest.
     */
    public ComponentContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.contestId = contestId;
    }

    /**
     * Get the contestId for this payment.
     *
     * @return the contestId for this payment.
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * Set the contestId for this payment.
     *
     * @param contestId the contestId for this payment.
     */
    public void setContestId(long contestId) {
        fieldChanged(MODIFICATION_REFERENCE, contestId != this.contestId);
        this.contestId = contestId;
    }


    /**
     * Processor for a payment referencing a component.
     * It provides methods for retrieving the name of the contest and its end date.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String contestName = null;
        private Date endDate = null;

        /**
         * Get the name of the referenced contest.
         *
         * @return the name of the referenced contest.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getContestName(((ComponentContestReferencePayment) payment).getContestId());
        }

        /**
         * Get the name of the contest.
         *
         * @param contestId contest to retrieve its name
         * @return the name of the contest.
         * @throws SQLException
         */
        protected String getContestName(long contestId) throws SQLException {
            if (contestName == null) {
                lookupData(contestId);
            }
            return contestName;
        }

        /**
         * Get the end date of the contest.
         *
         * @param contestId contest to retrieve its end date.
         * @return the end date of the contest.
         * @throws SQLException
         */
        protected Date getEndDate(long contestId) throws SQLException {
            if (endDate == null) {
                lookupData(contestId);
            }
            return endDate;
        }

        /**
         * Do the actual data lookup in the database for the contest.
         *
         * @param contestId contest to lookup data.
         * @throws SQLException
         */
        private void lookupData(long contestId) throws SQLException {
            String query = "SELECT contest_name, end_date FROM contest WHERE contest_id=" + contestId;
            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query);

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly one row found for contest " + contestId);
            }
            contestName = rsc.getStringItem(0, "contest_name");
            endDate = rsc.getTimestampItem(0, "end_date");
        }

    }
}
