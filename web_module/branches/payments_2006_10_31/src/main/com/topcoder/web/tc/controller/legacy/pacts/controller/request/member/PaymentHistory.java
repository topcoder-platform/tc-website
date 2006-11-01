package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
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
        	boolean sortAscending= "asc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        	int sortCol = 0;
        	
        	if (getRequest().getParameter(DataAccessConstants.SORT_DIRECTION) != null) {
        		sortCol = Integer.parseInt(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        	}
        	
            PaymentBean paymentBean = new PaymentBean();
            
            Payment[] payments = paymentBean.getPaymentDetailsForUser(getUser().getId(), new int[0], !fullList);
            
            if (payments == null) {
            	payments = new Payment[0];            		
            }

            
            getRequest().setAttribute(PAYMENTS, payments);
            
            DataInterfaceBean dib = new DataInterfaceBean();
            getRequest().setAttribute("payments2" ,dib.getPaymentHistory(getUser().getId(), !fullList, sortCol, sortAscending));

        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("pacts/client/paymentHistoryNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

