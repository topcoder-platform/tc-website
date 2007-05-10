/*
* PaymentStatusManager
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusManager {
    protected BasePayment payment = null;

    private static final Logger log = Logger.getLogger(PaymentStatusManager.class);

    public PaymentStatusManager() {
    }

//    public PaymentStatusManager(BasePayment payment) {
//        setPayment(payment);
//    }
//
//    public void setPayment(BasePayment payment) {
//        this.payment = payment;
//    }

    public void newPayment(BasePayment payment) {
        log.debug("newPayment called...");
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
        log.debug("newTaxForm called for payment: " + payment.getId());
        payment.getCurrentStatus().newTaxForm(payment);
    }

    public void affirmedAffidavit(BasePayment payment) throws InvalidStateTransitionException  {
        log.debug("affirmedAffidavit called for payment: " + payment.getId());
        payment.getCurrentStatus().affirmedAffidavit(payment);
    }

    public void affirmedIPTransfer(BasePayment payment) throws InvalidStateTransitionException  {
        log.debug("affirmedIPTransfer called for payment: " + payment.getId());
        payment.getCurrentStatus().affirmedIPTransfer(payment);
    }

    public void hardCopyIPTransfer(BasePayment payment) throws InvalidStateTransitionException  {
        log.debug("hardCopyIPTransfer called for payment: " + payment.getId());
        payment.getCurrentStatus().hardCopyIPTransfer(payment);
    }

    public void accrualThresholdReached(BasePayment payment) throws InvalidStateTransitionException  {
        log.debug("accrualThresholdReached called for payment: " + payment.getId());
        payment.getCurrentStatus().accrualThresholdReached(payment);
    }

//    public void expiredAffidavit () {
//        //payment.getCurrentStatus().expiredAffidavit();
//    }

}
