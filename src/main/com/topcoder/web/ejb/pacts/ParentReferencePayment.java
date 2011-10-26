package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

/**
 * Payment that references another payment as the parent.
 *
 * @author cucu
 *
 */
public abstract class ParentReferencePayment extends BasePayment {
    // id of the referenced payment
    private long parentId;

    /**
     * Create a payment that references another payment
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param parentId id of the referenced payment
     */
    public ParentReferencePayment(int paymentTypeId, long coderId, double grossAmount, long parentId) {
        super(paymentTypeId, coderId, grossAmount);
        this.parentId = parentId;
    }

    /**
     * Get the id of the referenced payment.
     *
     * @return the id of the referenced payment.
     */
    public long getParentId() {
        return parentId;
    }

    /**
     * Set the id of the referenced payment.
     *
     * @param parentId the id of the referenced payment.
     */
    public void setParentId(long parentId) {
        fieldChanged(MODIFICATION_REFERENCE, parentId != this.parentId);
        this.parentId = parentId;
    }

    /**
     * Processor for payments referencing another payment.
     * It provides methods for retrieving the description and coder of the parent payment.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        // Description of the parent payment.
        private String paymentDesc = null;

        // Handle of the coder of the parent payment
        private String referredCoder = null;

        /**
         * Get the description of the referenced payment.
         *
         * @return the description of the referenced payment.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return getPaymentDesc(((ParentReferencePayment) payment).getParentId());
        }

        /**
         * Get the date that the event took place.  Return today by default.
         *
         * @param payment payment to retrieve the end date.
         * @return today
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return new Date();
        }

        /**
         * Get the description of the payment.
         *
         * @param paymentId id of the payment to retrieve its description.
         * @return the description of the payment.
         * @throws SQLException
         */
        protected String getPaymentDesc(long paymentId) throws SQLException {
            if (paymentDesc == null) {
                lookupData(paymentId);
            }
            return paymentDesc;
        }

        /**
         * Get the coder that was paid.
         *
         * @param paymentId id of the payment to retrieve its coder.
         * @return the coder that was paid.
         * @throws SQLException
         */
        protected String getReferredCoder(long paymentId) throws SQLException {
            if (referredCoder == null) {
                lookupData(paymentId);
            }
            return referredCoder;
        }

        /**
         * Do the actual lookup for data in the DB.
         *
         * @param paymentId the payment to lookup its data.
         * @throws SQLException
         */
        private void lookupData(long paymentId) throws SQLException {
            StringBuffer query = new StringBuffer(300);

            query.append(" SELECT pd.payment_desc, u.handle FROM ");
            query.append(" payment p, payment_Detail pd, payment_detail_xref x, user u ");
            query.append(" WHERE p.payment_id  = x.payment_id  ");
            query.append(" AND x.payment_detail_id = pd.payment_detail_id ");
            query.append(" AND p.most_recent_detail_id = pd.payment_detail_id ");
            query.append(" AND u.user_id = p.user_id ");
            query.append(" AND p.payment_id = " + paymentId);

            ResultSetContainer rsc = runSelectQuery(query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 row returned for payment_id=" + paymentId);
            }

            paymentDesc = rsc.getStringItem(0, "payment_desc");
            referredCoder = rsc.getStringItem(0, "handle");
        }

    }
}
