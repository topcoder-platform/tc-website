/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.Util;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.common.NavigationException;

/**
 * <p>A request processor to be used for servicing the requests for deleting the submissions by the administrator. The
 * administrators may delete any submissions at any time but only if the submission hasn't been purchased yet.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.2)
 */
public class DeleteSubmission extends Base {

    /**
     * <p>Constructs new <code>DeleteSubmission</code> instance. This implementation does nothing.</p>
     */
    public DeleteSubmission() {
    }

    /**
     * <p>Implements the business logic for request processing.</p>
     *
     * <p>Verifies that the user is currently logged in and if the requested submission hasn't been purchased yet. If
     * verification is successful then deletes the requested submission and redirects the request to a view with
     * list of submission for original contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        SubmissionDAO dao = StudioDAOUtil.getFactory().getSubmissionDAO();
        Submission s = dao.find(new Long(submissionId));
        if (!Util.isSubmissionPurchased(String.valueOf(s.getId()))) {
            s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.DELETED));
            dao.changeRank(null, s);
            closeConversation();
            beginCommunication();
        } else {
            throw new NavigationException("Illegal operation attempted. The submission is already purchased");
        }
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=ViewSubmissions&"
                    + Constants.CONTEST_ID + "=" + s.getContest().getId());
        setIsNextPageInContext(false);
    }
}
