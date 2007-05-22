/*
* PaymentStatusFactory
*
* Created Apr 27, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusFactory {

    public enum PaymentStatus {
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
        
        PaymentStatus(String className, Long id) {
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
    
    public static BasePaymentStatus createStatus(PaymentStatus status) {
        try {
            Class c = Class.forName(status.getClassName());
            BasePaymentStatus bps = (BasePaymentStatus) c.newInstance();
            return bps;
        } catch (Exception e) {
        }
        return null;
    }

    public static BasePaymentStatus createStatus(Long statusId) throws InvalidStatusException {
        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            if (availableStatus.getId().equals(statusId)) {
                return createStatus(availableStatus); 
            }
        }
        throw new InvalidStatusException("Invalid status id: " + statusId);
    }

    public static List<BasePaymentStatus> getAllStatusList() {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            BasePaymentStatus status = createStatus(availableStatus);
            statusList.add(status);
        }
        return statusList;            
    }
}
