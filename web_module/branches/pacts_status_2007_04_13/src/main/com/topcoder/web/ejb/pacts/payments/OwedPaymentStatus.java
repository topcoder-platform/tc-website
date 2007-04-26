/*
* OwedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class OwedPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(OwedPaymentStatus.class);

    public static final Long ID = 56l;
    public static final String DESC = "Owed";
    
    /**
     * 
     */
    public OwedPaymentStatus() {
        super();
    }

    @Override
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public String getDesc() {
        return DESC;
    }

    @Override
    public Long getId() {
        return ID;
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it's always valid
        return true;
    }

    @Override
    public void nextState(BasePayment payment) {
        //payment.setCurrentStatus(new OwedPaymentStatus(payment));
    }

    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new OwedPaymentStatus();
        return newPaymentStatus;  
    }
}
