/*
* PaymentStatusMediator
*
* Created Apr 23, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusMediator {
    private PaymentStatusManager statusManager = null;
    private Connection conn;

    public PaymentStatusMediator() {
        statusManager = new PaymentStatusManager();
    }

    public PaymentStatusMediator(Connection c, BasePayment payment) {
        this.conn = c;
        this.statusManager = new PaymentStatusManager(payment);
    }

    public PaymentStatusMediator(Connection c) {
        this.conn = c;
        this.statusManager = new PaymentStatusManager();
    }

    public PaymentStatusMediator(BasePayment payment) {
        this.statusManager = new PaymentStatusManager(payment);
    }

    public void newPayment() {
        // when a payment is created, the possible status can be any on hold, accruing and owed
        statusManager.newPayment();
    }

    public void newTaxForm(long userId) throws StateTransitionFailureException {
        try {
            // every on hold payment should be notified of the new taxform.
            DataInterfaceBean dib = new DataInterfaceBean();
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(userId));
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()));

            List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                statusManager.newTaxForm(payment);
                dib.updatePayment(conn, payment);
            }            
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

//    public void expiredAffidavit () {
//        statusManager.expiredAffidavit();
//    }

}
