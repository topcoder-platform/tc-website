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

    public static final Long ID = 69l;
    public static final String DESC = "Deleted";
    
    /**
     * 
     */
    public DeletedPaymentStatus() {
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
    
    @Override
    public void inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        // do nothing
    }

    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new DeletedPaymentStatus();
        return newPaymentStatus;  
    }

}
