package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaidPaymentStatus;
import com.topcoder.web.ejb.pacts.payments.BasePaymentStatus;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusReason;
import com.topcoder.web.ejb.pacts.payments.StateTransitionFailureException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
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
			
            if (getRequest().getParameter("new_status_id") != null) {
            	// The user is trying to save the payment status, so check that the parameters are ok.

                long newStatusId = 0;
                try {
                    newStatusId = getLongParameter("new_status_id");
                } catch (IllegalArgumentException iae) {
                }
				
                if (newStatusId == 0) {
                    throw new IllegalArgumentException("Missing parameter " + PAYMENT_ID + " or new_status_id");
                }
				
                BasePaymentStatus bps = PaymentStatusFactory.createStatus(newStatusId);
                String[] reasonIds = getRequest().getParameterValues("new_status_reason_id");
                if (reasonIds != null) { 
                    for (String reasonId : reasonIds) {
                        bps.getReasons().add(PaymentStatusReason.getStatusReasonUsingId(Long.decode(reasonId)));
                    }
                }
            
                payment.setCurrentStatus(bps);
                if (bps.getId()==PaidPaymentStatus.ID)  {
                    Date payDate = checkDate("pay_date", "Please enter a valid pay date");
                    payment.setPaidDate(payDate);
                }
				
                if (!hasErrors()) {
                    long currentUserId = getAuthentication().getActiveUser().getId();
                    dib.updatePayment(payment, true, currentUserId);

                    setNextPage(Links.viewPayment(paymentId));
                    setIsNextPageInContext(false);
                }
            }
			
            if (getRequest().getParameter("new_status_id") == null || hasErrors()) {
                // The user is loading the page, so set the default values

                getRequest().setAttribute("payment", payment);
                getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(payment.getCoderId())));
                getRequest().setAttribute("payment_status_list", PaymentStatusFactory.getActiveStatusList());
                getRequest().setAttribute("payment_status_reason_list", PaymentStatusReason.getAllStatusReasonList());
            
                setNextPage(INTERNAL_EDIT_PAYMENT_STATUS_JSP);
                setIsNextPageInContext(true);
			}
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

