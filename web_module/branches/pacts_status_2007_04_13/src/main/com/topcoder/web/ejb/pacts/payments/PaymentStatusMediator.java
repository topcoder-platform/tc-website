/*
* PaymentStatusMediator
*
* Created Apr 23, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import com.topcoder.web.ejb.pacts.BasePayment;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusMediator {
    private PaymentStatusManager statusManager = null;

    public PaymentStatusMediator() {
            statusManager = new PaymentStatusManager();
        }

    public PaymentStatusMediator(BasePayment payment) {
        statusManager = new PaymentStatusManager(payment);
        }

    public void newPayment() {
        // when a payment is created, the possible status can be any on hold, accruing and owed

        statusManager.newPayment();
    }

    public void newTaxForm(long userId) {
        statusManager.newTaxForm();
    }

    public void expiredAffidavit () {
        statusManager.expiredAffidavit();
    }

}
