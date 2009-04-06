package com.topcoder.web.studio.controller.request.admin;

import java.lang.reflect.UndeclaredThrowableException;
import java.util.HashSet;

import com.topcoder.service.studio.StudioService;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.StudioServiceLocator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends Base /*extends SubmissionPrizeBase*/ {
	

    @Override
    protected void dbProcessing() throws Exception {
        // submission id, that will retrieved from request
        Long submissionId;
        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        // prize id, that will retrieved from request
        Long prizeId;
        if (!"".equals(StringUtils.checkNull(getRequest().getParameter(Constants.PRIZE_ID)))) {
            try {
                prizeId = new Long(getRequest().getParameter(Constants.PRIZE_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid prize Specified");
            }
        } else {
            throw new NavigationException("Invalid prize Specified");
        }
        if (log.isDebugEnabled()) {
            log.debug("submission id: " + submissionId + " got prize: " + prizeId);
        }

        if (log.isDebugEnabled()) {
            	 log.debug("logged in");
        }

        StudioService studioService = StudioServiceLocator.getService();
        if (log.isDebugEnabled()) {
            log.debug("got remote StudioServiceBean");
        }
        
        try {
        studioService.setSubmissionPlacement(submissionId, prizeId);
        } catch (UndeclaredThrowableException e) {
	    	log.warn("SocketException: " + e.getMessage() + " - Retrying...");
	        studioService = StudioServiceLocator.getService();
	        if (log.isDebugEnabled()) {
	            log.debug("got remote StudioServiceBean");
	        }
	        studioService.setSubmissionPlacement(submissionId, prizeId);
        }

        try {
            HashSet<String> cachedStuff = new HashSet<String>();
            cachedStuff.add(Constants.CONTEST_ID + "=" + getRequest().getParameter(Constants.CONTEST_ID));
            cachedStuff.add("studio_home_data");
            CacheClearer.removelike(cachedStuff);
        } catch (Exception ignore) {
                ignore.printStackTrace();
        }
        // redirect
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);
    }

}


