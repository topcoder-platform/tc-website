/*
* DeletedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * This class represents a Deleted status for payments. 
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class DeletedPaymentStatus extends BasePaymentStatus {

    /**
     * The payment status id
     */
    public static final Long ID = 69l;

    /**
     * The payment status description
     */
    public static final String DESC = "Deleted";
    
    /**
     * Default constructor   
     */
    public DeletedPaymentStatus() {
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
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public void inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        // do nothing
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new DeletedPaymentStatus();
        return newPaymentStatus;  
    }

}
