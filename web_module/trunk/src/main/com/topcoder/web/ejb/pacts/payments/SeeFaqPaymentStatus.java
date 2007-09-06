package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * This class represents a See Faq status for payments.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
* @author Pablo Wolfus (pulky)
* @version $Id$
*/
public class SeeFaqPaymentStatus extends BasePaymentStatus {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The payment status id
     */
    public static final Long ID = 101l;

    /**
     * Default constructor
     */
    public SeeFaqPaymentStatus() {
        super();
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
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        // do nothing
        return 0;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new SeeFaqPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }

}
