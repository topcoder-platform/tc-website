package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Payment for a Studio Contest.
 *
 * @author cucu
 *
 */
public class StudioContestPayment extends StudioContestReferencePayment {

    /**
     * Create a new payment for a TC Studio Contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     * @param placed placement of the coder in the contest.
     */
    public StudioContestPayment(long coderId, double grossAmount, long contestId, int placed) {
        super(TC_STUDIO_PAYMENT, coderId, grossAmount, contestId, placed);
    }

    /**
     * Create a new payment for a TC Studio Contest.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param contestId referenced studio contest.
     */
    public StudioContestPayment(long coderId, double grossAmount, long contestId) {
        this(coderId, grossAmount, contestId, 0);
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
     * Processor for studio contests.
     * It generates a payment description like "Icons Design Contest 1st place", and returns as the
     * event date the contest end date.
     *
     * @author Cucu
     */
    protected static class Processor extends StudioContestReferencePayment.Processor {

        /**
         * Get a description for the payment.
         *
         * @param payment payment to generate a description.
         * @return a description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getContestName(p.getContestId()) + " contest " + getOrdinal(p.getPlaced());
        }

        /**
         * Get the date of the contest.
         *
         * @param payment payment whose contest date is retrieved
         * @return the date of the contest.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            StudioContestReferencePayment p = (StudioContestReferencePayment) payment;

            return getEndDate(p.getContestId());
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
            if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER)) {
                if (!hasAffirmedAssignmentDocument(payment.getCoderId(), ((StudioContestReferencePayment) payment).getContestId())) {
                    return PAYMENT_ON_HOLD_NO_AFFIRMED_AD_STATUS;
                }
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
            DataInterfaceBean dib = new DataInterfaceBean();
            try {
                List assignmentDocuments = dib.getAssignmentDocumentByUserIdStudioContestId(coderId, contestId);
        
                if (assignmentDocuments.size() == 0) {
                    return false;
                }
                
                AssignmentDocument ad = (AssignmentDocument) assignmentDocuments.get(0);
                
                return (ad.getStatus().getId().equals(AssignmentDocumentStatus.AFFIRMED_STATUS_ID));
            } catch (Exception e) {
                return false;
            }
        }
    }

}
