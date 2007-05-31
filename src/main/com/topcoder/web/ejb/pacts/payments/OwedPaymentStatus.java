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
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OwedPaymentStatus extends BasePaymentStatus {

    /**
     * The loader for this class
     */
    private static final Logger log = Logger.getLogger(OwedPaymentStatus.class);

    /**
     * The payment status id
     */
    public static final Long ID = 56l;

    /**
     * The payment status description
     */
    public static final String DESC = "Owed";
    
    /**
     * Default constructor   
     */
    public OwedPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getDesc()
     */
    @Override
    public String getDesc() {
        return DESC;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
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
        return newPaymentStatus;  
    }
}