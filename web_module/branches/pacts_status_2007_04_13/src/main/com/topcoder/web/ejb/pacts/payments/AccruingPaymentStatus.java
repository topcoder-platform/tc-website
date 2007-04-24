/*
* AccruingPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager.AvailableStatus;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AccruingPaymentStatus extends BasePaymentStatus {

    private static final Logger log = Logger.getLogger(AccruingPaymentStatus.class);

    public static final Long ACCRUING_PAYMENT_STATUS_ID = 71l;
    public static final String ACCRUING_PAYMENT_STATUS_DESC = "Accruing";
    
    /**
     * 
     */
    public AccruingPaymentStatus() {
        super();
    }
    
    @Override
    public String getDesc() {
        return ACCRUING_PAYMENT_STATUS_DESC;
    }

    @Override
    public Long getId() {
        return ACCRUING_PAYMENT_STATUS_ID;
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
    public void newPayment(BasePayment payment) throws InvalidStateTransitionException {
        try {
//            DataInterfaceBean dib = new DataInterfaceBean();
    
            // check for accruing amount

            // if no need for accruing, go to the next state
            nextState(payment);
        } catch (Exception e) {
            throw new InvalidStateTransitionException(e);
        }
    }

    @Override
    public void nextState(BasePayment payment) {
        log.debug("moving to the next state!");
        payment.setCurrentStatus(AvailableStatus.OWED_PAYMENT_STATUS.getStatus().clone());
    }
    
    @Override
    public BasePaymentStatus clone() {
        BasePaymentStatus newPaymentStatus = new AccruingPaymentStatus();
        newPaymentStatus.reasons = this.getReasons();
        return newPaymentStatus;  
    }
}
