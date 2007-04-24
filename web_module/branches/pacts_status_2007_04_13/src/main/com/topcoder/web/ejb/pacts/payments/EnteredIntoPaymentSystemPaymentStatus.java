/*
* EnteredIntoPaymentSystemPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EnteredIntoPaymentSystemPaymentStatus extends BasePaymentStatus {

    public static final Long ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS_ID = 70l;
    public static final String ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS_DESC = "Entered Into Payment System";
    
    /**
     * 
     */
    public EnteredIntoPaymentSystemPaymentStatus() {
        super();
    }
    
    @Override
    public String getDesc() {
        return ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS_ID;
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
        //payment.setCurrentStatus(new EnteredIntoPaymentSystemPaymentStatus(payment));
    }
    
    @Override
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = new EnteredIntoPaymentSystemPaymentStatus();
        newPaymentStatus.reasons = this.getReasons();
        return newPaymentStatus;  
    }

}
