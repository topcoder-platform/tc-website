/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;

/**
 * <p>This class will process a submission delete request.</p>
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
 * Version 1.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pvmagacho, TCSASSEMBER
 * @version 1.2
 */
public class DeleteSubmission extends BaseSubmissionDataProcessor {
    /**
     * <p>Constructs new <code>DeleteSubmission</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public DeleteSubmission() {
    }
    
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {        
        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        
        DAOFactory factory = DAOUtil.getFactory();
        SubmissionDAO submissionDAO = factory.getSubmissionDAO();
        UploadDAO uploadDAO = factory.getUploadDAO();
        Submission s = submissionDAO.find(new Integer(submissionId));
        
        if (!s.getSubmitterId().equals(getUser().getId())) {
            throw new NavigationException("Illegal operation attempted, submission doesn't belong to current user.");
        }
        List<Upload> uploads = uploadDAO.getUploads(s.getContest(), s.getResource(), Upload.STATUS_ACTIVE, Upload.SUBMISSION);

        if (userLoggedIn()) {
            Date now = new Date();
            if (now.before(s.getContest().getStartTime()) ||
                    now.after(s.getContest().getEndTime()) ||
                    !Project.STATUS_ACTIVE.equals(s.getContest().getStatusId())) {
                addError(Constants.SUBMISSION_ID + submissionId, "Sorry, you can not make a change to a submission for a contest that is not active.");
            } else {
                s.setStatusId(Submission.STATUS_DELETED);
                s.getUpload().setStatusId(Upload.STATUS_DELETED);
                submissionDAO.changeRank(null, s, uploads);
                closeConversation();
                beginCommunication();
            }
        } else {
            addError(Constants.SUBMISSION_ID + submissionId, "Sorry, you must be logged in order to perform the specified request.");
        }
        submissionDAO = factory.getSubmissionDAO();
        s = submissionDAO.find(new Integer(submissionId));
        loadSubmissionData(s.getResource(), s.getContest(), submissionDAO, factory.getUploadDAO());
        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");

    }
}
