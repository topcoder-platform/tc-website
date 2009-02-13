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
 * This class represents a EnteredIntoPaymentSystem status for payments. 
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EnteredIntoPaymentSystemPaymentStatus extends BasePaymentStatus {

    /**
     * The loader for this class
     */
    private static final Logger log = Logger.getLogger(EnteredIntoPaymentSystemPaymentStatus.class);

    /**
     * The payment status id
     */
    public static final Long ID = 70l;

    /**
     * The payment status description
     */
    public static final String DESC = "Entered Into Payment System";
    
    /**
     * Default constructor   
     */
    public EnteredIntoPaymentSystemPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getDesc()
     */
    @Override
    public String getDesc() {
        return DESC;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }
    
    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#pay(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void pay(BasePayment payment) throws InvalidPaymentEventException, StateTransitionFailureException {
        log.debug("moving to paid!");
        payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS));
        payment.getCurrentStatus().activate(payment);
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new EnteredIntoPaymentSystemPaymentStatus();
        return newPaymentStatus;  
    }

}
