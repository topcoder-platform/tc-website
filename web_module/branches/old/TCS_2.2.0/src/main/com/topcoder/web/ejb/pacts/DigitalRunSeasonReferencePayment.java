package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a digital run season.
 *
 * @author cucu
 *
 */
public abstract class DigitalRunSeasonReferencePayment extends BasePayment {
    private long seasonId;

    /**
     * Create a payment referencing a digital run season.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param seasonId the referenced season.
     */
    public DigitalRunSeasonReferencePayment(int paymentTypeId, long coderId, double grossAmount, long seasonId) {
        this(paymentTypeId, coderId, grossAmount, seasonId, 0);
    }

    /**
     * Create a payment referencing a digital run season.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param seasonId the referenced season.
     * @param placed the place the coder had in the season, used for generating the description.
     */
    public DigitalRunSeasonReferencePayment(int paymentTypeId, long coderId, double grossAmount, long seasonId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.seasonId = seasonId;
    }

    /**
     * Get the season that this payment references.
     *
     * @return the season that this payment references.
     */
    public long getSeasonId() {
        return seasonId;
    }

    /**
     * Set the season that this payment references.
     *
     * @param seasonId the season that this payment references.
     */
    public void setSeasonId(long seasonId) {
        fieldChanged(MODIFICATION_REFERENCE, seasonId != this.seasonId);
        this.seasonId = seasonId;
    }

    /**
     * Processor for payments referencing a Digital Run season.
     * It provides methods for retrieving the season name and end date.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String seasonName = null;
        private Date endDate = null;

        /**
         * Get the name of the referenced season.
         *
         * @return the name of the referenced season.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getSeasonName(((DigitalRunSeasonReferencePayment) payment).getSeasonId());
        }

        /**
         * Get the season end date.
         *
         * @param payment payment to retrieve the season end date
         * @return the season end date.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return getEndDate(((DigitalRunSeasonReferencePayment) payment).getSeasonId());
        }

        /**
         * Get the season name.
         *
         * @param seasonId season to retrieve its name.
         * @return the season name.
         * @throws SQLException
         */
        protected String getSeasonName(long seasonId) throws SQLException {
            if (seasonName == null) {
                lookupData(seasonId);
            }
            return seasonName;
        }

        /**
         * Get the season end date.
         *
         * @param seasonId season to retrieve its end date.
         * @return the season end date.
         * @throws SQLException
         */
        protected Date getEndDate(long seasonId) throws SQLException {
            if (endDate == null) {
                lookupData(seasonId);
            }
            return endDate;
        }

        /**
         * Get the season end date.
         *
         * @param stageId stage to retrieve its end date.
         * @return the stage end date.
         * @throws SQLException
         */
        private void lookupData(long seasonId) throws SQLException {
            StringBuffer query = new StringBuffer(300);

            query.append(" SELECT s.name, c.date ");
            query.append(" FROM season s, calendar c  ");
            query.append(" WHERE c.calendar_id = s.end_calendar_id ");
            query.append(" AND s.season_id = " + seasonId);

            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 row returned for season_id=" + seasonId);
            }

            seasonName = rsc.getStringItem(0, "name");
            endDate = rsc.getTimestampItem(0, "date");
        }

    }
}
