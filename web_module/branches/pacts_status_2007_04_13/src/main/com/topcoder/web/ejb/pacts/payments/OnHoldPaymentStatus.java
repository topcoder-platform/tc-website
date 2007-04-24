/*
* OnHoldPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OnHoldPaymentStatus extends BasePaymentStatus {
    public static final Long ON_HOLD_PAYMENT_STATUS_ID = 55l;
    public static final String ON_HOLD_PAYMENT_STATUS_DESC = "On Hold";
    
    /**
     * 
     */
    public OnHoldPaymentStatus() {
        super();

    }

    public void create(BasePayment payment) throws InvalidStateTransitionException {

        try {
            DataInterfaceBean dib = new DataInterfaceBean();
    
            // check for tax form (every payment type)
             if (!dib.hasTaxForm(payment.getCoderId())) {
                reasons.add(AvailableStatusReason.NO_TAX_FORM_REASON.getStatusReason());
             }
    
             // check for affirmed affidavit (alg contests, alg tournaments, marathon matrches)
             if (payment.getPaymentType() == BasePayment.ALGORITHM_CONTEST_PAYMENT ||
                 payment.getPaymentType() == BasePayment.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT ||
                 payment.getPaymentType() == BasePayment.MARATHON_MATCH_PAYMENT) {
                 //if (!dib.hasAffirmedAffidavit(payment.getCoderId())) {
                 //    reasons.add(NO_AFFIRMED_AFFIDAVIT_REASON);
                 //}
             }
    
             // check for affirmed IP document (component contests, studio contests)
             if (payment.getPaymentType() == BasePayment.COMPONENT_PAYMENT ||
                     payment.getPaymentType() == BasePayment.TC_STUDIO_PAYMENT) {
                     //if (!dib.hasAffirmedIPTransfer(payment.getCoderId())) {
                     //    reasons.add(NO_AFFIRMED_IP_TRANSFER_REASON);
                     //}
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
            //payment.setCurrentStatus(new AccruingPaymentStatus(payment));
        }
    }

    @Override
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = new OnHoldPaymentStatus();
        newPaymentStatus.reasons = this.getReasons();
        return newPaymentStatus;  
    }
}
