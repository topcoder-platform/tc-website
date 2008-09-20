package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.admin.controller.request.Base;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

public class AddSubmissionPrize2 extends Base {

	@Override
	protected void businessProcessing() throws Exception {
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
                throw new NavigationException("Invalid prize Specified");
            }
        } else {
            throw new NavigationException("Invalid prize Specified");
        }
        throw new RuntimeException("AddSubmissionPrize2: submissionId=" + submissionId + " prizeId=" + prizeId);
		/*
		InitialContext ctx = new InitialContext();
		StudioService studioService = (StudioService)ctx.lookup("StudioServiceBean/remote");
		studioService.setSubmissionPlacement(submissionId, prizeId);
*/
	}

}
