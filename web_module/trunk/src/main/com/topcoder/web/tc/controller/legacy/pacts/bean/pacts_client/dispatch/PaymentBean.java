/**
 * this class is how the payment classes are obtained from the
 * db.  It does not do any error checking, that should be done int
 * the servlet that calls it.  It simply calls the appropriate
 * ejb methods and forms the correct objects
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

public class PaymentBean implements PactsConstants {
    private static Logger log = Logger.getLogger(PaymentBean.class);

    /**
     * contstuctor.  It does nothing because the class is stateless.
     */
    public PaymentBean() {
        //do nothing, stateless
    }

    /**
     * used to extract full payment details for a given payment
     *
     * @param paymentId the payment id
     * @return the payment information, or null if the payment id is bad
     */
    public Payment getPayment(long paymentId) {
        log.debug("getPayment, PaymentId = " + paymentId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getPayment(paymentId);
        } catch (Exception e1) {
            log.error("did not get affidavit in getAffidavit");
            e1.printStackTrace();
            return null;
        }

        Payment p = new Payment(reply, 0);
        return p;
    }

    /**
     * gets an array of payment headers for the given user.
     *
     * @param paymentId the payment id
     * @return the payment headers, or null if the payment id is bad
     */
    public PaymentHeader[] getPaymentsForUser(int memberId) {
        log.debug("getPaymentsForUser, memberId = " + memberId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getUserPaymentList(memberId);
        } catch (Exception e1) {
            log.error("did not get payment list in getPaymentsForUser");
            e1.printStackTrace();
            return null;
        }

        PaymentHeaderList plist = new PaymentHeaderList(reply);

        return plist.headerList;
    }
}

