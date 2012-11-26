/*
 * Copyright (C) 2001-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.TreeSet;

import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.Upload;

/**
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
public class BatchUpdateRank extends BaseSubmissionDataProcessor {
    protected void dbProcessing() throws Exception {

        Long contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));

        Integer submissionTypeId = new Integer(getRequest().getParameter(Constants.SUBMISSION_TYPE_ID));

        SubmissionDAO submissionDAO = DAOUtil.getFactory().getSubmissionDAO();
        UploadDAO uploadDAO = DAOUtil.getFactory().getUploadDAO();
        String paramName;
        String newRank;
        Integer newRankInt;
        Submission currSubmission = null;
        Date now = new Date();

        Project project = DAOUtil.getFactory().getProjectDAO().find(contestId.intValue());
        Resource resource = RegistrationHelper.getSubmitterResource(project, getUser().getId());
        List<Upload> uploads = uploadDAO.getUploads(project, resource, Upload.SUBMISSION, Upload.STATUS_ACTIVE);
        List<Submission> userSubmissions = submissionDAO.getSubmissions(uploads, submissionTypeId, Submission.STATUS_ACTIVE);
        
        Integer maxRank = null;
        // BUGR-429 Change: replace two ArrayLists by one TreeSet
        TreeSet<ComparableRank> changedSubmissions = new TreeSet<ComparableRank>();
        for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
            paramName = (String) paramNames.nextElement();
            if (paramName.startsWith(Constants.SUBMISSION_ID)) {
                newRank = getRequest().getParameter(paramName);
                ValidationResult r = new IntegerValidator("Please enter a valid number.").validate(new StringInput(newRank));
                if (!r.isValid()) {
                    addError(paramName, r.getMessage());
                } else {
                    currSubmission = findSubmission(userSubmissions,
                            new Long(paramName.substring(Constants.SUBMISSION_ID.length())));
                    if (now.before(currSubmission.getContest().getStartTime()) || now.after(currSubmission.getContest().getEndTime()) ||
                            !Project.STATUS_ACTIVE.equals(currSubmission.getContest().getStatusId())) {
                        addError(paramName, "Sorry, you can not make a change to a submission for a contest that is not active.");
                    } else {
                        if (maxRank == null) {
                            maxRank = submissionDAO.getMaxRank(uploads);
                        }
                        newRankInt = new Integer(newRank);
                        if (newRankInt < 1) {
                            newRankInt = 1;
                        } else if (newRankInt > maxRank) {
                            newRankInt = maxRank;
                        }

                        // BUGR-429 Change: unconditional accumulate ComparableRank objects instead conditional newRank and submissions accumulation
                        changedSubmissions.add(new ComparableRank(newRankInt, currSubmission));
                    }
                }
            }
        }

        // BUGR-429: this todo is implemeted
//todo make it smarter, since the transaction isn't yet commited, it seems to be confused since we're updated the same rows
        //todo multiple times.  perhaps we have to do it all here in the processor instead or something.
        Submission s = (Submission) userSubmissions.get(0);
        if (!hasErrors()) {

            // BUGR-429 Change: remove altering rank by dao.changeRank(), the right order of submissions is supported by TreeSet
            int i = 0;
            for (ComparableRank comparableRank : changedSubmissions) {
                Submission submission = comparableRank.getSubmission();
                if (++i != submission.getRank()) {
                    submission.setRank(i);
                    submissionDAO.saveOrUpdate(submission);
                }
            }

            closeConversation();

            beginCommunication();

            HibernateUtils.getSession().refresh(s);
            submissionDAO = DAOUtil.getFactory().getSubmissionDAO();
        }

        // loadSubmissionData(s.getSubmitter(), s.getContest(), dao, maxRank, s.getType().getId());

        if (hasErrors()) {
            //override so that the user gets their data back to them
            for (Enumeration paramNames = getRequest().getParameterNames(); paramNames.hasMoreElements();) {
                paramName = (String) paramNames.nextElement();
                setDefault(paramName, getRequest().getParameter(paramName));
            }
        }

        setIsNextPageInContext(true);
        setNextPage("submitTableBody.jsp");


    }


    private Submission findSubmission(List submissions, Long id) {
        Submission curr = null;
        for (Object submission : submissions) {
            curr = (Submission) submission;
            if (curr.getId().equals(id)) {
                return curr;
            }
        }
        return null;
    }

    /**
     * BUGR-429
     * This class implements value object for support certain order of submissions in the
     * TreeSet. This order number is used as rank of submissions. The order is defined by
     * <ul>
     * <li>new rank</li>
     * <li>offset, which is length between new rank and submission rank</li>
     * <li>and submission Id if previous criteria are unexpectedly same</li>
     * </ul>
     * @author goorov
     */
    private static final class ComparableRank implements Comparable {
        private final Integer newRank;
        private final Submission submission;
        private final Integer offset;

        public ComparableRank(Integer newRank, Submission submission) {
            this.newRank = newRank;
            this.submission = submission;
            offset = newRank - submission.getRank();
        }

        public Submission getSubmission() { return submission; }

        public int compareTo(Object o) {
            if (o instanceof ComparableRank) {
                ComparableRank u = (ComparableRank) o;
                int result = newRank.compareTo(u.newRank);
                if (result == 0) {
                    result = offset.compareTo(u.offset);
                    if (result == 0) {
                        result = submission.getId().compareTo(u.submission.getId());
                    }
                }
                return result;
            } else {
                log.error("BatchUpdateRank.ComparableRank has been improperly comparing.");
                return 0;
            }
        }
    }

}
