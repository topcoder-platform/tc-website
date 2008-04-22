/*
* CancelledPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;

/**
 * This class represents a Canceled status for payments.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class CancelledPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * The payment status id
     */
    public static final Long ID = 65l;

    /**
     * Default constructor
     */
    public CancelledPaymentStatus() {
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
     * This method will handle the state activation for each particular status
     *
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        try {
            // If the payment is cancelled, we need to cancel attached documents. (affidavit)
            cancelAttachedDocuments(payment);
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#expiredAffidavit(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void expiredAffidavit(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.EXPIRED_AFFIDAVIT_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.EXPIRED_AFFIDAVIT_REASON.getStatusReason());
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#parentCancelled(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void parentCancelled(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.ATTACHED_TO_PARENT_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ATTACHED_TO_PARENT_REASON.getStatusReason());
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#expiredIPTransfer(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void expiredIPTransfer(BasePayment payment) {
        if (!reasons.contains(AvailableStatusReason.EXPIRED_AD_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.EXPIRED_AD_REASON.getStatusReason());
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        if (!reasons.contains(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason())) {
            reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        }
        return 0;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new CancelledPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }

}
