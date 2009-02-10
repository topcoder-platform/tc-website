package com.topcoder.web.aolicq.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.dao.SubmissionDAO;
import com.topcoder.web.aolicq.model.Submission;

/**
 * @author pulky
 */
public class ViewFinalSubmissionSuccess extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
            SubmissionDAO dao = AolicqDAOUtil.getFactory().getSubmissionDAO();
            Submission s = dao.find(new Long(submissionId));
            if (s.getSubmitter().getId().equals(getUser().getId())) {
                loadSubmissionData(s.getSubmitter(), s.getContest(), dao, s.getType().getId());
                setIsNextPageInContext(true);
                setNextPage("finalSubmissionSuccess.jsp");
            } else {
                throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
