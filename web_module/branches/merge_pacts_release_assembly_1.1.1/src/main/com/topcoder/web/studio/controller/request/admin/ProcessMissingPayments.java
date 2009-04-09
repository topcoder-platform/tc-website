package com.topcoder.web.studio.controller.request.admin;

import java.lang.reflect.UndeclaredThrowableException;

import com.topcoder.service.studio.StudioService;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.StudioServiceLocator;

/**
 * @author aisacovich
 * @version $Revision
 */
public class ProcessMissingPayments extends Base {

    protected void dbProcessing() throws Exception {
        Long contestId;

        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }

        StudioService studioService = StudioServiceLocator.getService();
        if (log.isDebugEnabled()) {
            log.debug("got remote StudioServiceBean");
        }
        
        try {
        	studioService.processMissingPayments(contestId);
        } catch (UndeclaredThrowableException e) {
	    	log.warn("SocketException: " + e.getMessage() + " - Retrying...");
	        studioService = StudioServiceLocator.getService();
	        if (log.isDebugEnabled()) {
	            log.debug("got remote StudioServiceBean");
	        }
	        studioService.processMissingPayments(contestId);
        }

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissions&" + Constants.CONTEST_ID + "=" + contestId);
        setIsNextPageInContext(false);
    }
}
