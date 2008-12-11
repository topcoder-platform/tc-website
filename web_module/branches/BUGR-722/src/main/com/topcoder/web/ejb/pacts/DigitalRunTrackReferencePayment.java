package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a digital run track.
 *
 * @author pulky
 *
 */
public abstract class DigitalRunTrackReferencePayment extends BasePayment {
    // The track for which this payment is done.
    private long trackId;

    /**
     * Create a payment referencing a track for digital run.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param trackId the referenced track.
     */
    public DigitalRunTrackReferencePayment(int paymentTypeId, long coderId, double grossAmount, long trackId) {
        this(paymentTypeId, coderId, grossAmount, trackId, 0);
    }

    /**
     * Create a payment referencing a track for digital run.
     *
     * @param paymentTypeId type of the payment
     * @param coderId the coder being paid.
     * @param grossAmount amount paid.
     * @param trackId the referenced track.
     * @param placed the place the coder had in the track, used for generating the description.
     */
    public DigitalRunTrackReferencePayment(int paymentTypeId, long coderId, double grossAmount, long trackId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.trackId = trackId;
    }

    /**
     * Get the track that this payment references.
     *
     * @return the track that this payment references.
     */
    public long getTrackId() {
        return trackId;
    }

    /**
     * Set the track that this payment references.
     *
     * @param trackId the track that this payment references.
     */
    public void setTrackId(long trackId) {
        fieldChanged(MODIFICATION_REFERENCE, trackId != this.trackId);
        this.trackId = trackId;
    }

    /**
     * Processor for payments referencing a Digital Run track.
     * It provides methods for retrieving the track name and end date.
     *
     * @author pulky
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String trackName = null;
        private Date endDate = null;

        /**
         * Get the name of the referenced track.
         *
         * @return the name of the referenced track.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getTrackName(((DigitalRunTrackReferencePayment) payment).getTrackId());
        }

        /**
         * Get the track end date.
         *
         * @param payment payment to retrieve the track's end date
         * @return the track end date.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return getEndDate(((DigitalRunTrackReferencePayment) payment).getTrackId());
        }

        /**
         * Get the track name.
         *
         * @param trackId track to retrieve its name.
         * @return the track name.
         * @throws SQLException
         */
        protected String getTrackName(long trackId) throws SQLException {
            if (trackName == null) {
                lookupData(trackId);
            }
            return trackName;
        }


        /**
         * Get the track end date.
         *
         * @param trackId track to retrieve its end date.
         * @return the track end date.
         * @throws SQLException
         */
        protected Date getEndDate(long trackId) throws SQLException {
            if (endDate == null) {
                lookupData(trackId);
            }
            return endDate;
        }

        /**
         * Do the actual lookup in the database for track information.
         *
         * @param trackId track to retrieve its name and end date.
         * @throws SQLException
         */
        private void lookupData(long trackId) throws SQLException {
            StringBuffer query = new StringBuffer(300);

            query.append(" SELECT t.track_desc, t.track_end_date");
            query.append(" FROM track t");
            query.append(" WHERE t.track_id = " + trackId);

            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 row returned for track_id=" + trackId);
            }

            trackName = rsc.getStringItem(0, "track_desc");
            endDate = rsc.getTimestampItem(0, "track_end_date");
        }

    }
}
