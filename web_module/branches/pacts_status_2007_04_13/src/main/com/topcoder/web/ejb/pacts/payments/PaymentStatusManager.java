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

    public void newPayment(BasePayment payment) throws StateTransitionFailureException {
        log.debug("newPayment called...");
        // the start point for a new payment is the on hold state
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ON_HOLD_PAYMENT_STATUS));
        
        payment.getCurrentStatus().activate(payment);
    }

    public void newTaxForm(BasePayment payment) throws StateTransitionFailureException {
        log.debug("newTaxForm called for payment: " + payment.getId());
        payment.getCurrentStatus().newTaxForm(payment);
    }

    public void affirmedAffidavit(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException  {
        log.debug("affirmedAffidavit called for payment: " + payment.getId());
        payment.getCurrentStatus().affirmedAffidavit(payment);
    }

    public void affirmedIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException  {
        log.debug("affirmedIPTransfer called for payment: " + payment.getId());
        payment.getCurrentStatus().affirmedIPTransfer(payment);
    }

    public void hardCopyIPTransfer(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException  {
        log.debug("hardCopyIPTransfer called for payment: " + payment.getId());
        payment.getCurrentStatus().hardCopyIPTransfer(payment);
    }

    public void accrualThresholdReached(BasePayment payment) throws InvalidPaymentEventException  {
        log.debug("accrualThresholdReached called for payment: " + payment.getId());
        payment.getCurrentStatus().accrualThresholdReached(payment);
    }

    public void expiredAffidavit(BasePayment payment) throws InvalidPaymentEventException  {
        log.debug("expiredAffidavit called for payment: " + payment.getId());
        payment.getCurrentStatus().expiredAffidavit(payment);
    }

    public void expiredIPTransfer(BasePayment payment) throws InvalidPaymentEventException  {
        log.debug("expiredIPTransfer called for payment: " + payment.getId());
        payment.getCurrentStatus().expiredIPTransfer(payment);
    }

    public void expiredPayment(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException  {
        log.debug("expiredPayment called for payment: " + payment.getId());
        payment.getCurrentStatus().expiredPayment(payment);
    }

    public void inactiveCoder(BasePayment payment) throws StateTransitionFailureException, InvalidPaymentEventException  {
        log.debug("inactiveCoder called for payment: " + payment.getId());
        payment.getCurrentStatus().inactiveCoder(payment);
    }

    public void parentCancelled(BasePayment payment) throws InvalidPaymentEventException  {
        log.debug("parentCancelled called for payment: " + payment.getId());
        payment.getCurrentStatus().parentCancelled(payment);
    }
}
