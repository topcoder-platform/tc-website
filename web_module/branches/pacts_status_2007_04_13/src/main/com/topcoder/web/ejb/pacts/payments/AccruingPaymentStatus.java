/*
* AccruingPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.sql.Connection;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason.AvailableStatusReason;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AccruingPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(AccruingPaymentStatus.class);

    public static final Long ID = 71l;
    public static final String DESC = "Accruing";
    
    /**
     * 
     */
    public AccruingPaymentStatus() {
        super();
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
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it's always valid
        return true;
    }

    @Override
    public void activate(BasePayment payment) {
        log.debug("Activate called for payment " + payment.getId());
        log.debug("Payment coder" + payment.getCoderId());
        DataInterfaceBean dib = new DataInterfaceBean();
        try {
            // check the user's accrual threshold
            double accrualThreshold = dib.getUserAccrualThreshold(payment.getCoderId());

            log.debug("accrualThreshold: " + accrualThreshold);            
            
            if (accrualThreshold > 0) {
                // check total amount for currently accruing payments for this user
                double totalAmount = dib.getUserAccruingPaymentsTotal(payment.getCoderId());
                log.debug("totalAmount: " + totalAmount);
                log.debug("payment.getGrossAmount(): " + payment.getGrossAmount());
                
                if (totalAmount + payment.getGrossAmount() > accrualThreshold) {
                    // we have reached the amount, move to the next status
                    nextState(payment);
                }
            } else {
                nextState(payment);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // do nothing
        }
        
    }

    @Override
    public void accrualThresholdReached(BasePayment payment) {
        nextState(payment);
        
    }   
    
    @Override
    public void nextState(BasePayment payment) {
        log.debug("moving to the next status!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.OWED_PAYMENT_STATUS));
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
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new AccruingPaymentStatus();
        return newPaymentStatus;  
    }
}
