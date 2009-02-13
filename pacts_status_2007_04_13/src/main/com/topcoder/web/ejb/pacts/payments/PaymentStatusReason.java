package com.topcoder.web.ejb.pacts.payments;


/**
 * This class models a Payment Status reason.
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusReason {

    /**
     * Enum for all the possible predefined status reasons 
     * 
     * @author Pablo Wolfus (pulky)
     * @version $Id$
     */
    public enum AvailableStatusReason {
        NO_TAX_FORM_REASON (new PaymentStatusReason(10l, "Waiting for Tax Form")),
        NO_AFFIRMED_AFFIDAVIT_REASON (new PaymentStatusReason(11l, "Waiting for affirmed Affidavit")),
        NO_AFFIRMED_IP_TRANSFER_REASON (new PaymentStatusReason(12l, "Waiting for affirmed IP Transfer")),
        NO_HARD_COPY_IP_TRANSFER_REASON (new PaymentStatusReason(13l, "Waiting for hard copy IP Transfer")),
        EXPIRED_AFFIDAVIT_REASON (new PaymentStatusReason(50l, "Expired Affidavit")),
        EXPIRED_IP_TRANSFER_REASON (new PaymentStatusReason(51l, "Expired IP Transfer")),
        ACCOUNT_STATUS_REASON (new PaymentStatusReason(52l, "Account Status")),
        ATTACHED_TO_PARENT_REASON (new PaymentStatusReason(100l, "Attached to Parent"));
        
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
