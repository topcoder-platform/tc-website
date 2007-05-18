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
        return createStatus(null, status);
    }
    
    public static BasePaymentStatus createStatus(Connection conn, PaymentStatus status) {
        try {
            Class c = Class.forName(status.getClassName());
            BasePaymentStatus bps = (BasePaymentStatus) c.newInstance();
            bps.conn = conn;
            return bps;
        } catch (Exception e) {
            // do nothing - can't happen.
        }
        return null;
    }

    public static BasePaymentStatus createStatus(Long statusId) throws InvalidStatusException {
        return createStatus(null, statusId);
    }
    
    public static BasePaymentStatus createStatus(Connection conn, Long statusId) throws InvalidStatusException {
        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            if (availableStatus.getId().equals(statusId)) {
                return createStatus(conn, availableStatus); 
            }
        }
        throw new InvalidStatusException("Invalid status id: " + statusId);
    }

    public static List<BasePaymentStatus> getAllStatusList() {
        return getStatusList(false);
    }
    
    public static List<BasePaymentStatus> getSelectableStatusList() {
        return getStatusList(true);
    }
    
    private static List<BasePaymentStatus> getStatusList(boolean onlySelectable) {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            BasePaymentStatus status = createStatus(availableStatus);
            if (!onlySelectable || status.isSelectable()) {
                statusList.add(status);
            }
        }
        return statusList;            
    }

}
