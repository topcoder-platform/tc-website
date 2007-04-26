/*
* OnHoldPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.StudioContestPayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager.AvailableStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OnHoldPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(OnHoldPaymentStatus.class);

    public static final Long ON_HOLD_PAYMENT_STATUS_ID = 55l;
    public static final String ON_HOLD_PAYMENT_STATUS_DESC = "On Hold";
    
    /**
     * 
     */
    public OnHoldPaymentStatus() {
        super();

    }

    @Override
    public void newPayment(BasePayment payment) throws InvalidStateTransitionException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();
    
            // check for tax form (every payment type)
             if (!dib.hasTaxForm(payment.getCoderId())) {
                 log.debug("no tax form found!");
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
             if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.ACTIVATE_IP_TRANSFER)) {
                 if (payment.getPaymentType() == BasePayment.COMPONENT_PAYMENT) {
                     if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((ComponentWinningPayment) payment).getProjectId())) {
                         reasons.add(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason());
                     }
                 }
        
                 if (payment.getPaymentType() == BasePayment.TC_STUDIO_PAYMENT) {
                     if (!dib.hasAffirmedAssignmentDocument(payment.getPaymentType(), payment.getCoderId(), ((StudioContestPayment) payment).getContestId())) {
                         reasons.add(AvailableStatusReason.NO_AFFIRMED_IP_TRANSFER_REASON.getStatusReason());
                     }
                 }        
             } else {
                 log.debug("IP transfer inactive, avoid checking IP Transfer Documents...");
             }
            nextState(payment);
        } catch (Exception e) {
            throw new InvalidStateTransitionException(e);
        }
    }
    
    public void newTaxForm(BasePayment payment) {
        // remove the reason
        reasons.remove(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());

        nextState(payment);
    }

    public void expiredAffidavit() {
        //payment.setCurrentStatus(new CancelledPaymentStatus(payment));
        //payment.getCurrentStatus().expiredAffidavit();
    }

    @Override
    public String getDesc() {
        return ON_HOLD_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return ON_HOLD_PAYMENT_STATUS_ID;
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
    public void nextState(BasePayment payment) {
        if (reasons.size() == 0) {
            // if there's no reason to stay in this state, move to the next
            log.debug("no reason to stay here!");
            payment.setCurrentStatus(AvailableStatus.ACCRUING_PAYMENT_STATUS.getStatus().clone());
            try {
                payment.getCurrentStatus().newPayment(payment);
            } catch (InvalidStateTransitionException iste) {
                // do nothing
            }
       } else {
           log.debug("staying in this state!");
       }
    }

    @Override
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = new OnHoldPaymentStatus();
        newPaymentStatus.reasons = this.getReasons();
        return newPaymentStatus;  
    }
}
