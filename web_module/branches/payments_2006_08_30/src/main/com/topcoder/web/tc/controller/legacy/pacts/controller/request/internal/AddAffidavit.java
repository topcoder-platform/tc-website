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
        try {
        	long paymentId = getOptionalLongParameter(PAYMENT_ID);
        	long userId = getLongParameter(USER_ID);

        	DataInterfaceBean dib = new DataInterfaceBean();

        	if (getRequest().getParameter("affidavit_desc") != null) {
        		String desc = (String) getRequest().getParameter("affidavit_desc");
        		int statusId = Integer.parseInt(getRequest().getParameter("affidavit_status_id"));
        		int typeId = Integer.parseInt(getRequest().getParameter("affidavit_type_id"));
        		String notarized = (String) getRequest().getParameter("is_notarized");
        		
        		if (notarized == null) {
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
            		setDefault("affidavit_desc", desc);
            		setDefault("affidavit_status_id", statusId + "");
            		setDefault("is_notarized", notarized);
            		setDefault("affidavit_type_id", typeId + "");
            		setDefault("text", getRequest().getParameter("text"));        		
            	} else {     	
                	long roundId = getOptionalLongParameter(ROUND_ID);

                	// Save the Affidavit
	                Affidavit a = new Affidavit(
	                        // If the round id is invalid, there is no round.
	                		roundId < 0 ? null : new Long(roundId),
	                        userId,
	                        statusId,
	                        desc,
	                        typeId,
	                        false, notarized.equalsIgnoreCase("yes"));
	
	
	                String text = "".equals(StringUtils.checkNull(getRequest().getParameter("text"))) ? null : getRequest().getParameter("text");
	                long affidavitId = dib.addAffidavit(a, text, null);
	                setNextPage("/PactsInternalServlet?t=view&c=affidavit&affidavit_id="+affidavitId);
	                setIsNextPageInContext(false);
	                return;
            	}

        	} else {
        		setDefault("is_notarized", "no");
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
                setDefault("affidavit_desc", "Affidavit for " + payment.getHeader().getDescription());
        	}
        	
            setNextPage(INTERNAL_ADD_AFFIDAVIT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

