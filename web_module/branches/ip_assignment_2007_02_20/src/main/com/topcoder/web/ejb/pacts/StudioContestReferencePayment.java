package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Payment that references a studio component contest.
 *
 * @author cucu
 *
 */
public abstract class StudioContestReferencePayment extends BasePayment {
    private long contestId;

    /**
     * Create a new payment referencing a TC Studio Contest.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     */
    public StudioContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId) {
        this(paymentTypeId, coderId, grossAmount, contestId, 0);
    }

    /**
     * Create a new payment referencing a TC Studio Contest.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     * @param placed the place that the coder had in the contest, used for creating the description.
     */
    public StudioContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId, int placed) {
        super(paymentTypeId, coderId, grossAmount, placed);
        this.contestId = contestId;
    }

    /**
     * Get the id of the referenced studio contest.
     *
     * @return the id of the referenced studio contest.
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * Set the id of the referenced studio contest.
     *
     * @return the id of the referenced studio contest.
     */
    public void setContestId(long contestId) {
        fieldChanged(MODIFICATION_REFERENCE, contestId != this.contestId);
        this.contestId = contestId;
    }


    /**
     * Processor for payments that have a reference to studio contests.
     * It provides methods for getting the name and the date of the contest.
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
            return getContestName(((StudioContestReferencePayment) payment).getContestId());
        }

        /**
         * Get the name of the contest.
         *
         * @param contestId id of the contest to retrieve its name.
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
         * @param contestId id of the contest to retrieve its end date.
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
         * Do the actual lookup of contest name and date.
         *
         * @param contestId id of the contest to retrieve data.
         * @throws SQLException
         */
        private void lookupData(long contestId) throws SQLException {
            String query = "SELECT name, end_time FROM contest WHERE contest_id =" + contestId;
            ResultSetContainer rsc = runSelectQuery(DBMS.STUDIO_DATASOURCE_NAME, query);

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Not exactly 1 row retrieved for studio contest " + contestId);
            }

            contestName = rsc.getStringItem(0, "name");
            endDate = rsc.getTimestampItem(0, "end_time");
        }


        /**
         * Get the status of the payment.
         * Extends the base functionality.
         *
         * If the user/contestId don't have a corresponding affirmed Assignment Document
         * the status is set to on hold.  
         *
         * @return the status of the payment.
         * @throws SQLException
         */
        public int lookupStatus(BasePayment payment) throws SQLException {
            System.out.println("lookupStatus (studio) : tax " + hasTaxForm(payment.getCoderId()));
            if (!hasAffirmedAssignmentDocument(payment.getCoderId(), ((StudioContestReferencePayment) payment).getContestId())) {
                return PAYMENT_ON_HOLD_NO_AFFIRMED_AD_STATUS;
            }
            
            if (!hasTaxForm(payment.getCoderId())) {
                return PAYMENT_ON_HOLD_STATUS;
            }

            return PAYMENT_PENDING_STATUS;
        }
        
        /**
         * Returns whether the user has already affirmed the corresponding Assignment Document
         *
         * @param coderId coder to check for Assignment Document
         * @param contestId contest id to check for Assignment Document
         * @return whether the user has already affirmed the corresponding Assignment Document
         */
        protected boolean hasAffirmedAssignmentDocument(long coderId, long contestId) {
            System.out.println("hasAffirmedAssignmentDocument (studio) : " + coderId + " / " + contestId);
            DataInterfaceBean dib = new DataInterfaceBean();
            try {
                List assignmentDocuments = dib.getAssignmentDocumentByUserIdStudioContestId(coderId, contestId);
        
                if (assignmentDocuments.size() == 0) {
                    System.out.println("false");
                    return false;
                }
                
                AssignmentDocument ad = (AssignmentDocument) assignmentDocuments.get(0);
                
                System.out.println(ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
                return (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
            } catch (Exception e) {
                System.out.println("false");
                return false;
            }
        }
    }
}
