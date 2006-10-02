package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * 
 * @author  cucu
 */
public class AddAffidavit extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
    	long paymentId = getOptionalLongParameter(PAYMENT_ID);
    	long roundId = getOptionalLongParameter(ROUND_ID);
    	long userId = Long.parseLong(getRequest().getParameter(USER_ID));
    	
        try {
            DataInterfaceBean dib = new DataInterfaceBean();

            getRequest().setAttribute(PACTS_INTERNAL_RESULT, getUserProfileHeader(userId));

            // Give the JSP the list of Affidavit Types
            Map map = dib.getAffidavitTypes();
            getRequest().setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));

            // Give the JSP the list of Affidavit Statuses
            map = dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ);
            getRequest().setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

        	// Give the JSP the list of Rounds
        	map = dib.getRounds();
        	getRequest().setAttribute(ROUND_LIST, map.get(ROUND_LIST));
        
        	if (paymentId > 0) {
                Payment payment = new Payment(dib.getPayment(paymentId));            
                getRequest().setAttribute("payment", payment);
        	}
        	
            setNextPage("/pacts/internal/addAffidavitNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

