package com.topcoder.web.csf.controller.request;

import com.topcoder.web.studio.controller.request.*;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 28, 2006
 */
public class ViewSubmissionSuccess extends com.topcoder.web.studio.controller.request.BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {

            String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
            SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
            Submission s = dao.find(new Long(submissionId));
            if (s.getSubmitter().getId().longValue() == getUser().getId()) {
                loadSubmissionData(s.getSubmitter(), s.getContest(), dao);
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
