package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.web.studio.util.FileGenerator;

import java.io.FileInputStream;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use only in connection with a TopCoder competition.
 *
 * @author dok
 * @version $Id$
 *          Create Date: Apr 22, 2008
 */
public class RegenerateImages extends Base {
    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);
        if (s.getType().getId().equals(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE)) {
            FileGenerator f = new FileGenerator(s.getContest(), s,
                    new FileInputStream(s.getPath().getPath() + s.getSystemFileName()), s.getSubmitter());
            f.generateFiles();
        }
        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                "=ViewSubmissionDetail&" + Constants.SUBMISSION_ID + "=" + s.getId());
        setIsNextPageInContext(false);

    }
}
