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

    public void expiredAffidavit(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void expiredIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void expiredPayment(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void affirmedIPTransfer(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException();
    }

    public void enterIntoPaymentSystem(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException("Cannot enter into payment system a payment with status " + payment.getCurrentStatus().getDesc());
    }

    public void pay(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException("Cannot pay into payment system a payment with status " + payment.getCurrentStatus().getDesc());
    }

    public void delete(BasePayment payment) throws InvalidStateTransitionException {
        throw new InvalidStateTransitionException("Cannot delete into payment system a payment with status " + payment.getCurrentStatus().getDesc());
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

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public final int hashCode() {
        return getId() == null ? 0 : getId().hashCode();
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public final boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!(obj instanceof BasePaymentStatus))
            return false;
        final BasePaymentStatus other = (BasePaymentStatus) obj;
        if (getId() == null) {
            if (other.getId() != null)
                return false;
        } else if (!getId().equals(other.getId()))
            return false;
        return true;
    }
}
