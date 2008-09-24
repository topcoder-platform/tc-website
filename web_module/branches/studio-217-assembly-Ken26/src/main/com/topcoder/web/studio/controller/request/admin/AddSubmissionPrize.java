package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.StudioServiceLocator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 29,
 *          2006
 */
public class AddSubmissionPrize extends Base {

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
			StudioServiceLocator.getService().setSubmissionPlacement(submissionId, prizeId);
		} catch (Exception e) {
			throw new NavigationException("Submission could not be assigned to a prize");
		}

        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + submissionId);
        setIsNextPageInContext(false);

    }

}