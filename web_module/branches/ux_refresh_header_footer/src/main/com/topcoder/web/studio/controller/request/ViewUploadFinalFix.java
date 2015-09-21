/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.util.Util;

/**
 * <p>A controller to be used for servicing the requests for viewing the page for uploading the final fix submission for
 * requested <code>Studio</code> contest.</p>
 *
 * @author isv
 * @version 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
 */
public class ViewUploadFinalFix extends ShortHibernateProcessor {

    /**
     * <p>Constructs new <code>ViewUploadFinalFix</code> instance. This implementation does nothing.</p>
     */
    public ViewUploadFinalFix() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * <p>Checks if current user is a winner for requested contest and if not raised an exception. Otherwise binds the
     * details for requested contest to request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        // get contest data
        String contestIdValue = getRequest().getParameter(Constants.CONTEST_ID);
        int contestId = Integer.parseInt(contestIdValue);
        Project contest = DAOUtil.getFactory().getProjectDAO().find(contestId);

        // Check if user has a permission to upload a final fix for contest
        Long winnerUserId = Util.getWinnerUserId(contest.getId());
        if (winnerUserId == null) {
            throw new NavigationException("No winner have been selected for contest yet.");
        }
        if (getUser().getId() != winnerUserId) {
            throw new NavigationException("Only winner can upload the final fix.");
        }

        // Bind contest details to request and forward to JSP
        setDefault(Constants.CONTEST_ID, String.valueOf(contestId));
        getRequest().setAttribute("contest", contest);
        getRequest().setAttribute("isFinalFixUpload", true);
        setNextPage("/submit.jsp");
        setIsNextPageInContext(true);        
    }
}
