/*
* AccruingPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * @author Pablo Wolfus (pulky)
 * @version $Id: AccruingPaymentStatus.java 78528 2010-12-03 12:56:05Z VolodymyrK $
 */
public class AccruingPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The loader for this class
     */
    private static final Logger log = Logger.getLogger(AccruingPaymentStatus.class);

    /**
     * The payment status id
     */
    public static final Long ID = 71l;

    /**
     * Default constructor
     */
    public AccruingPaymentStatus() {
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
     * This method checks for the accrual amount and decide wether to stay in this state or move to the next:
     * - If the user has requested his winnings to be accrued, the payments will move to owed when the accrual threshold is reached
     * - When the threshold is reached, all the rest of the accruing payments must be notified.
     *
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#activate(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        log.debug("Activate called for payment " + payment.getId());
        log.debug("Payment coder " + payment.getCoderId());
        log.debug("Payment charity: " + payment.isCharity());
        DataInterfaceBean dib = new DataInterfaceBean();
        try {
            // check the user's accrual threshold

            double accrualThreshold = 0;

            // charity payments don't need checks
            if (!payment.isCharity() && payment.getPaymentType() != BasePayment.CHARITY_PAYMENT) {
                accrualThreshold = dib.getUserAccrualThreshold(payment.getCoderId());
                log.debug("accrualThreshold: " + accrualThreshold);
            }

            if (accrualThreshold > 0) {
                // check total amount for currently accruing payments for this user
                double totalAmount = dib.getUserAccruingPaymentsTotal(payment.getCoderId());
                log.debug("totalAmount: " + totalAmount);
                log.debug("payment.getNetAmount(): " + payment.getNetAmount());

                if (totalAmount + payment.getNetAmount() >= accrualThreshold) {
                    // we have reached the amount, notify all accrual payments and move to the next status
                    log.debug("need to notify all accruing payments");
                    Map criteria = new HashMap();
                    criteria.put(PactsConstants.USER_ID, String.valueOf(payment.getCoderId()));
                    criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ACCRUING_PAYMENT_STATUS.getId()));

                    List<BasePayment> payments = dib.findCoderPayments(criteria);
                    log.debug("need to notify " + payments.size() + " payments");

                    // notify the status manager and update each payment
                    for (BasePayment notifyPayment : payments) {
                        notifyPayment.getCurrentStatus().accrualThresholdReached(notifyPayment);
                        dib.updatePayment(notifyPayment);
                    }

                    // move to next state
                    nextState(payment);
                }
            } else {
                nextState(payment);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new StateTransitionFailureException(e);
        }

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
                // the payment was moved to charity, it shouldn't have any restrictions
                reasons.clear();
                nextState(newPayment);
            } else {
                // shouldn't happen
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
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#accrualThresholdReached(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void accrualThresholdReached(BasePayment payment) throws StateTransitionFailureException {
        nextState(payment);

    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#nextState(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void nextState(BasePayment payment) throws StateTransitionFailureException {
        log.debug("moving to the next status!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.OWED_PAYMENT_STATUS));
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
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new AccruingPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }
}
