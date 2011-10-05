/*
 * Copyright (C) 2004-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.util.Util;

/**
 * <p>This class implements the request processor for the contest results (winners) page.</p>
 *
 * <p>
 *   Version 1.1 (BUGR-1755/1756) Change notes:
 *   <ol>
 *     <li>Added submission id parameter to redirect to full preview page.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (BUGR-1915) Change notes:
 *   <ol>
 *     <li>Added code to retrieve all submissions (not only the winners).</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (BUGR-2096) Change notes:
 *   <ol>
 *     <li>Navigation exception is returned if submissions are not viewable.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (BUGR-2434) Change notes:
 *   <ol>
 *     <li>Change result page for the case when submissions are not viewable.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4.1 (Studio Contest Detail Pages assembly) Change notes:
 *   <ol>
 *     <li>Added validation logic for contests with no results available.</li>
 *   </ol>
 * </p>
 *
 * <p> Version 1.5 (Studio Declaration Module Assembly) change:
 * Current submission object is now retrieved, to get submission declaration data.
 * </p>
 *
 * <p>
 *   Version 1.6 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.7 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, isv, Orange_Cloud, pvmagacho, TCSASSEMBER
 * @version 1.7
 */
public class ViewContestResults extends ShortHibernateProcessor {
    /**
     * <p>
     * Implements the business logic for request processing.
     * </p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Integer cid;
            try {
                cid = new Integer(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified");
            }
            Project contest = DAOUtil.getFactory().getProjectDAO().find(cid);

            if (contest == null)
            {
                throw new NavigationException("Invalid contest specified");
            }
            getRequest().setAttribute("hasScores", true);

            if (Util.isAdmin(getUser().getId())) {
                getRequest().setAttribute("contest", contest);
                loadData(cid);
            } else {
                if (contest.getReviewClosed()) {
                    getRequest().setAttribute("contest", contest);
                    loadData(cid);
                 } else {
                    throw new NavigationException("No contest results available.");
                }
            }

            Integer submissionId = 0;
            try {
                submissionId = new Integer(getRequest().getParameter(Constants.SUBMISSION_ID));
            } catch (NumberFormatException e) {
                // if the submission id is invalid, just ignore it.
            }

            // added after BUGR-1915: process all submissions information to show on the page
            processSubmissionsSection(contest);

            if (submissionId > 0) {
                getRequest().setAttribute(Constants.SUBMISSION_ID, submissionId);

                // fetch submission and submission declaration data
                SubmissionDAO submissionDAO = DAOUtil.getFactory().getSubmissionDAO();
                Submission submission = submissionDAO.find(submissionId);
                submission.setViewCount(submission.getViewCount() + 1);
                submissionDAO.saveOrUpdate(submission);
                getRequest().setAttribute("submission", submission);

                setNextPage("/fullSizeSubmission.jsp");
            } else {
                setNextPage("/results.jsp");
            }
            setIsNextPageInContext(true);
        }

    }

    /**
     * Method to retrieve all submissions.
     * 
     * @param c the contest being requested.
     * @throws Exception if any error occurs.
     */
    private void processSubmissionsSection(Project c) throws Exception {
        boolean isOver = new Date().after(c.getEndTime());
        
        // in this case, no submission will be shown
        if (!isOver || !c.getViewableSubmissions()) {
            return;
        }

        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_submissions");
        r.setProperty(Constants.CONTEST_ID, String.valueOf(c.getId()));

        if (c.getMaxSubmissions() != null) {
            r.setProperty(Constants.SUBMISSION_RANK, c.getMaxSubmissions().toString());
        }

        ResultSetContainer submissions = (ResultSetContainer) da.getData(r).get("studio_submissions");
        
        // get pagination parameters from request
        String pageNumber = StringUtils.checkNull(getRequest().getParameter(Constants.PAGE_NUMBER_KEY));
        if (pageNumber.equals("")) {
            pageNumber = "1";
        }

        String pageSize = StringUtils.checkNull(getRequest().getParameter(Constants.PAGE_SIZE_KEY));
        if (pageSize.equals("")) {
            pageSize = String.valueOf(Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
        }

        // we don't care if they are invalid. In that case, just use defaults.
        Integer pageNumberInt;        
        try {
            pageNumberInt = Integer.parseInt(pageNumber);
        } catch (NumberFormatException e) {
            pageNumberInt = 1;
        }
        
        Integer pageSizeInt;        
        try {
            pageSizeInt = Integer.parseInt(pageSize);
        } catch (NumberFormatException e) {
            pageSizeInt = Constants.VIEW_SUBMISSIONS_SCROLL_SIZE;
        }

        // calculate start and end rank using pagination information
        Integer start = (pageNumberInt - 1) * pageSizeInt;

        // for invalid start, make it the first element
        if (start >= submissions.size() || start < 0) {
            start = 0;
        }

        Integer end;
        if (pageSize.equals(ViewSubmissions.PAGE_SIZE_ALL)) {
            end = submissions.size();
        } else {
            end = start + pageSizeInt;
        }

        // for invalid end, make it the last element
        if (end >= submissions.size()) {
            end = submissions.size();
        }

        getRequest().setAttribute(Constants.PAGE_NUMBER_KEY, pageNumberInt);
        getRequest().setAttribute(Constants.PAGE_SIZE_KEY, pageSizeInt);
        getRequest().setAttribute("totalItems", submissions.size());
        getRequest().setAttribute("submissions", submissions.subList(start, end));
    }

    /**
     * <p>Load contest result data. This is only possible if user is administrator or review phase has ended.</p>
     * 
     * @param cid the project id
     * @throws Exception if any error occurs during persistence access
     */
    private void loadData(Integer cid) throws Exception {
        DataAccess da = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_contest_results");
        r.setProperty(Constants.CONTEST_ID, cid.toString());
        
        ResultSetContainer results = (ResultSetContainer) da.getData(r).get("studio_contest_results");        
        getRequest().setAttribute("results", results);
    }

}
