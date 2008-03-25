/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * <p>A request processor to be used for servicing the requests for deleting the submissions by the administrator. The
 * administrators may delete any submissions at any time but only if the submission hasn't been purchased yet.</p>
 *
 * @author TCSDEVELOPER
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
        if (userLoggedIn()) {
            if (!isSubmissionPurchased(String.valueOf(s.getId()))) {
                s.setStatus(StudioDAOUtil.getFactory().getSubmissionStatusDAO().find(SubmissionStatus.DELETED));
                dao.changeRank(null, s);
                closeConversation();
                beginCommunication();
            } else {
                throw new NavigationException("Illegal operation attempted. The submission is already purchased");
            }
        } else {
            addError(Constants.SUBMISSION_ID + submissionId,
                     "Sorry, you must be logged in order to perform the specified request.");
        }
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=AdminViewSubmissions&"
                    + Constants.CONTEST_ID + "=" + s.getContest().getId());
        setIsNextPageInContext(false);
    }

    /**
     * <p>Checks if the submission referenced by the specified ID has been already purchased.</p>
     *
     * @param submissionId a <code>String</code> providing the ID of a submission to get the payment status for.
     * @return <code>true</code> if specified submission has been purchased already; <code>false</code> otherwise.
     * @throws Exception if an unexpected error occurs.
     */
    public static boolean isSubmissionPurchased(String submissionId) throws Exception {
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("submission_payment");
        r.setProperty(Constants.SUBMISSION_ID, submissionId);
        ResultSetContainer result = da.getData(r).get("submission_payment");
        if (!result.isEmpty()) {
            ResultSetContainer.ResultSetRow row = result.getRow(0);
            Object paymentStatusId = row.getItem("payment_status_id").getResultData();
            if (paymentStatusId != null) {
                // The submission is considered purchased if it's payment status is Paid
                if (String.valueOf(paymentStatusId).equals("1")) {
                    return true;
                }
            }
        }
        return false;
    }
}
