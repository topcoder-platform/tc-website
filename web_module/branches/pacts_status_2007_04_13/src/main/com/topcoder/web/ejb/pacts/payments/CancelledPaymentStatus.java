/*
* CancelledPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class CancelledPaymentStatus extends BasePaymentStatus {

    public static final PaymentStatusReason EXPIRED_AFFIDAVIT_REASON = new PaymentStatusReason(50l, "Expired Affidavit");
    public static final PaymentStatusReason EXPIRED_IP_TRANSFER_REASON = new PaymentStatusReason(51l, "Expired IP Transfer");
    public static final PaymentStatusReason ACCOUNT_STATUS_REASON = new PaymentStatusReason(52l, "Account Status");

    private static final Long CANCELLED_PAYMENT_STATUS_ID = 65l;
    private static final String CANCELLED_PAYMENT_STATUS_DESC = "Cancelled";
    
    /**
     * 
     */
    public CancelledPaymentStatus() {
        super();
    }
    
    public void expiredAffidavit() {
        reasons.add(EXPIRED_AFFIDAVIT_REASON);
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
}
