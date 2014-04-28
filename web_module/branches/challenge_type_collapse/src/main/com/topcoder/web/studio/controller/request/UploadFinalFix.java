/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.ProjectPhase;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;
import com.topcoder.web.studio.util.Util;

import java.util.List;

/**
 * <p>A controller to be used for servicing the requests for uploading the final fix submission for requested
 * <code>Studio</code> contest.</p>
 *
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class UploadFinalFix extends Submit {

    /**
     * <p>Constructs new <code>UploadFinalFix</code> instance. This implementation does nothing.</p>
     */
    public UploadFinalFix() {
    }

    /**
     * <p>Implements the business logic for request processing.</p>
     * 
     * <p> Validates the submission submitted by the user to server and stores it in local file system. Launches a 
     * separate thread for generating the alternate presentations of the submission.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        super.dbProcessing();

        if (Boolean.TRUE.equals(getRequest().getAttribute("success"))) {
            // Get the number of final fix rounds for contest
            String contestId = getRequest().getParameter(Constants.CONTEST_ID);
            Project contest = DAOUtil.getFactory().getProjectDAO().find(Integer.parseInt(contestId));
            int noOfFinalFixRounds = contest.getNoOfFinalFixRounds();

            // Build the URL for viewing the latest final fix round
            StringBuilder nextPage = new StringBuilder(50);
            nextPage.append(getSessionInfo().getServletPath());
            nextPage.append("?").append(Constants.MODULE_KEY).append("=ViewFinalFix");
            nextPage.append("&").append(Constants.CONTEST_ID).append("=").append(contestId);
            nextPage.append("&").append(Constants.FINAL_FIX_ROUND_NO).append("=").append(noOfFinalFixRounds);

            setNextPage(nextPage.toString());
            setIsNextPageInContext(false);
        }
    }

    /**
     * <p>Gets the type of the upload serviced by this controller.</p>
     *
     * @return {@link Upload#FINAL_FIX} always.
     */
    @Override
    protected int getUploadTypeId() {
        return Upload.FINAL_FIX;
    }

    /**
     * <p>Gets the project phase associated with the specified submission. This is always the most recent <code>Final 
     * Fix</code> phase.</p>
     *
     * @param project a <code>Project</code> providing details for requested contest.
     * @param submission a <code>Submission</code> the specified submission.
     * @return the project phase of the submission
     */
    @Override
    protected ProjectPhase getSubmissionPhase(Project project, Submission submission) {
        List<ProjectPhase> finalFixPhases = project.getFinalFixPhases();
        return finalFixPhases.get(finalFixPhases.size() - 1);
    }

    /**
     * <p>Gets the submission type for the upload.</p>
     *
     * @param project a <code>Project</code> providing the details for the contest to search for submission type.
     * @return {@link Submission#FINAL_FIX_SUBMISSION} always.
     */
    @Override
    protected Integer getSubmissionTypeId(Project project) {
        return Submission.FINAL_FIX_SUBMISSION;
    }

    /**
     * <p>Checks if specified user has a permission to access specified contest.</p>
     *
     * @param contest a <code>Project</code> providing the details for requested contest.
     * @param user a <code>User</code> representing the user account to check permission for.
     * @param resource a <code>Resource</code> providing the details for resource which might have been associated with
     * specified user for specified contest.
     * @return <code>true</code> if specified user has a permission to access the specified contest; <code>false</code>
     *         otherwise.
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected boolean hasPermission(Project contest, User user, Resource resource) throws Exception {
        Long winnerUserId = Util.getWinnerUserId(contest.getId());
        if ((winnerUserId == null) || (!winnerUserId.equals(user.getId()))) {
            throw new NavigationException("You are not allowed to submit final fix for this contest");        
        }
        return true;
    }
}
