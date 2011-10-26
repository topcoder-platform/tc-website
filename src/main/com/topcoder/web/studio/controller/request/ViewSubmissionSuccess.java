/*
 * Copyright (C) 2006-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Submission;

/**
 * <p>A controller for handling the requests for viewing the <code>Submission Uploading Success</code> page once the
 * submission is uploaded to server successfully.</p>
 *
 * <p>
 * Version 1.1 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #dbProcessing()} method to remove the progress info for upload associated with submission from
 *     current session.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, isv, pvmagacho, TCSASSEMBER
 * @version 1.3
 */
public class ViewSubmissionSuccess extends BaseSubmissionDataProcessor {

    /**
     * <p>Constructs new <code>ViewSubmissionSuccess</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public ViewSubmissionSuccess() {
    }

    /**
     * <p>Handles the incoming request. Loads submission data and binds it to request and forwards the request to
     * <code>submissionSuccess.jsp</code>. Also removes the progress info for associated upload from session.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
            SubmissionDAO dao = DAOUtil.getFactory().getSubmissionDAO();
            Submission s = dao.find(new Integer(submissionId));
            Resource resource = RegistrationHelper.getSubmitterResource(s.getContest(), getUser().getId());
            if (resource != null) {
                loadSubmissionData(resource, s.getContest(), dao, DAOUtil.getFactory().getUploadDAO());
                setIsNextPageInContext(true);
                setNextPage("submissionSuccess.jsp");
                
                // Clean-up the upload progress info from session
                String uploadId = getRequest().getParameter(Constants.UPLOAD_ID);
                UploadProgress.cleanup(getRequest(), uploadId);
            } else {
                throw new NavigationException("Illegal operation attempted, submission doesn't belong to current "
                                              + "user.");
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
