package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.StateTransitionFailureException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * update a payment status.
 *
 * @author  pulky
 */
public class UpdatePaymentStatus extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            long paymentId = 0;
            try {
                paymentId = getLongParameter(PAYMENT_ID);
            } catch (IllegalArgumentException iae) {
            }            

            long newStatusId = 0;
            try {
                newStatusId = getLongParameter("new_status_id");
            } catch (IllegalArgumentException iae) {
            }            
            
            if (paymentId + newStatusId == 0) {
                throw new IllegalArgumentException("Missing parameter " + PAYMENT_ID + " or new_status_id");
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
            
            BasePaymentStatus bps = PaymentStatusFactory.createStatus(newStatusId);
            
            String[] reasonIds = getRequest().getParameterValues("new_status_reason_id");
            
            if (reasonIds != null) { 
                for (String reasonId : reasonIds) {
                    bps.getReasons().add(PaymentStatusReason.getStatusReasonUsingId(Long.decode(reasonId)));
                }
            }
            
            payment.setCurrentStatus(bps);
            
            dib.updatePayment(payment, true);
            
            setNextPage(Links.viewPayment(paymentId));
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

