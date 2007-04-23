/*
* OwedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OwedPaymentStatus extends BasePaymentStatus {

    public static final Long OWED_PAYMENT_STATUS_ID = 56l;
    public static final String OWED_PAYMENT_STATUS_DESC = "Owed";
    
    /**
     * 
     */
    public OwedPaymentStatus() {
        super();
    }
    
    @Override
    public String getDesc() {
        return OWED_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return OWED_PAYMENT_STATUS_ID;
    }

    @Override
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it’s always valid
        return true;
    }

    @Override
    public void nextState(BasePayment payment) {
        //payment.setCurrentStatus(new OwedPaymentStatus(payment));
    }
}
