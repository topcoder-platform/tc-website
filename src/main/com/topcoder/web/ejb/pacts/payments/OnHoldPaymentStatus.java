/*
* OnHoldPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.ParentReferencePayment;
import com.topcoder.web.ejb.pacts.ReliabilityBonusPayment;
import com.topcoder.web.ejb.pacts.ReviewBoardBonusPayment;
import com.topcoder.web.ejb.pacts.StudioContestPayment;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * This class represents a On Hold status for payments.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id: OnHoldPaymentStatus.java 70102 2008-04-28 16:40:20Z pulky $
 */
public class OnHoldPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * The loader for this class
     */
    private static final Logger log = Logger.getLogger(OnHoldPaymentStatus.class);

    /**
     * The payment status id
     */
    public static final Long ID = 55l;

    /**
     * Default constructor
     */
    public OnHoldPaymentStatus() {
        super();

    }

    /**
     *
     *
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }

    /**
     * This method checks for this reasons to stay on hold:
     * 1) This payment is a child payment and the parent is on hold
     * 2) The payment needs a tax form to continue
     * 3) The payment needs an affirmed affidavit to continue
     * 4) The payment needs an affirmed IP Transfer to continue
     * 5) The payment needs a signed hard copy IP Transfer to continue
     *
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#activate(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        log.debug("activate called for payment: " + payment.getId());

        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            if (payment instanceof ReliabilityBonusPayment || payment instanceof ReviewBoardBonusPayment) {
                log.debug("instanceof ReliabilityBonusPayment");

                // if the payment is a reliability it should get the parent's status
                // until the parent reaches accruing.

                Map criteria = new HashMap();
                criteria.put(PactsConstants.PAYMENT_ID, String.valueOf(((ParentReferencePayment) payment).getParentId()));

                List<BasePayment> payments = dib.findCoderPayments(criteria);

                // if not exactly one result, throw exception
                if (payments.size() != 1) {
                    throw new StateTransitionFailureException("Not exactly one result found for payment: " + payment.getId());
                }

                BasePayment parentPayment = payments.get(0);

                log.debug("Parent: " + parentPayment.getId() + " - " + parentPayment.getDescription());
                log.debug("Parent status: " + parentPayment.getCurrentStatus().getDesc());

                if (parentPayment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.ON_HOLD_PAYMENT_STATUS)) ||
                    parentPayment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS))) {

                    // clone the status and returns
                    BasePaymentStatus bps = clone();
                    bps.getReasons().clear();
                    bps.getReasons().add(AvailableStatusReason.ATTACHED_TO_PARENT_REASON.getStatusReason());
                    payment.setCurrentStatus(bps);

                    return;
                }
            }

            // charity payments don't need checks
            log.debug("Payment charity: " + payment.isCharity());
            if (!payment.isCharity() && payment.getPaymentType() != BasePayment.CHARITY_PAYMENT) {
                // check for tax form (every payment type)
                 checkUserTaxForm(payment, dib);

                 // check for affirmed affidavit (alg contests, alg tournaments, marathon matrches)
                 checkAffirmedAffidavit(payment);

                 // check for affirmed IP document (component contests, studio contests)
                 checkAffirmedIPTransferDocument(payment, dib);
            }

            nextState(payment);
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#paymentUpdated(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void paymentUpdated(BasePayment oldPayment, BasePayment newPayment) throws StateTransitionFailureException {
        log.debug("paymentUpdated called for payment: " + oldPayment.getId());

        // if charity changed:
        if (oldPayment.isCharity() != newPayment.isCharity()) {
            if (newPayment.isCharity()) {
                // the payment was moved to charity, it shouldn't have any restrictions
                reasons.clear();
                nextState(newPayment);
            } else {
                // shouldn't happen
            }
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newTaxForm(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void newTaxForm(BasePayment payment) throws StateTransitionFailureException {
        log.debug("newTaxForm called for payment: " + payment.getId());
        // remove the reason
        if (reasons.contains(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());

            nextState(payment);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#affirmedAffidavit(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void affirmedAffidavit(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        log.debug("affirmedAffidavit called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason());

            nextState(payment);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#expiredAffidavit(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void expiredAffidavit(BasePayment payment) throws InvalidPaymentEventException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        payment.getCurrentStatus().expiredAffidavit(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        log.debug("moving to cancelled (account status)!");
        BasePaymentStatus newStatus = PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS);
        newStatus.reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        payment.setCurrentStatus(newStatus);
        payment.getCurrentStatus().activate(payment);
        return 1;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#expiredIPTransfer(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void expiredIPTransfer(BasePayment payment) throws InvalidPaymentEventException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            // if the user has the global AD don't cancel anything.
            // this will be a rare case because all old ADs will get affirmed status if the user has the global AD
            if (!dib.hasGlobalAD(payment.getCoderId())) {
                payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
                payment.getCurrentStatus().expiredIPTransfer(payment);
            }
        } catch (Exception e) {
            throw new InvalidPaymentEventException(e);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#expiredPayment(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void expiredPayment(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS));
        payment.getCurrentStatus().activate(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#parentCancelled(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void parentCancelled(BasePayment payment) throws InvalidPaymentEventException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        payment.getCurrentStatus().parentCancelled(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#affirmedIPTransfer(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void affirmedIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        boolean callNextState = false;
        log.debug("affirmedIPTransfer called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason());
            callNextState = true;
        }

        if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
            if (reasons.contains(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason()) &&
                    !reasons.contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason())) {
                reasons.remove(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
                callNextState = true;
            }
        }
        
        if (callNextState) {
            nextState(payment);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#hardCopyIPTransfer(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void hardCopyIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        boolean callNextState = false;
        log.debug("hardCopyIPTransfer called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason());
            callNextState = true;
        }

        if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {
            if (reasons.contains(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason()) &&
                    !reasons.contains(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason())) {
                reasons.remove(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
                callNextState = true;
            }
        }        

        if (callNextState) {
            nextState(payment);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#signedGlobalAD(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void signedGlobalAD(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        boolean callNextState = false;
        log.debug("signedGlobalAD called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason());
            callNextState = true;
        }
        if (reasons.contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason());
            callNextState = true;
        }
        if (reasons.contains(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
            callNextState = true;
        }
        
        if (callNextState) {
            nextState(payment);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#delete(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void delete(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        log.debug("moving to deleted!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS));
        payment.getCurrentStatus().activate(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#nextState(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void nextState(BasePayment payment) throws StateTransitionFailureException {
        if (reasons.size() == 0) {
            // if there's no reason to stay in this state, move to the next
            log.debug("no reason to stay here!");
            payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ACCRUING_PAYMENT_STATUS));
            payment.getCurrentStatus().activate(payment);
       } else {
           log.debug("staying in this state!");
       }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new OnHoldPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }

    /**
     * Private helper method to check if the payment should stay on hold due to missing affirmed IP Transfer
     *
     * @param payment the payment to check for
     * @param dib pacts services provider
     * @throws RemoteException
     */
    private void checkAffirmedIPTransferDocument(BasePayment payment, DataInterfaceBean dib) throws RemoteException {
        // if the user has the global AD, no reason to stay on hold for this.
        // otherwise keep the old checks for component and studio.
        // finally add an on hold reason if the payment requires global AD.

        try {
            if (!dib.hasGlobalAD(payment.getCoderId())) {
                 log.debug("checkAffirmedIPTransferDocument called for payment: " + payment.getId());
                 log.debug("payment.getPaymentType(): " + payment.getPaymentType());
                 if (payment.getPaymentType() == BasePayment.COMPONENT_PAYMENT) {
                     if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((ComponentWinningPayment) payment).getProjectId())) {
                         reasons.add(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason());
                     }
                     if (!dib.hasHardCopyAssignmentDocumentByUserId(payment.getCoderId(), AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                         reasons.add(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason());
                     }
                 }
    
                 if (payment.getPaymentType() == BasePayment.TC_STUDIO_PAYMENT) {
                     if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((StudioContestPayment) payment).getContestId())) {
                         reasons.add(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason());
                     }
                     if (!dib.hasHardCopyAssignmentDocumentByUserId(payment.getCoderId(), AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
                         reasons.add(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason());
                     }
                 }
                 
                 if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG) &&
                         dib.requiresGlobalAD(payment.getPaymentType())) {

                     // if component or studio payment and there is an old ad and hard copy, 
                     // don't make it stay on hold because the global ad
                     if (!((payment.getPaymentType() == BasePayment.COMPONENT_PAYMENT ||
                             payment.getPaymentType() == BasePayment.TC_STUDIO_PAYMENT) && 
                             !reasons.contains(AvailableStatusReason.NO_AFFIRMED_AD_REASON.getStatusReason()) &&
                             !reasons.contains(AvailableStatusReason.NO_HARD_COPY_AD_REASON.getStatusReason()))) {
                         reasons.add(AvailableStatusReason.NO_SIGNED_GLOBAL_AD_REASON.getStatusReason());
                     }
                 }                 
             } else {
                 log.debug("The user has a signed global AD.");
             }
        } catch (Exception e) {
            throw new RemoteException();
        }
    }

    /**
     * Private helper method to check if the payment should stay on hold due to missing affirmed affidavit
     *
     * @param payment the payment to check for
     */
    private void checkAffirmedAffidavit(BasePayment payment) throws Exception {
        if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
            payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
            payment.getPaymentType() == BasePayment.HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT ||
            payment.getPaymentType() == BasePayment.MARATHON_MATCH_PAYMENT ||
            payment.getPaymentType() == BasePayment.MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT) {

            DataInterfaceBean dib = new DataInterfaceBean();

            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(payment.getCoderId()));
            criteria.put(PactsConstants.ROUND_ID, String.valueOf(((AlgorithmRoundReferencePayment)payment).getRoundId()));
            criteria.put(PactsConstants.IS_AFFIRMED, "true");

            Map affirmedAffidavit = dib.findAffidavits(criteria);

            if (((ResultSetContainer) affirmedAffidavit.get(PactsConstants.AFFIDAVIT_HEADER_LIST)).size() <= 0) {
                reasons.add(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason());
            }
         }
    }

    /**
     * Private helper method to check if the payment should stay on hold due to missing tax form
     *
     * @param payment the payment to check for
     * @param dib pacts services provider
     * @throws RemoteException
     * @throws SQLException
     */
    private void checkUserTaxForm(BasePayment payment, DataInterfaceBean dib) throws RemoteException, SQLException {
        if (!dib.hasTaxForm(payment.getCoderId())) {
             log.debug("no tax form found! (#reasons): " + reasons.size());
             reasons.add(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());
         }
    }
}
