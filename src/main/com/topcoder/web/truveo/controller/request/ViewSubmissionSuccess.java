package com.topcoder.web.truveo.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.dao.SubmissionDAO;
import com.topcoder.web.truveo.model.Submission;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
public class ViewSubmissionSuccess extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {

            String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
            SubmissionDAO dao = TruveoDAOUtil.getFactory().getSubmissionDAO();
            Submission s = dao.find(new Long(submissionId));
            if (s.getSubmitter().getId().equals(getUser().getId())) {
                loadSubmissionData(s.getSubmitter(), s.getContest(), dao, s.getType().getId());
                setIsNextPageInContext(true);
                setNextPage("submissionSuccess.jsp");
            } else {
                throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
