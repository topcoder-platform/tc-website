/*
* BasePaymentStatus
*
* Created Apr 17, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (Pulky)
 * @version $Id$
 */
public abstract class BasePaymentStatus {
    protected List<PaymentStatusReason> reasons = new ArrayList<PaymentStatusReason>();
    
    public BasePaymentStatus() {
        super();
    }
    
    public BasePaymentStatus(Long id, String desc) {
        super();
    }
    
    public abstract String getDesc();

    public abstract Long getId();
    
    public abstract Boolean isSelectable();
    
    public abstract Boolean isValid(BasePayment payment);
    
    public abstract void nextState(BasePayment payment);
    
    public List<PaymentStatusReason> getReasons() {
        return reasons;
    }
}
