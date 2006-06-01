package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author mktong
 * Create Date: May 16, 2006
 */
public class GenerateComponentPayments extends BaseProcessor implements PactsConstants {
	
    protected void businessProcessing() throws TCWebException {
        try {
        	DataInterfaceBean dib = new DataInterfaceBean();
            Map map = dib.getProjectTerminationStatusTypes();
            getRequest().setAttribute(PROJECT_TERMINATION_STATUS_LIST, map.get(PROJECT_TERMINATION_STATUS_LIST));
            setNextPage(INTERNAL_GENERATE_COMPONENT_PAYMENTS);
            setIsNextPageInContext(true);
            
            String projectID = StringUtils.checkNull(getRequest().getParameter(PROJECT_ID)).trim();
            String projectTermStatus = StringUtils.checkNull(getRequest().getParameter(PROJECT_TERMINATION_STATUS));
            if (!projectID.equals("") && !projectTermStatus.equals("")) {
                DataInterfaceBean bean = new DataInterfaceBean();
                int[] counts;
                log.debug("status type " + getRequest().getParameter(PROJECT_TERMINATION_STATUS));
                counts = bean.generateComponentPayments(Long.parseLong(getRequest().getParameter(PROJECT_ID)),
                		Integer.parseInt(getRequest().getParameter(PROJECT_TERMINATION_STATUS)), true);
                addError(PROJECT_ID, "Success: " + counts[0] + " design/dev payments generated, " + counts[1] + " review board payments generated");
            } else {
            	if (projectID.equals("")) {
            		addError(PROJECT_ID, "Error: Missing project id");
            	}
            	if (projectTermStatus.equals("")) {
            		addError(PROJECT_TERMINATION_STATUS, "Error: Missing project termination status");
            	}
            }
        } catch (NumberFormatException e) {
            addError(PROJECT_ID, "Error: Please enter a value for project id");
        } catch (IllegalUpdateException e) {
            throw new NavigationException(e.getMessage());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
