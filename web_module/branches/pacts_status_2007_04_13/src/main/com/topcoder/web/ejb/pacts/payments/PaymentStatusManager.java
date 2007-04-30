/*
* PaymentStatusManager
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusManager {
    protected BasePayment payment = null;

    public PaymentStatusManager() {
    }

    public PaymentStatusManager(BasePayment payment) {
        setPayment(payment);
    }

    public void setPayment(BasePayment payment) {
        this.payment = payment;
    }

    public void newPayment() {
        // the start point for a new payment is the on hold state
        try {
            payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ON_HOLD_PAYMENT_STATUS));
            payment.getCurrentStatus().newPayment(payment);
        } catch (InvalidStateTransitionException iste) {
            // do nothing
        }
    }

    public void newTaxForm(BasePayment payment) {
        payment.getCurrentStatus().newTaxForm(payment);
    }

//    public void expiredAffidavit () {
//        //payment.getCurrentStatus().expiredAffidavit();
//    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((payment == null) ? 0 : payment.hashCode());
        return result;
    }


    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final PaymentStatusManager other = (PaymentStatusManager) obj;
        if (payment == null) {
            if (other.payment != null)
                return false;
        } else if (!payment.equals(other.payment))
            return false;
        return true;
    }
}
