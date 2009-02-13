package com.topcoder.web.openaim.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.dao.SubmissionDAO;
import com.topcoder.web.openaim.model.ContestStatus;
import com.topcoder.web.openaim.model.Submission;
import com.topcoder.web.openaim.model.SubmissionStatus;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2007
 */
public class DeleteSubmission extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        SubmissionDAO dao = OpenAIMDAOUtil.getFactory().getSubmissionDAO();
        Submission s = dao.find(new Long(submissionId));
        Integer maxRank = dao.getMaxRank(s.getContest(), s.getSubmitter());
        if (userLoggedIn()) {
            Date now = new Date();
            if (now.before(s.getContest().getStartTime()) ||
                    now.after(s.getContest().getEndTime()) ||
                    !ContestStatus.ACTIVE.equals(s.getContest().getStatus().getId())) {
                addError(Constants.SUBMISSION_ID + submissionId, "Sorry, you can not make a change to a submission for a contest that is not active.");
            } else if (s.getSubmitter().getId().equals(getUser().getId())) {
                s.setStatus(OpenAIMDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.DELETED));
                dao.changeRank(null, s);
                closeConversation();
                beginCommunication();

            } else {
                throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
            }
        } else {
            addError(Constants.SUBMISSION_ID + submissionId, "Sorry, you must be logged in order to perform the specified request.");
        }
        dao = OpenAIMDAOUtil.getFactory().getSubmissionDAO();
        s = dao.find(new Long(submissionId));
        loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank, s.getType().getId());
        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");

    }
}
