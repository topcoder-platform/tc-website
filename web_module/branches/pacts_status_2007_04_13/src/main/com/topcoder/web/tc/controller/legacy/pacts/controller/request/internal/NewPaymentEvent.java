package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.InvalidStateTransitionException;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusMediator;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusMediator.UserEvents;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch.InternalDispatchPaymentList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class NewPaymentEvent extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        String[] values = getRequest().getParameterValues(PAYMENT_ID);
        DataInterfaceBean dib = new DataInterfaceBean();

        int event = Integer.parseInt(getRequest().getParameter("status_id"));
        
        Map criteria = new HashMap();
        for (String paymentId : values) {
            criteria.clear();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId);
            BasePayment payment = null;
            try {
                payment = dib.findCoderPayments(criteria).get(0);
            } catch (RemoteException re) {
                throw new TCWebException(re);
            }

            PaymentStatusMediator psm = new PaymentStatusMediator();

            try {
                switch (event) {
                case 1:
                    psm.newUserEvent(payment, UserEvents.ENTER_INTO_PAYMENT_SYSTEM_EVENT);
                    break;
                case 2:
                    psm.newUserEvent(payment, UserEvents.PAY_EVENT);
                    break;
                case 3:
                    psm.newUserEvent(payment, UserEvents.DELETE_EVENT);
                    break;
                }
            } catch (InvalidStateTransitionException iste) {
                addError("err_" + payment.getId(), iste.getMessage());
            }
        }
        
        if (!hasErrors()) {
            // notify payments and update them
        } 
        
        String query = getRequest().getQueryString();
        query = INTERNAL_SERVLET_URL + "?" + query;
        getRequest().setAttribute("query", query);

        InternalDispatchPaymentList bean =
                new InternalDispatchPaymentList(getRequest(), getResponse());
        
        PaymentHeader[] results;
        try {
            results = bean.get();
        } catch (Exception e) {
            throw new TCWebException(e);            
        }
        
        if (results.length != 1) {
            try {
                getRequest().setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PAYMENT_OBJ).get(STATUS_CODE_LIST));
            } catch (Exception e) {
                throw new TCWebException(e);            
            }
            getRequest().setAttribute(PACTS_INTERNAL_RESULT, results);

            setNextPage(INTERNAL_PAYMENT_LIST_JSP);
            setIsNextPageInContext(true);
        }
    }
}

