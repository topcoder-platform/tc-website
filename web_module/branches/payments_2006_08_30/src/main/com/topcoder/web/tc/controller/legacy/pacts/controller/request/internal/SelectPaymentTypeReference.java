package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * @author  cucu
 */
public class SelectPaymentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
        	int refId = Integer.parseInt(getRequest().getParameter("reference_id"));
        	String search = getRequest().getParameter("search_text");
        	log.info("SelectPaymentTypeReference: reference_id=" + refId);
        	if (search != null) {	            
	            DataInterfaceBean dib = new DataInterfaceBean();
	            
	            Map map = null;
	            switch (refId) {
	            case REFERENCE_ALGORITHM_PROBLEM_ID:
	            	map = dib.findProblems("%" + search + "%");	            
	            	getRequest().setAttribute(ALGORITHM_PROBLEM_LIST, map.get(ALGORITHM_PROBLEM_LIST));	            	
	            	break;
	            case REFERENCE_COMPONENT_PROJECT_ID:
	            	map = dib.findProjects("%" + search + "%");	            
	            	getRequest().setAttribute(COMPONENT_PROJECT_LIST, map.get(COMPONENT_PROJECT_LIST));
	            	break;	            	
	            }
	            
	            
        	}
        	getRequest().setAttribute("reference_id", refId + "");
            setNextPage(INTERNAL_SELECT_PAYMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

