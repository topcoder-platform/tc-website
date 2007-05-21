/*
* BasePaymentStatus
*
* Created Apr 17, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (Pulky)
 * @version $Id$
 */
public abstract class BasePaymentStatus implements java.io.Serializable {
    protected List<PaymentStatusReason> reasons = new ArrayList<PaymentStatusReason>();
    
    
    //public transient Connection conn = null;
    
    public BasePaymentStatus() {
        super();
    }
    
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = newInstance();
        
        for (PaymentStatusReason reason : reasons) {
            newPaymentStatus.reasons.add(reason);
        }
//        newPaymentStatus.conn = this.conn;
        
        return newPaymentStatus;  
    }
    
    public abstract BasePaymentStatus newInstance();

    public abstract String getDesc();

    public abstract Long getId();
    
    public abstract Boolean isSelectable();
    
    public abstract Boolean isValid(BasePayment payment);
    
    public void nextState(BasePayment payment) throws StateTransitionFailureException {
    }

    public void activate(BasePayment payment) throws StateTransitionFailureException {
    }

    public void affirmedAffidavit(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void expiredAffidavit(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void inactiveCoder(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void expiredIPTransfer(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void expiredPayment(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void parentCancelled(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void affirmedIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException();
    }

    public void enterIntoPaymentSystem(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot enter into payment system a payment with status " + payment.getCurrentStatus().getDesc());
    }

    public void pay(BasePayment payment) throws InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot pay a payment with status " + payment.getCurrentStatus().getDesc());
    }

    public void delete(BasePayment payment)throws StateTransitionFailureException, InvalidPaymentEventException {
        throw new InvalidPaymentEventException("Cannot delete a payment with status " + payment.getCurrentStatus().getDesc());
    }
    
    public void hardCopyIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException {
        // default implementation does nothing
    }

    public void newTaxForm(BasePayment payment) throws StateTransitionFailureException {
        // default implementation does nothing
    }

    public void accrualThresholdReached(BasePayment payment) {
        // default implementation does nothing
    }

    public List<PaymentStatusReason> getReasons() {
        return reasons;
    }

    public String getReasonsText() {
        if (reasons.size() == 0) {
            return "";
        }
        String reasonsText = "(";
        boolean first = true;
        for (PaymentStatusReason reason : reasons) {
            if (first) {
                first = false;
            } else {
                reasonsText += ",";
            }
            reasonsText += reason.getDesc();            
        }
        reasonsText += ")";
        return reasonsText;
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
