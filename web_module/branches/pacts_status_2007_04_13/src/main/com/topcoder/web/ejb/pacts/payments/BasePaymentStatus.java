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
    
//    @Override
//    public abstract BasePaymentStatus clone();
    
    public abstract BasePaymentStatus newInstance();

    public abstract String getDesc();

    public abstract Long getId();
    
    public abstract Boolean isSelectable();
    
    public abstract Boolean isValid(BasePayment payment);
    
    public abstract void nextState(BasePayment payment);
    
    public abstract void activate(BasePayment payment);

    public void affirmedAffidavit(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void affirmedIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void hardCopyIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        // default implementation does nothing
    }

    public void newTaxForm(BasePayment payment) {
        // default implementation does nothing
    }

    public void accrualThresholdReached(BasePayment payment) {
        // default implementation does nothing
    }

    public List<PaymentStatusReason> getReasons() {
        return reasons;
    }
}
