package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;

public class PaymentStatusReason {

    public enum AvailableStatusReason {

        NO_TAX_FORM_REASON (new PaymentStatusReason(10l, "No Tax Form")),
        NO_AFFIRMED_AFFIDAVIT_REASON (new PaymentStatusReason(11l, "No affirmed Affidavit")),
        NO_AFFIRMED_IP_TRANSFER_REASON (new PaymentStatusReason(12l, "No affirmed IP Transfer")),
        NO_HARD_COPY_IP_TRANSFER_REASON (new PaymentStatusReason(13l, "No hard copy IP Transfer")),
        EXPIRED_AFFIDAVIT_REASON (new PaymentStatusReason(50l, "Expired Affidavit")),
        EXPIRED_IP_TRANSFER_REASON (new PaymentStatusReason(51l, "Expired IP Transfer")),
        ACCOUNT_STATUS_REASON (new PaymentStatusReason(52l, "Account Status"));
        
        private PaymentStatusReason paymentStatusReason;
         
        AvailableStatusReason(PaymentStatusReason paymentStatusReason) {
            this.paymentStatusReason = paymentStatusReason;
        }
        
        public PaymentStatusReason getStatusReason() {
            return paymentStatusReason;
        }
    }
    
    public static PaymentStatusReason getStatusReasonUsingId(Long statusReasonId) throws InvalidStatusReasonException {
        for (AvailableStatusReason availableStatusReason : AvailableStatusReason.values()) {
            if (availableStatusReason.getStatusReason().getId().equals(statusReasonId)) {
                return availableStatusReason.getStatusReason(); 
            }
        }
        throw new InvalidStatusReasonException();
    }

    public static List<PaymentStatusReason> getStatusReasonList() {
        List statusReasonList = new ArrayList<PaymentStatusReason>(); 

        for (AvailableStatusReason availableStatusReason : AvailableStatusReason.values()) {
            statusReasonList.add(availableStatusReason.getStatusReason());
        }
        return statusReasonList;            
    }

    private Long id;
    private String desc;

    public PaymentStatusReason(Long id, String desc) {
        this.id = id;
        this.desc = desc;
    }
    
    public String getDesc() {
        return desc;
    }
    public Long getId() {
        return id;
    }
}
