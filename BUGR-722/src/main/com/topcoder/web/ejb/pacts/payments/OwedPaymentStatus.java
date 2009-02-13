/*
* OwedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;

/**
 * This class represents a Owed status for payments.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id: OwedPaymentStatus.java 64933 2007-09-06 20:20:22Z cucu $
 */
public class OwedPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The loader for this class
     */
    private static final Logger log = Logger.getLogger(OwedPaymentStatus.class);

    /**
     * The payment status id
     */
    public static final Long ID = 56l;

    /**
     * Default constructor
     */
    public OwedPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#paymentUpdated(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void paymentUpdated(BasePayment oldPayment, BasePayment newPayment) throws StateTransitionFailureException {
        log.debug("paymentUpdated called for payment: " + oldPayment.getId());

        // if charity changed:
        if (oldPayment.isCharity() != newPayment.isCharity()) {
            if (newPayment.isCharity()) {
                // the payment was moved to charity but we are in owed status, so nothing should be done.
            } else {
                // the payment was moved to non-charity so we need to move it to the correct state.
                // move it to owed and activate it.
                newPayment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ON_HOLD_PAYMENT_STATUS));
                newPayment.getCurrentStatus().activate(newPayment);
            }
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#parentCancelled(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void parentCancelled(BasePayment payment) throws InvalidPaymentEventException {
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS));
        payment.getCurrentStatus().parentCancelled(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        log.debug("moving to cancelled (account status)!");
        BasePaymentStatus newStatus = PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS);
        newStatus.reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        payment.setCurrentStatus(newStatus);
        payment.getCurrentStatus().activate(payment);
        return 1;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#enterIntoPaymentSystem(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void enterIntoPaymentSystem(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        log.debug("moving to enterIntoPaymentSystem!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS));
        payment.getCurrentStatus().activate(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#delete(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void delete(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        log.debug("moving to deleted!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS));
        payment.getCurrentStatus().activate(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new OwedPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }
}
