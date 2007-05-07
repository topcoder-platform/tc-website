/*
* AccruingPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AccruingPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(AccruingPaymentStatus.class);

    public static final Long ID = 71l;
    public static final String DESC = "Accruing";
    
    /**
     * 
     */
    public AccruingPaymentStatus() {
        super();
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
    public Boolean isSelectable() {
        return false;
    }

    @Override
    public Boolean isValid(BasePayment payment) {
        // since this is a system managed status, it's always valid
        return true;
    }

    @Override
    public void activate(BasePayment payment) {
        nextState(payment);
    }

    @Override
    public void nextState(BasePayment payment) {
        log.debug("moving to the next state!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.OWED_PAYMENT_STATUS));
    }
    
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new AccruingPaymentStatus();
        return newPaymentStatus;  
    }
}
