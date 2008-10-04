package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.StudioServiceLocator;

/**
 * AddSubmissionPrize has been refactored in order to delegate the submission placement 
 * to EJB 3 Studio services located in Cockpit Application Server. <br>
 * See : Assembly Contest - TopCoder Studio setSubmissionPlacement Service Integration  version 1.0
 * 
 * @author dok
 * @author TCSDEVELOPER
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 29, 2006
 */
public class AddSubmissionPrize extends Base {
	
	private static Logger log = Logger.getLogger(AddSubmissionPrize.class);
	
	protected void dbProcessing() throws Exception {

        Long submissionId;
        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Long prizeId = null;
        if (!"".equals(StringUtils.checkNull(getRequest().getParameter(Constants.PRIZE_ID)))) {
            try {
                prizeId = new Long(getRequest().getParameter(Constants.PRIZE_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Prize Specified");
            }
        } else {
            throw new NavigationException("Invalid Prize Specified");
        }
        
		try {
			log.debug("About to call StudioService setSubmissionPlacement(submissionId:" + submissionId + ", prizeId:" + prizeId + ")");
			StudioServiceLocator.getService().setSubmissionPlacement(submissionId, prizeId);
			log.debug("setSubmissionPlacement successfull");
		} catch (Exception e) {
			throw new NavigationException("Submission could not be assigned to a prize");
		}

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);

    }

}