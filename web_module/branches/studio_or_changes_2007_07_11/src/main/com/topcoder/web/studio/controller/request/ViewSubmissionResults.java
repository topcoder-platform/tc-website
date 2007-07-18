package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Submission;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2007
 */
public class ViewSubmissionResults extends BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        boolean isOver = new Date().after(s.getContest().getEndTime());

        if (!isOver && s.getResult()!=null) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        } else {
            //load reviewers
            //load reviewer scores
            //load final score
            getRequest().setAttribute("submission", s);
            setNextPage("/submissionResult.jsp");
            setIsNextPageInContext(true);

        }

    }
}

