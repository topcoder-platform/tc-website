/*
* BasePaymentStatus
*
* Created Apr 17, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (Pulky)
 * @version $Id$
 */
public abstract class BasePaymentStatus {
    protected List<PaymentStatusReason> reasons = new ArrayList<PaymentStatusReason>();
    
    public BasePaymentStatus() {
        super();
    }
    
    @Override
    public abstract BasePaymentStatus clone();
    
    public abstract String getDesc();

    public abstract Long getId();
    
    public abstract Boolean isSelectable();
    
    public abstract Boolean isValid(BasePayment payment);
    
    public abstract void nextState(BasePayment payment);
    
    public void newPayment(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public List<PaymentStatusReason> getReasons() {
        return reasons;
    }
}
