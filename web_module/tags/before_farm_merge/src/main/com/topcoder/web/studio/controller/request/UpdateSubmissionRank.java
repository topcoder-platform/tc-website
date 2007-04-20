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
        Integer maxRank = dao.getMaxRank(s.getContest(), s.getSubmitter());
        if (userLoggedIn()) {
            Date now = new Date();
            if (now.before(s.getContest().getStartTime()) ||
                    now.after(s.getContest().getEndTime()) ||
                    !ContestStatus.ACTIVE.equals(s.getContest().getStatus().getId())) {
                addError(Constants.SUBMISSION_ID+submissionId, "Sorry, you can not make a change to a submission for a contest that is not active.");
            } else if (s.getSubmitter().getId().longValue() == getUser().getId()) {
                int newRank = Integer.parseInt(getRequest().getParameter(Constants.SUBMISSION_RANK));
                getRequest().setAttribute("newRank", getRequest().getParameter(Constants.SUBMISSION_RANK));
                if (newRank > 0 && newRank <= maxRank.intValue()) {
                    dao.changeRank(new Integer(newRank), s);
                    closeConversation();
                    beginCommunication();
                }
            } else {
                throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
            }
        } else {
            addError(Constants.SUBMISSION_ID+submissionId, "Sorry, you must be logged in order to perform the specified request.");
        }
        dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        s = dao.find(new Long(submissionId));
        loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank, s.getType().getId());
        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");

    }
}
