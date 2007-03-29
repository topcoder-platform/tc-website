package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.List;

import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Payment for a component winning.
 *
 * @author cucu
 *
 */
public class ComponentWinningPayment extends ComponentProjectReferencePayment {

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, String client, long projectId, int placed) {
        super(COMPONENT_PAYMENT, coderId, grossAmount, client, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, long projectId, int placed) {
        this(coderId, grossAmount, null, projectId, placed);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, String client, long projectId) {
        this(coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Create a payment for the winner (or another place!) of a component.
     *
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public ComponentWinningPayment(long coderId, double grossAmount, long projectId) {
        this(coderId, grossAmount, null, projectId, 0);
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
     * Processor for component winning payments.
     * It just provides a method for generating a description from component and placement data.
     *
     * @author Cucu
     */
    protected static class Processor extends ComponentProjectReferencePayment.Processor {

        /**
         * Get the description for the payment.
         *
         * @param payment payment to create its description.
         * @return the description for the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;

            String type = getProjectType(p.getProjectId());
            
            if (p.getInstallmentNumber() == 2 && "Design".equals(type)) {
            	return getComponentName(p.getProjectId()) + " - Development Support";            	
            } else {
            	return getComponentName(p.getProjectId()) + " - " + type + ", " + getOrdinal(p.getPlaced());
            }

        }

        /**
         * Get the status of the payment.
         * Extends the base functionality.
         *
         * If the user/projectId don't have a corresponding affirmed Assignment Document
         * the status is set to on hold.  
         *
         * @return the status of the payment.
         * @throws SQLException
         */
        public int lookupStatus(BasePayment payment) throws SQLException {
            if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER)) {
                if (!hasAffirmedAssignmentDocument(payment.getCoderId(), ((ComponentProjectReferencePayment) payment).getProjectId())) {
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
         * @param projectId project id to check for Assignment Document
         * @return whether the user has already affirmed the corresponding Assignment Document
         */
        protected boolean hasAffirmedAssignmentDocument(long coderId, long projectId) {
            DataInterfaceBean dib = new DataInterfaceBean();
            try {
                List assignmentDocuments = dib.getAssignmentDocumentByUserIdProjectId(coderId, projectId);
        
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
