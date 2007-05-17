/*
* EnteredIntoPaymentSystemPaymentStatus
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
public class EnteredIntoPaymentSystemPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(EnteredIntoPaymentSystemPaymentStatus.class);

    public static final Long ID = 70l;
    public static final String DESC = "Entered Into Payment System";
    
    /**
     * 
     */
    public EnteredIntoPaymentSystemPaymentStatus() {
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
    public void pay(BasePayment payment) throws InvalidStateTransitionException {
        log.debug("moving to paid!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS));
        try {
            payment.getCurrentStatus().activate(payment);
        } catch (Exception e) {
            // do nothing
        }
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
    public void nextState(BasePayment payment) {
        //payment.setCurrentStatus(new EnteredIntoPaymentSystemPaymentStatus(payment));
    }
    
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new EnteredIntoPaymentSystemPaymentStatus();
        return newPaymentStatus;  
    }

}
