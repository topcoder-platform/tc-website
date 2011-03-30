/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SubmissionDAO;
import com.topcoder.web.common.dao.UploadDAO;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.common.model.comp.Submission;
import com.topcoder.web.common.model.comp.Upload;
import com.topcoder.web.studio.Constants;

import java.util.Date;
import java.util.List;

/**
 * <p>This class will process a request to update submission user rank.</p> 
 * 
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pvmagacho
 * @version 1.1
 */
public class UpdateSubmissionRank extends BaseSubmissionDataProcessor {
    /**
     * <p>Constructs new <code>UpdateSubmissionRank</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public UpdateSubmissionRank() {
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
            	Integer maxRank = submissionDAO.getMaxRank(uploads);
                int newRank = Integer.parseInt(getRequest().getParameter(Constants.SUBMISSION_RANK));
                getRequest().setAttribute("newRank", getRequest().getParameter(Constants.SUBMISSION_RANK));
                if (newRank > 0 && newRank <= maxRank) {
                	submissionDAO.changeRank(newRank, s, uploads);
                    closeConversation();
                    beginCommunication();
                }
            }
        } else {
            addError(Constants.SUBMISSION_ID + submissionId, "Sorry, you must be logged in order to perform the specified request.");
        }
        submissionDAO = factory.getSubmissionDAO();
        s = submissionDAO.find(new Integer(submissionId));
        loadSubmissionData(s.getResource(), s.getContest(), submissionDAO, factory.getUploadDAO(), s.getTypeId());
        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");	
    }    
}
