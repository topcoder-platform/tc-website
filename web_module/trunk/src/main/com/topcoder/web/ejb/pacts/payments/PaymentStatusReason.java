package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;


/**
 * This class models a Payment Status reason.
 * 
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusReason implements java.io.Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object. 
     */
    private static final long serialVersionUID = 1L;

    /**
     * Enum for all the possible predefined status reasons 
     * 
     * @author Pablo Wolfus (pulky)
     * @version $Id$
     */
    public enum AvailableStatusReason {
        NO_TAX_FORM_REASON (new PaymentStatusReason(10l, "Waiting for tax form")),
        NO_AFFIRMED_AFFIDAVIT_REASON (new PaymentStatusReason(11l, "Waiting for affirmed affidavit")),
        NO_AFFIRMED_IP_TRANSFER_REASON (new PaymentStatusReason(12l, "Waiting for affirmed assignment document")),
        NO_HARD_COPY_IP_TRANSFER_REASON (new PaymentStatusReason(13l, "Waiting for hard copy assignment document")),
        EXPIRED_AFFIDAVIT_REASON (new PaymentStatusReason(50l, "Expired affidavit")),
        EXPIRED_IP_TRANSFER_REASON (new PaymentStatusReason(51l, "Expired assignment document")),
        ACCOUNT_STATUS_REASON (new PaymentStatusReason(52l, "Account status")),
        ATTACHED_TO_PARENT_REASON (new PaymentStatusReason(100l, "Attached to parent"));
        
        /**
         * The PaymentStatusReason attached to the enum element
         */
        private PaymentStatusReason paymentStatusReason;
         
        /**
         * Enums elements constructor
         * 
         * @param paymentStatusReason the attached payment status reason object
         */
        AvailableStatusReason(PaymentStatusReason paymentStatusReason) {
            this.paymentStatusReason = paymentStatusReason;
        }
        
        /**
         * Payment status reason object getter
         * 
         * @return the Payment status reason object
         */
        public PaymentStatusReason getStatusReason() {
            return paymentStatusReason;
        }
    }
    
    /**
     * Gets the corresponding payment status reason object using the specified id
     * 
     * @param statusReasonId the id of the payment status reason to retrieve 
     * @return the requested payment status reason object 
     * @throws InvalidStatusReasonException if the status is invalid.
     */
    public static PaymentStatusReason getStatusReasonUsingId(Long statusReasonId) throws InvalidStatusReasonException {
        for (AvailableStatusReason availableStatusReason : AvailableStatusReason.values()) {
            if (availableStatusReason.getStatusReason().getId().equals(statusReasonId)) {
                return availableStatusReason.getStatusReason(); 
            }
        }
        throw new InvalidStatusReasonException();
    }

    /**
     * Retrieve all possible payment's status reasons
     * 
     * @return a list of PaymentStatusReason with all the possible payment status reasons
     */
    public static List<PaymentStatusReason> getAllStatusReasonList() {
        List statusReasonList = new ArrayList<PaymentStatusReason>(); 

        for (AvailableStatusReason availableStatusReason : AvailableStatusReason.values()) {
            statusReasonList.add(availableStatusReason.getStatusReason());
        }
        return statusReasonList;            
    }

    /**
     * The Payment status reason id 
     */
    private Long id;
    
    /**
     * The Payment status reason description 
     */
    private String desc;

    /**
     * Default constructor
     * 
     * @param id the id of the payment status reason
     * @param desc the description of the payment status reason
     */
    public PaymentStatusReason(Long id, String desc) {
        this.id = id;
        this.desc = desc;
    }
    
    /**
     * Description getter
     * 
     * @return the description of the payment status reason
     */
    public String getDesc() {
        return desc;
    }
    
    /**
     * ID getter
     * 
     * @return the id of the payment status reason
     */
    public Long getId() {
        return id;
    }
}
