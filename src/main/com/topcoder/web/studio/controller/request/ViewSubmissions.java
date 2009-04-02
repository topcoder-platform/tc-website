/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

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
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

import java.util.Date;

/**
 * <p>This class implements the request processor for the View Submissions page.</p>
 *
 * <p>
 *   Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
 *   <ol>
 *     <li>Changed usage of start and end ranks parameters to pagination-like parameters.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, TCSDEVELOPER
 * @version 1.1
 */
public class ViewSubmissions extends ShortHibernateProcessor {

    /**
     * <p>This method is the responsible for performing page's logic.</p> 
     * 
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     * @throws Exception if any error occurs
     */
    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        }
        Contest c = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
        if (c == null) {
            throw new NavigationException("Invalid contest specified.");
        }
        getRequest().setAttribute("contest", c);
        setDefault(Constants.CONTEST_ID, c.getId());

        boolean isOver = new Date().after(c.getEndTime());
        if (!isOver) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        }

        if (!String.valueOf(true).equals(c.getViewableSubmissions().getValue())) {
            throw new NavigationException("Submissions are not available for this contest");
        }

        getRequest().setAttribute("isOver", String.valueOf(isOver));

        //not caching anymore, it doesn't gain much.  perhaps we can in the future if we figure out exactly how the admins
        //use the system so we know when to refresh the cache
        //DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        //load up the submissions
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("submissions");
        r.setProperty(Constants.CONTEST_ID, contestId);

        if (c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null) {
            r.setProperty(Constants.SUBMISSION_RANK, c.getMaxSubmissions().getValue());
        }

        getRequest().setAttribute("hasScores", c.getProject() != null);

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        ResultSetContainer submissions = (ResultSetContainer) da.getData(r).get("submissions");

        //only accept this criteria if the contest is over
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        if (!"".equals(handle) && isOver) {
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

        // calculate start and end rank using pagination information
        Integer start = (Integer.parseInt(pageNumber) - 1) * Integer.parseInt(pageSize);
        
        // for invalid start point, make it the first element
        if (start >= submissions.size()) {
            start = 0;
        }

        Integer end = start + Integer.parseInt(pageSize);

        // for invalid end point, make it the last element
        if (end >= submissions.size()) {
            end = submissions.size();
        }

        if (log.isDebugEnabled()) {
            log.debug("start: " + start + " end: " + end);
        }
        getRequest().setAttribute(Constants.PAGE_NUMBER_KEY, pageNumber);
        getRequest().setAttribute(Constants.PAGE_SIZE_KEY, pageSize);
        getRequest().setAttribute("totalItems", submissions.size());

        getRequest().setAttribute("submissions", submissions.subList(start, end));

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/submissions.jsp");
        setIsNextPageInContext(true);
    }
}