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
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    // TODO: pulky: what about referral payments?!??!
    
    public void newTaxForm(BasePayment payment) {
        payment.getCurrentStatus().newTaxForm(payment);
    }

    public void affirmedAffidavit(BasePayment payment) throws InvalidStateTransitionException  {
        payment.getCurrentStatus().affirmedAffidavit(payment);
    }

    public void affirmedIPTransfer(BasePayment payment) throws InvalidStateTransitionException  {
        payment.getCurrentStatus().affirmedIPTransfer(payment);
    }

    public void hardCopyIPTransfer(BasePayment payment) throws InvalidStateTransitionException  {
        payment.getCurrentStatus().hardCopyIPTransfer(payment);
    }

//    public void expiredAffidavit () {
//        //payment.getCurrentStatus().expiredAffidavit();
//    }

}
