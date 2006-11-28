package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.Submission;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class UpdateSubmissionRank extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission s = dao.find(new Long(submissionId));

        Date now = new Date();
        if (now.before(s.getContest().getStartTime()) ||
                now.after(s.getContest().getEndTime()) ||
                !ContestStatus.ACTIVE.equals(s.getContest().getStatus().getId())) {
            throw new NavigationException("Sorry, you make a change to a submission for a contest that is not active.");
        } else if (s.getSubmitter().getId().longValue() == getUser().getId()) {
            int newRank = Integer.parseInt(getRequest().getParameter(Constants.SUBMISSION_RANK));
            Integer maxRank = dao.getMaxRank(s.getContest(), s.getSubmitter());
            if (newRank > 0 && newRank <= maxRank.intValue()) {
                dao.changeRank(new Integer(newRank), s);

                markForCommit();
                closeConversation();

                beginCommunication();

                dao = StudioDAOUtil.getFactory().getSubmissionDAO();
                s = dao.find(new Long(submissionId));
            }
            loadSubmissionData(s, dao, maxRank);

            setIsNextPageInContext(true);
            setNextPage("submitTableBody.jsp");
        } else {
            throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
        }
    }
}
