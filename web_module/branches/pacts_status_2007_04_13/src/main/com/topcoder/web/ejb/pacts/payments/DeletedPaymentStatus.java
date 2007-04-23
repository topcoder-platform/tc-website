/*
* DeletedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class DeletedPaymentStatus extends BasePaymentStatus {

    public static final Long DELETED_PAYMENT_STATUS_ID = 69l;
    public static final String DELETED_PAYMENT_STATUS_DESC = "Deleted";
    
    /**
     * 
     */
    public DeletedPaymentStatus() {
        super();
    }
    
    @Override
    public String getDesc() {
        return DELETED_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return DELETED_PAYMENT_STATUS_ID;
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
        //payment.setCurrentStatus(new DeletedPaymentStatus(payment));
    }
}
