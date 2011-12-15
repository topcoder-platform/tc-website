/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Equals;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Submission;

/**
 * <p>This class implements the request processor for the View Submissions page.</p>
 *
 * <p>
 *   Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
 *   <ol>
 *     <li>Changed usage of start and end rank parameters to pagination-like parameters.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (BUGR-1755/1756) Change notes:
 *   <ol>
 *     <li>Added submission id parameter to redirect to full preview page.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (BUGR-1915) Change notes:
 *   <ol>
 *     <li><code>PAGE_SIZE_ALL</code> was made public so that it could be used from other processors.</li>
 *   </ol>
 * </p>
 *
 * <p> Version 1.4 (Studio Declaration Module Assembly) change:
 * Current submission object is now retrieved, to get submission declaration data.
 * </p>
 *
 * <p>
 *   Version 1.5 (Re-platforming Studio Release 3 Assembly) Change notes:
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
 * @author dok, isv, pulky, Orange_Cloud, pvmagacho, TCSASSEMBER
 * @version 1.6
 */
public class ViewSubmissions extends ShortHibernateProcessor {
    /**
     * <p>A <code>String</code> providing the page size representation for "all".
     *
     * @since 1.1
     */
    public static final String PAGE_SIZE_ALL = "0";

    /**
     * <p>This method is the responsible for performing page's logic.</p>
     *
     * @throws Exception if any error in the underlying layer
     * @throws NavigationException if any validation error occurs or if submissions are not available.
     *
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        }
        Project c = DAOUtil.getFactory().getProjectDAO().find(new Integer(contestId));
        if (c == null) {
            throw new NavigationException("Invalid contest specified.");
        }
        getRequest().setAttribute("contest", c);
        setDefault(Constants.CONTEST_ID, c.getId());

        boolean isOver = c.getSubmissionClosed();
        if (!isOver) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        }

        if (!c.getViewableSubmissions()) {
            throw new NavigationException("Submissions are not available for this contest");
        }

        getRequest().setAttribute("isOver", String.valueOf(isOver));

        //not caching anymore, it doesn't gain much.  perhaps we can in the future if we figure out exactly how the
        //admins use the system so we know when to refresh the cache
        //DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        //load up the submissions
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_submissions");
        r.setProperty(Constants.CONTEST_ID, contestId);

        getRequest().setAttribute("hasScores", c != null);

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        ResultSetContainer submissions = (ResultSetContainer) da.getData(r).get("studio_submissions");

        //only accept this criteria if the contest is over
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        if (!"".equals(handle)) {
            submissions = new ResultSetContainer(submissions, new Equals(handle.toLowerCase(), "handle_lower"));
            setDefault(Constants.HANDLE, handle);
        }

        if (!"".equals(col) && !"".equals(dir)) {
            submissions.sortByColumn(Integer.parseInt(col), dir.trim().toLowerCase().equals("asc"));
        }

        // get pagination parameters from request
        String pageNumber = StringUtils.checkNull(getRequest().getParameter(Constants.PAGE_NUMBER_KEY));
        if (pageNumber.equals("")) {
            pageNumber = "1";
        }

        String pageSize = StringUtils.checkNull(getRequest().getParameter(Constants.PAGE_SIZE_KEY));
        if (pageSize.equals("")) {
            pageSize = String.valueOf(Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
        }

        if (log.isDebugEnabled()) {
            log.debug("[ViewSubmissions] pageNumber: " + pageNumber + " pageSize: " + pageSize);
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

        if (log.isDebugEnabled()) {
            log.debug("[ViewSubmissions] pageNumbesubmissionsrInt: " + pageNumberInt + " pageSizeInt: " + pageSizeInt);
        }

        // calculate start and end rank using pagination information
        Integer start = (pageNumberInt - 1) * pageSizeInt;

        // for invalid start, make it the first element
        if (start >= submissions.size() || start < 0) {
            start = 0;
        }

        Integer end;
        if (pageSize.equals(PAGE_SIZE_ALL)) {
            end = submissions.size();
        } else {
            end = start + pageSizeInt;
        }

        // for invalid end, make it the last element
        if (end >= submissions.size()) {
            end = submissions.size();
        }

        if (log.isDebugEnabled()) {
            log.debug("start: " + start + " end: " + end);
        }
        getRequest().setAttribute(Constants.PAGE_NUMBER_KEY, pageNumberInt);
        getRequest().setAttribute(Constants.PAGE_SIZE_KEY, pageSizeInt);
        getRequest().setAttribute("totalItems", submissions.size());

        getRequest().setAttribute("submissions", submissions.subList(start, end));

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        Long submissionId = 0l;
        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            // if the submission id is invalid, just ignore it.
        }

        if (submissionId > 0) {
            getRequest().setAttribute(Constants.SUBMISSION_ID, submissionId);

            // fetch submission and submission declaration data
            SubmissionDAO submissionDAO = DAOUtil.getFactory().getSubmissionDAO();
            Submission submission = submissionDAO.find(submissionId.intValue());
            submission.setViewCount(submission.getViewCount() + 1);
            submissionDAO.saveOrUpdate(submission);
            getRequest().setAttribute("submission", submission);

            setNextPage("/fullSizeSubmission.jsp");
        } else {
            setNextPage("/submissions.jsp");
        }
        setIsNextPageInContext(true);
    }
}