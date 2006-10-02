package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
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

        	if (getRequest().getParameter("affidavit_desc") != null) {
        		String desc = (String) getRequest().getParameter("affidavit_desc");
        		int statusId = Integer.parseInt(getRequest().getParameter("affidavit_status_id"));
        		int typeId = Integer.parseInt(getRequest().getParameter("affidavit_type_id"));
        		String notarized = (String) getRequest().getParameter("is_notarized");
        		
        		if (!notarized.equalsIgnoreCase("yes") && !notarized.equalsIgnoreCase("no")) {
        			addError("error", "Please select whether the affidavit is notarized.");
        		}
        		if (statusId < 0) {
        			addError("error", "Please select a status");
        		}
        		if (desc.trim().length() == 0) {
        			addError("error", "Please enter a description for the affidavit.");
        		}
        		if (typeId < 0) {
        			addError("error", "Please select a type");
        		}
        		
        		

        		if (hasErrors()) {
            		setDefault("affidavit_desc", getRequest().getParameter("affidavit_desc"));
            		setDefault("affidavit_status_id", getRequest().getParameter("affidavit_status_id"));
            		setDefault(IS_NOTARIZED, getRequest().getParameter(IS_NOTARIZED));
            		setDefault("affidavit_type_id", getRequest().getParameter("affidavit_type_id"));
            		setDefault("round_id", getRequest().getParameter("round_id"));
            		setDefault("text", getRequest().getParameter("text"));        		
            	} else {     	
	                // Save the Affidavit
	                Affidavit a = new Affidavit(
	                        // If the round id is invalid, there is no round.
	                		roundId < 0 ? null : new Long(roundId),
	                        userId,
	                        statusId,
	                        desc,
	                        typeId,
	                        false,notarized.equalsIgnoreCase("yes"));
	
	
	                String text = "".equals(StringUtils.checkNull(getRequest().getParameter("text"))) ? null : getRequest().getParameter("text");
	                long affidavitId = dib.addAffidavit(a, text, null);
	                setNextPage("/PactsInternalServlet?t=view&c=affidavit&affidavit_id="+affidavitId);
	                setIsNextPageInContext(false);
	                return;
            	}

        	}
        	

            getRequest().setAttribute("user", getUserProfileHeader(userId));

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

