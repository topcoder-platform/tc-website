/*
* PaymentStatusManager
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusManager {
    protected BasePayment payment = null;
    
    public enum AvailableStatus {
        ON_HOLD_PAYMENT_STATUS (new OnHoldPaymentStatus()),
        CANCELLED_PAYMENT_STATUS (new CancelledPaymentStatus()),
        PAID_PAYMENT_STATUS (new PaidPaymentStatus()),
        OWED_PAYMENT_STATUS (new OwedPaymentStatus()),
        ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS (new EnteredIntoPaymentSystemPaymentStatus()),
        DELETED_PAYMENT_STATUS (new DeletedPaymentStatus()),
        ACCRUING_PAYMENT_STATUS (new AccruingPaymentStatus()),
        EXPIRED_PAYMENT_STATUS (new ExpiredPaymentStatus());
        
        private BasePaymentStatus paymentStatus;
         
        AvailableStatus(BasePaymentStatus paymentStatus) {
            this.paymentStatus = paymentStatus;
        }
        
        public BasePaymentStatus getStatus() {
            return paymentStatus;
        }
    }

    public PaymentStatusManager() {
    }


    public PaymentStatusManager(BasePayment payment) {
        setPayment(payment);
    }

    public static List<BasePaymentStatus> getAllStatusList() {
        return getStatusList(false);
    }
    
    public static List<BasePaymentStatus> getSelectableStatusList() {
        return getStatusList(true);
    }
    
    public static BasePaymentStatus getStatusUsingId(Long statusId) throws InvalidStatusException {
        for (AvailableStatus availableStatus : AvailableStatus.values()) {
            if (availableStatus.getStatus().getId().equals(statusId)) {
                return availableStatus.getStatus(); 
            }
        }
        throw new InvalidStatusException();
    }

    private static List<BasePaymentStatus> getStatusList(boolean onlySelectable) {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (AvailableStatus availableStatus : AvailableStatus.values()) {
            if (!onlySelectable || availableStatus.getStatus().isSelectable()) {
                statusList.add(availableStatus.getStatus());
            }
        }
        return statusList;            
    }
    
    public void setPayment(BasePayment payment) {
        this.payment = payment;
    }

    public void newPayment() {
        // the start point for a new payment is the on hold state
        //payment.setCurrentStatus(new OnHoldPaymentStatus(payment));
    }

    public void newTaxForm() {
        //payment.getCurrentStatus().newTaxForm();
    }

    public void expiredAffidavit () {
        //payment.getCurrentStatus().expiredAffidavit();
    }
}
