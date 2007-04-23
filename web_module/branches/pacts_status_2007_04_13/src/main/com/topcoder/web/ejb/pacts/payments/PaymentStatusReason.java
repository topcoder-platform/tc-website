package com.topcoder.web.ejb.pacts.payments;

public class PaymentStatusReason {

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
