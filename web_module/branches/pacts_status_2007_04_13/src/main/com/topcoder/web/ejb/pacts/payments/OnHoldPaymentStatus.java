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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.ParentReferencePayment;
import com.topcoder.web.ejb.pacts.StudioContestPayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OnHoldPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(OnHoldPaymentStatus.class);

    public static final Long ID = 55l;
    public static final String DESC = "On Hold";
    
    /**
     * 
     */
    public OnHoldPaymentStatus() {
        super();

    }

    @Override
    public String getDesc() {
        return DESC;
    }

    @Override
    public Long getId() {
        return ID;
    }

    @Override
    public void activate(BasePayment payment) {
        log.debug("activate called for payment: " + payment.getId());
        try {
            DataInterfaceBean dib = new DataInterfaceBean();
    
            if (payment instanceof ParentReferencePayment) {
                // if the payment has a reference to the parent it should get the parent's status
                // until the parent reaches accruing.
                
                Map criteria = new HashMap();
                criteria.put(PactsConstants.PAYMENT_ID, String.valueOf(((ParentReferencePayment) payment).getParentId()));

                List<BasePayment> payments = dib.findCoderPayments(criteria);
                
                // if not exactly one result, throw exception
                if (payments.size() != 1) {
                    log.debug("not exactly one result");
                }
                
                BasePayment parentPayment = payments.get(0);
                
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
            
            // check for tax form (every payment type)
             checkUserTaxForm(payment, dib);
    
             // check for affirmed affidavit (alg contests, alg tournaments, marathon matrches)
             checkAffirmedAffidavit(payment);

             // check for affirmed IP document (component contests, studio contests)
             checkAffirmedIPTransferDocument(payment, dib);
             
             nextState(payment);
        } catch (Exception e) {
            // TODO: do something
        }
    }

    @Override
    public void newTaxForm(BasePayment payment) {
        log.debug("newTaxForm called for payment: " + payment.getId());
        // remove the reason
        if (reasons.contains(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());

            nextState(payment);
        }
    }

    @Override
    public void affirmedAffidavit(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("affirmedAffidavit called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason());

            nextState(payment);
        }
    }

    @Override
    public void expiredAffidavit(BasePayment payment) throws InvalidStateTransitionException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().expiredAffidavit(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void inactiveCoder(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("moving to cancelled (account status)!");
        BasePaymentStatus newStatus = PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS);
        newStatus.reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        payment.setCurrentStatus(newStatus);
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void expiredIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().expiredIPTransfer(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void expiredPayment(BasePayment payment) throws InvalidStateTransitionException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void parentCancelled(BasePayment payment) throws InvalidStateTransitionException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().parentCancelled(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void affirmedIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("affirmedIPTransfer called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason());

            nextState(payment);
        }
    }

    @Override
    public void hardCopyIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("hardCopyIPTransfer called for payment: " + payment.getId());
        if (reasons.contains(AvailableStatusReason.NO_HARD_COPY_IP_TRANSFER_REASON.getStatusReason())) {
            reasons.remove(AvailableStatusReason.NO_HARD_COPY_IP_TRANSFER_REASON.getStatusReason());

            nextState(payment);
        }
    }

    @Override
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it's always valid
        return true;
    }

    @Override
    public void delete(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("moving to deleted!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void nextState(BasePayment payment) {
        if (reasons.size() == 0) {
            // if there's no reason to stay in this state, move to the next
            log.debug("no reason to stay here!");
            payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ACCRUING_PAYMENT_STATUS));
            try {
                payment.getCurrentStatus().activate(payment);
            } catch (Exception e) {
                // do nothing
            }
       } else {
           log.debug("staying in this state!");
       }
    }

    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new OnHoldPaymentStatus();
        return newPaymentStatus;  
    }
    
    private void checkAffirmedIPTransferDocument(BasePayment payment, DataInterfaceBean dib) throws RemoteException {
        log.debug("com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER: " + com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER);
         if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER)) {
             log.debug("payment.getPaymentType(): " + payment.getPaymentType());
             if (payment.getPaymentType() == BasePayment.COMPONENT_PAYMENT) {
                 if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((ComponentWinningPayment) payment).getProjectId())) {
                     reasons.add(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason());
                 }
                 if (!dib.hasHardCopyAssignmentDocumentByUserId(payment.getCoderId(), AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                     reasons.add(AvailableStatusReason.NO_HARD_COPY_IP_TRANSFER_REASON.getStatusReason());
                 }
             }
      
             if (payment.getPaymentType() == BasePayment.TC_STUDIO_PAYMENT) {
                 if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((StudioContestPayment) payment).getContestId())) {
                     reasons.add(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason());
                 }
                 if (!dib.hasHardCopyAssignmentDocumentByUserId(payment.getCoderId(), AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
                     reasons.add(AvailableStatusReason.NO_HARD_COPY_IP_TRANSFER_REASON.getStatusReason());
                 }
             }
         } else {
             log.debug("IP transfer inactive, avoid checking IP Transfer Documents...");
         }
    }

    private void checkAffirmedAffidavit(BasePayment payment) {
        if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
             payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
             payment.getPaymentType() == BasePayment.MARATHON_MATCH_PAYMENT) {
             // if the payment is new, it's not possible that it has an affirmed affidavit
             reasons.add(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason());
         }
    }

    private void checkUserTaxForm(BasePayment payment, DataInterfaceBean dib) throws RemoteException, SQLException {
        if (!dib.hasTaxForm(payment.getCoderId())) {
             log.debug("no tax form found! (#reasons): " + reasons.size());
             reasons.add(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());
         }
    }
}
