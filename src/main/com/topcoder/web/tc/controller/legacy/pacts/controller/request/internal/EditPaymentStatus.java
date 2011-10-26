package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.StateTransitionFailureException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 * update a payment status.
 *
 * @author  pulky
 */
public class EditPaymentStatus extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            long paymentId = 0;
            try {
                paymentId = getLongParameter(PAYMENT_ID);
            } catch (IllegalArgumentException iae) {
            }            

            if (paymentId == 0) {
                throw new IllegalArgumentException("Missing parameter " + PAYMENT_ID);
            }

            DataInterfaceBean dib = new DataInterfaceBean();
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, String.valueOf(paymentId));

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                throw new StateTransitionFailureException("Not exactly one result found for payment: " + paymentId);
            }
            
            BasePayment payment = payments.get(0);
            
            getRequest().setAttribute("payment", payment);
            getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(payment.getCoderId())));
            getRequest().setAttribute("payment_status_list", PaymentStatusFactory.getActiveStatusList());
            getRequest().setAttribute("payment_status_reason_list", PaymentStatusReason.getAllStatusReasonList());
            
            setNextPage(INTERNAL_EDIT_PAYMENT_STATUS_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

