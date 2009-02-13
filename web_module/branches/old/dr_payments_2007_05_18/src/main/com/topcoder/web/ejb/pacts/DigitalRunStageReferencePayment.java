package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a digital run stage.
 *
 * @author cucu
 *
 */
public abstract class DigitalRunStageReferencePayment extends BasePayment {
    // The stage for which this payment is done.
    private long stageId;

    /**
     * Create a payment referencing a stage for digital run.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param stageId the referenced stage.
     */
    public DigitalRunStageReferencePayment(int paymentTypeId, long coderId, double grossAmount, long stageId) {
        this(paymentTypeId, coderId, grossAmount, stageId, 0);
    }

    /**
     * Create a payment referencing a stage for digital run.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param stageId the referenced stage.
     * @param placed the place the coder had in the stage, used for generating the description.
     */
    public DigitalRunStageReferencePayment(int paymentTypeId, long coderId, double grossAmount, long stageId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.stageId = stageId;
    }

    /**
     * Get the stage that this payment references.
     *
     * @return the stage that this payment references.
     */
    public long getStageId() {
        return stageId;
    }

    /**
     * Set the stage that this payment references.
     *
     * @param stageId the stage that this payment references.
     */
    public void setStageId(long stageId) {
        fieldChanged(MODIFICATION_REFERENCE, stageId != this.stageId);
        this.stageId = stageId;
    }

    /**
     * Processor for payments referencing a Digital Run stage.
     * It provides methods for retrieving the stage name and end date.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String stageName = null;
        private Date endDate = null;

        /**
         * Get the name of the referenced stage.
         *
         * @return the name of the referenced stage.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getStageName(((DigitalRunStageReferencePayment) payment).getStageId());
        }

        /**
         * Get the stage end date.
         *
         * @param payment payment to retrieve the stage's end date
         * @return the stage end date.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return getEndDate(((DigitalRunStageReferencePayment) payment).getStageId());
        }

        /**
         * Get the stage name.
         *
         * @param stageId stage to retrieve its name.
         * @return the stage name.
         * @throws SQLException
         */
        protected String getStageName(long stageId) throws SQLException {
            if (stageName == null) {
                lookupData(stageId);
            }
            return stageName;
        }


        /**
         * Get the stage end date.
         *
         * @param stageId stage to retrieve its end date.
         * @return the stage end date.
         * @throws SQLException
         */
        protected Date getEndDate(long stageId) throws SQLException {
            if (endDate == null) {
                lookupData(stageId);
            }
            return endDate;
        }

        /**
         * Do the actual lookup in the database for stage information.
         *
         * @param stageId stage to retrieve its name and end date.
         * @throws SQLException
         */
        private void lookupData(long stageId) throws SQLException {
            StringBuffer query = new StringBuffer(300);

            query.append(" SELECT s.name || ' ' || st.name as stage_name, c.date ");
            query.append(" FROM stage st, season s, calendar c  ");
            query.append(" WHERE s.season_id = st.season_id ");
            query.append(" AND c.calendar_id = st.end_calendar_id ");
            query.append(" AND st.stage_id = " + stageId);

            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 row returned for stage_id=" + stageId);
            }

            stageName = rsc.getStringItem(0, "stage_name");
            endDate = rsc.getTimestampItem(0, "date");
        }

    }
}
