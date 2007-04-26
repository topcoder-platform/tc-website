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
        ON_HOLD_PAYMENT_STATUS (OnHoldPaymentStatus.class.getName(), OnHoldPaymentStatus.ID),
        CANCELLED_PAYMENT_STATUS (CancelledPaymentStatus.class.getName(), CancelledPaymentStatus.ID),
        PAID_PAYMENT_STATUS (PaidPaymentStatus.class.getName(), PaidPaymentStatus.ID),
        OWED_PAYMENT_STATUS (OwedPaymentStatus.class.getName(), OwedPaymentStatus.ID),
        ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS (EnteredIntoPaymentSystemPaymentStatus.class.getName(), EnteredIntoPaymentSystemPaymentStatus.ID),
        DELETED_PAYMENT_STATUS (DeletedPaymentStatus.class.getName(), DeletedPaymentStatus.ID),
        ACCRUING_PAYMENT_STATUS (AccruingPaymentStatus.class.getName(), AccruingPaymentStatus.ID),
        EXPIRED_PAYMENT_STATUS (ExpiredPaymentStatus.class.getName(), ExpiredPaymentStatus.ID);
        
        private String className;
        private Long id;
        
        AvailableStatus(String className, Long id) {
            this.className = className;
            this.id = id;
        }
        
        public String getClassName() {
            return className;
        }

        public Long getId() {
            return id;
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
    
    public static BasePaymentStatus createStatus(AvailableStatus status) {
        try {
            Class c = Class.forName(status.getClassName());
            return (BasePaymentStatus) c.newInstance();
        } catch (Exception e) {
            // do nothing
        }
        return null;
    }

    public static BasePaymentStatus createStatusUsingId(Long statusId) throws InvalidStatusException {
        for (AvailableStatus availableStatus : AvailableStatus.values()) {
            if (availableStatus.getId().equals(statusId)) {
                return createStatus(availableStatus); 
            }
        }
        throw new InvalidStatusException();
    }

    private static List<BasePaymentStatus> getStatusList(boolean onlySelectable) {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (AvailableStatus availableStatus : AvailableStatus.values()) {
            BasePaymentStatus status = createStatus(availableStatus);
            if (!onlySelectable || status.isSelectable()) {
                statusList.add(status);
            }
        }
        return statusList;            
    }
    
    public void setPayment(BasePayment payment) {
        this.payment = payment;
    }

    public void newPayment() {
        // the start point for a new payment is the on hold state
        try {
            payment.setCurrentStatus(createStatus(AvailableStatus.ON_HOLD_PAYMENT_STATUS));
            payment.getCurrentStatus().newPayment(payment);
        } catch (InvalidStateTransitionException iste) {
            // do nothing
        }
    }

    public void newTaxForm() {
        //payment.getCurrentStatus().newTaxForm();
    }

    public void expiredAffidavit () {
        //payment.getCurrentStatus().expiredAffidavit();
    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((payment == null) ? 0 : payment.hashCode());
        return result;
    }


    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final PaymentStatusManager other = (PaymentStatusManager) obj;
        if (payment == null) {
            if (other.payment != null)
                return false;
        } else if (!payment.equals(other.payment))
            return false;
        return true;
    }
}
