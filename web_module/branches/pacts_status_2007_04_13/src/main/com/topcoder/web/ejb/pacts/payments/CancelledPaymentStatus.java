/*
* CancelledPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class CancelledPaymentStatus extends BasePaymentStatus {

    public static final Long ID = 65l;
    public static final String DESC = "Cancelled";
    
    /**
     * 
     */
    public CancelledPaymentStatus() {
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
        // nothing to do   
    }
    
    @Override
    public void expiredAffidavit(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        }
    }
    
    @Override
    public void parentCancelled(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.ATTACHED_TO_PARENT_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ATTACHED_TO_PARENT_REASON.getStatusReason());
        }
    }

    @Override
    public void expiredIPTransfer(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        }
    }

    @Override
    public void inactiveCoder(BasePayment payment) throws InvalidStateTransitionException {
        if (!reasons.contains(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
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
    public void nextState(BasePayment payment) {
        // nothing to do, this is a final state
    }
    
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new CancelledPaymentStatus();
        return newPaymentStatus;  
    }

}
