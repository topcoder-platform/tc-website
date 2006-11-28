package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Submission;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 20, 2006
 */
public class UpdateSubmissionRank extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {

        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission s = dao.find(new Long(submissionId));
        if (s.getSubmitter().getId().longValue() == getUser().getId()) {
            String newRank = getRequest().getParameter(Constants.SUBMISSION_RANK);
            dao.changeRank(new Integer(newRank), s);
            markForCommit();
            closeConversation();
            beginCommunication();

        } else {
            throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
        }

        getRequest().setAttribute("submissions", dao.getSubmissions(s.getSubmitter(), s.getContest()));
        getRequest().setAttribute("contest", s.getContest());
        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");

    }
}
