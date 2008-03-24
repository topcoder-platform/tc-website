/*
* PaymentStatusFactory
*
* Created Apr 27, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * This class implements a factory pattern for the payment statuses
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusFactory {

    /**
     * Enum for all the possible predefined payments status 
     * 
     * @author Pablo Wolfus (pulky)
     * @version $Id$
     */
    public enum PaymentStatus {
        ON_HOLD_PAYMENT_STATUS (OnHoldPaymentStatus.class.getName(), OnHoldPaymentStatus.ID),
        CANCELLED_PAYMENT_STATUS (CancelledPaymentStatus.class.getName(), CancelledPaymentStatus.ID),
        PAID_PAYMENT_STATUS (PaidPaymentStatus.class.getName(), PaidPaymentStatus.ID),
        OWED_PAYMENT_STATUS (OwedPaymentStatus.class.getName(), OwedPaymentStatus.ID),
        ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS (EnteredIntoPaymentSystemPaymentStatus.class.getName(), EnteredIntoPaymentSystemPaymentStatus.ID),
        DELETED_PAYMENT_STATUS (DeletedPaymentStatus.class.getName(), DeletedPaymentStatus.ID),
        ACCRUING_PAYMENT_STATUS (AccruingPaymentStatus.class.getName(), AccruingPaymentStatus.ID),
        EXPIRED_PAYMENT_STATUS (ExpiredPaymentStatus.class.getName(), ExpiredPaymentStatus.ID),
        TEMP_FIX_PAYMENT_STATUS (TempFixPaymentStatus.class.getName(), TempFixPaymentStatus.ID),
        SEE_FAQ_PAYMENT_STATUS (SeeFaqPaymentStatus.class.getName(), SeeFaqPaymentStatus.ID);
        
        /**
         * The className attached to the enum element
         */
        private String className;

        /**
         * The id attached to the enum element
         */
        private Long id;
        
        /**
         * Enums elements constructor
         * 
         * @param the className attached to the enum element
         * @param the id attached to the enum element
         */
        PaymentStatus(String className, Long id) {
            this.className = className;
            this.id = id;
        }
        
        /**
         * Payment status classname getter
         * 
         * @return the Payment status classname
         */
        public String getClassName() {
            return className;
        }

        /**
         * Payment status id getter
         * 
         * @return the Payment status id
         */
        public Long getId() {
            return id;
        }
    }
    
    /**
     * Map to cache available Payment Statuses
     */
    private static Map<Long, BasePaymentStatus> statusMap = null;
    
    /**
     * Private helper method that handles the available Payment Statuses cache
     */
    private static Map<Long, BasePaymentStatus> getStatusMap() {
        if (statusMap == null) {
            DataInterfaceBean dib = new DataInterfaceBean();
            try {
                statusMap = dib.getPaymentStatusMap();
            } catch (Exception e) {
            }
        }
        return statusMap;
    }
    
    /**
     * Creates the required payment status
     * 
     * @param status the enum's status to create
     * @return the created status or null if something goes wrong
     */
    public static BasePaymentStatus createStatus(PaymentStatus status) {
        try {
            return getStatusMap().get(status.id).newInstance();
        } catch (Exception e) {
        }
        return null;
    }

    /**
     * Creates the required payment status
     * 
     * @param statusId the status's id to create
     * @return the created status or null if something goes wrong
     */
    public static BasePaymentStatus createStatus(Long statusId) throws InvalidStatusException {
        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            if (availableStatus.getId().equals(statusId)) {
                return createStatus(availableStatus); 
            }
        }
        throw new InvalidStatusException("Invalid status id: " + statusId);
    }

    /**
     * Retrieve all possible payment's statuses
     * 
     * @return a list of BasePaymentStatus with all the possible payment statuses
     */
    public static List<BasePaymentStatus> getAllStatusList() {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            BasePaymentStatus status = createStatus(availableStatus);
            statusList.add(status);
        }
        return statusList;            
    }

    /**
     * Retrieve all possible payment's statuses
     * 
     * @return a list of BasePaymentStatus with all the possible payment statuses
     */
    public static List<BasePaymentStatus> getActiveStatusList() {
        List statusList = new ArrayList<BasePaymentStatus>(); 

        for (PaymentStatus availableStatus : PaymentStatus.values()) {
            BasePaymentStatus status = createStatus(availableStatus);
            if (status.isActive()) {
                statusList.add(status);
            }
        }
        return statusList;            
    }
}
