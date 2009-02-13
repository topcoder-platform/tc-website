package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.PaymentBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class PaymentHistory extends BaseProcessor implements PactsConstants {

	public static final String FULL_LIST = "full_list";
	public static final String PAYMENTS = "payments";
	
    protected void businessProcessing() throws TCWebException {
        try {
        	boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
        	
            PaymentBean paymentBean = new PaymentBean();
            
            Payment[] payments = paymentBean.getPaymentDetailsForUser(getUser().getId(), new int[0], !fullList);
            
            if (payments == null) {
            	payments = new Payment[0];            		
            }
/*            	
        	// Component IDs
        	long[] paymentIds = new long[payments.length];
        	for (int i=0; i<payments.length; i++) {
        		paymentIds[i] = payments[i].getHeader().getId();
        	}

            // Payment creation dates
           	String[] creationDates = paymentBean.getCreationDates(paymentIds);
           	
            for (int i=0; i<payments.length; i++) {
            	payments[0].setModifiedDate(creationDates[i]);
            }
*/            
            getRequest().setAttribute(PAYMENTS, payments);


        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("pacts/client/paymentHistoryNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

