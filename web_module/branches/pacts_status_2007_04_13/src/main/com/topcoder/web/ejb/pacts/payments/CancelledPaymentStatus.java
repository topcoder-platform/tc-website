/*
* CancelledPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class CancelledPaymentStatus extends BasePaymentStatus {

    private static final Long CANCELLED_PAYMENT_STATUS_ID = 65l;
    private static final String CANCELLED_PAYMENT_STATUS_DESC = "Cancelled";
    
    /**
     * 
     */
    public CancelledPaymentStatus() {
        super();
    }
    
    public void expiredAffidavit() {
        reasons.add(AvailableStatusReason.EXPIRED_AFFIDAVIT_REASON.getStatusReason());
    }

    @Override
    public String getDesc() {
        return CANCELLED_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return CANCELLED_PAYMENT_STATUS_ID;
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
