/*
* AccruingPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AccruingPaymentStatus extends BasePaymentStatus {

    public static final Long ACCRUING_PAYMENT_STATUS_ID = 71l;
    public static final String ACCRUING_PAYMENT_STATUS_DESC = "Accruing";
    
    /**
     * 
     */
    public AccruingPaymentStatus() {
        super();
    }
    
    @Override
    public String getDesc() {
        return ACCRUING_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return ACCRUING_PAYMENT_STATUS_ID;
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
