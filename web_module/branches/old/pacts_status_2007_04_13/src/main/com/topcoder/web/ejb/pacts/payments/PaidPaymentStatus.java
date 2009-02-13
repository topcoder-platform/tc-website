/*
* PaidPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;


/**
 * This class represents a Paid status for payments. 
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaidPaymentStatus extends BasePaymentStatus {

    /**
     * The payment status id
     */
    public static final Long ID = 53l;

    /**
     * The payment status description
     */
    public static final String DESC = "Paid";
    
    /**
     * Default constructor   
     */
    public PaidPaymentStatus() {
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
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new PaidPaymentStatus();
        return newPaymentStatus;  
    }
}

