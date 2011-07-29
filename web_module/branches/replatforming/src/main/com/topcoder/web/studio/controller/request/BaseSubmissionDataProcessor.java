/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;

/**
 * <p>
 * Base class for all submission request's controllers.
 * </p>
 * 
 * <p>
 * Version 1.1 (Re-platforming Studio Release 3 Assembly):
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
abstract class BaseSubmissionDataProcessor extends ShortHibernateProcessor {
    /**
     * Gets the submission associated with the user and project.
     * 
     * @param user the user used to retrieve the submission
     * @param project the project associated with the submission
     * @param submissionDAO the DAO to retrieve <code>Submission</code> information
     * @param uploadDAO the DAO to retrieve <code>Upload</code> information
     */
    void loadSubmissionData(User user, Project project, SubmissionDAO submissionDAO, UploadDAO uploadDAO) {
        // Retrieve the resource associated with the project
        Resource resource = RegistrationHelper.getSubmitterResource(project, user.getId());
        if (resource != null) {
            loadSubmissionData(resource, project, submissionDAO, uploadDAO);
        }
    }

    /**
     * Gets the submission associated with the user and project.
     * 
     * @param user the user used to retrieve the submission
     * @param project the project associated with the submission
     * @param submissionDAO the DAO to retrieve <code>Submission</code> information
     * @param uploadDAO the DAO to retrieve <code>Upload</code> information
     */
    void loadSubmissionData(Resource resource, Project project, SubmissionDAO submissionDAO, UploadDAO uploadDAO) {
        getRequest().setAttribute("contest", project);
        
        // Get all uploads associated with the contest and resource information
        List<Upload> uploads = uploadDAO.getUploads(project, resource, Upload.SUBMISSION, Upload.STATUS_ACTIVE);
        
        List<Integer> subStatusIds = new ArrayList<Integer>();
        subStatusIds.add(Submission.STATUS_ACTIVE);
        subStatusIds.add(Submission.COMPLETED_WITHOUT_WIN);
        
        List<Integer> subTypeIds = new ArrayList<Integer>();
        subTypeIds.add(Submission.CONTEST_SUBMISSION);
        subTypeIds.add(Submission.MILESTONE_SUBMISSION);
        
        if (uploads != null && uploads.size() > 0) {
            Integer maxRank = submissionDAO.getMaxRank(uploads);
            getRequest().setAttribute("maxRank", maxRank);

            List<Submission> submissions = submissionDAO.getSubmissions(uploads, subTypeIds, 
                    subStatusIds);
            for (Submission curr : submissions) {
                setDefault(Constants.SUBMISSION_ID + curr.getId(), curr.getRank());
            }

            getRequest().setAttribute("submissions", submissions);
        }
        getRequest().setAttribute("contest", project);
    }
    
     /**
     * <p>Gets the submission type based on the contest phase (Milestone or Contest submission).</p>
     * 
     * @param project the contest to search for submission type
     * @return the submission type for current contest phase
     */
    protected Integer getSubmissionTypeId(Project project) {
        Integer submissionTypeId = Submission.CONTEST_SUBMISSION;
        // Check if there is milestone for contest and if still open
        Date mileStoneDate = project.getMilestoneDate();
        if (mileStoneDate != null) {
            if (new Date().before(mileStoneDate)) {
                log.debug("Get submission of type Milestone.");
                submissionTypeId = Submission.MILESTONE_SUBMISSION;
            }
        }
        
        return submissionTypeId;
    }

    /**
     * <p>Create the system file name from unified submission file found in <code>Upload</p> instance.</p>
     *  
     * @param s the submission
     * @param remoteFileName remote file name
     * @return the created system file name
     */
    protected String createSystemFileName(Submission s, String remoteFileName) {
        String ext = remoteFileName.substring(remoteFileName.lastIndexOf('.'));
        return s.getModifyDate().getTime() + ext;
    }


     /**
     * <p>get the system file name from submission.upload</p>
     *  
     * @param s the submission
     * @return the created system file name
     */
    protected String getSystemFileName(Submission s) {

        return s.getUpload().getParameter();
    }
}


