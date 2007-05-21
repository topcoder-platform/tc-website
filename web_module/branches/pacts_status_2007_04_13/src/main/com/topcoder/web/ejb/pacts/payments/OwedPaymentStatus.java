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
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OwedPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(OwedPaymentStatus.class);

    public static final Long ID = 56l;
    public static final String DESC = "Owed";
    
    /**
     * 
     */
    public OwedPaymentStatus() {
        super();
    }

    @Override
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public String getDesc() {
        return DESC;
    }

    @Override
    public Long getId() {
        return ID;
    }

    @Override
    public void inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        log.debug("moving to cancelled (account status)!");
        BasePaymentStatus newStatus = PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS);
        newStatus.reasons.add(AvailableStatusReason.ACCOUNT_STATUS_REASON.getStatusReason());
        payment.setCurrentStatus(newStatus);
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void enterIntoPaymentSystem(BasePayment payment) throws InvalidPaymentEventException {
        log.debug("moving to enterIntoPaymentSystem!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public void delete(BasePayment payment) throws InvalidPaymentEventException {
        log.debug("moving to deleted!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it's always valid
        return true;
    }

    @Override
    public void nextState(BasePayment payment) {
        //payment.setCurrentStatus(new OwedPaymentStatus(payment));
    }

    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new OwedPaymentStatus();
        return newPaymentStatus;  
    }
}
