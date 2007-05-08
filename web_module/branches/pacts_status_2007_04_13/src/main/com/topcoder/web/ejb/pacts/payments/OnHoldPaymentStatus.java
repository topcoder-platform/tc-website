/*
* OnHoldPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.StudioContestPayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

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
    
            // check for tax form (every payment type)
             if (!dib.hasTaxForm(payment.getCoderId())) {
                 log.debug("no tax form found! (#reasons): " + reasons.size());
                 reasons.add(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());
             }
    
             // check for affirmed affidavit (alg contests, alg tournaments, marathon matrches)
             if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
                 payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
                 payment.getPaymentType() == BasePayment.MARATHON_MATCH_PAYMENT) {
                 // if the payment is new, it's not possible that it has an affirmed affidavit
                 reasons.add(AvailableStatusReason.NO_AFFIRMED_AFFIDAVIT_REASON.getStatusReason());
             }

             // check for affirmed IP document (component contests, studio contests)
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

    
//    @Override
//    public void expiredAffidavit() {
//        //payment.setCurrentStatus(new CancelledPaymentStatus(payment));
//        //payment.getCurrentStatus().expiredAffidavit();
//    }

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
}
