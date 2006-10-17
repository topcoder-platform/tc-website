package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.AffidavitBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.PaymentBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
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
            int[] paymentTypes = {COMPONENT_PAYMENT, CHARITY_PAYMENT, REVIEW_BOARD_PAYMENT, ONE_OFF_PAYMENT};
            
            Payment[] payments = paymentBean.getPaymentDetailsForUser(getUser().getId(), paymentTypes, !fullList);
            
            if (payments == null) {
            	payments = new Payment[0];            		
            }
            	
            getRequest().setAttribute(PAYMENTS, payments);
            	/*
            
            	// Component IDs
            	long[] paymentIds = new long[payments.length];
            	for (int i=0; i<payments.length; i++) {
            		paymentIds[i] = payments[i].getHeader().getId();
            	}
    	    Map componentIdMap = paymentBean.getPaymentComponentData(paymentIds);
                request.setAttribute(COMPONENT_DATA, componentIdMap);
                
                // Payment creation dates
                try {
                	String[] creationDates = paymentBean.getCreationDates(paymentIds);
                	request.setAttribute(CREATION_DATE_LIST, creationDates);
                } catch (Exception e1) {
            		log.error("error in doAffidavitHistory");
                    e1.printStackTrace();
            	}            
*/
            getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("pacts/client/paymentHistoryNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

