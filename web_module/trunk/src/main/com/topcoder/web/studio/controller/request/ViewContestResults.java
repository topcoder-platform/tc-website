package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.util.Util;

import java.util.Date;
import java.util.Set;

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
 * @author dok, pulky, isv
 * @version 1.4.1
 */
public class ViewContestResults extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Long cid;
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified");
            }
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(cid);
            getRequest().setAttribute("hasScores", contest.getProject() != null);

            if (Util.isAdmin(getUser().getId())) {
                getRequest().setAttribute("contest", contest);
                loadData(cid);
            } else {
                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getEndTime().before(now)) {
                        Set<ContestResult> results = contest.getResults();
                        if (results != null && !results.isEmpty()) {
                            getRequest().setAttribute("contest", contest);
                            loadData(cid);
                        } else {
                            throw new NavigationException("No contest results available.");
                        }
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }

            Long submissionId = 0l;
            try {
                submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
            } catch (NumberFormatException e) {
                // if the submission id is invalid, just ignore it.
            }

            // added for BUGR-2096 - Fix the Winners Page on Studio when "show submissions" flag is set to "no"
            if (!String.valueOf(true).equals(contest.getViewableSubmissions().getValue())) {
                // BUGR-2434: avoid throwing for the full results page and set a flag in the request instead
                if (submissionId > 0) {
                    // the full size preview will still throw exception since this url is not accessible via 
                    // the application. Users should fake the url to get here.
                    throw new NavigationException("Submissions are not available for this contest");   
                }

                getRequest().setAttribute("viewableSubmissions", Boolean.FALSE);
            } else {
                getRequest().setAttribute("viewableSubmissions", Boolean.TRUE);                
            }

            // added after BUGR-1915: process all submissions information to show on the page
            processSubmissionsSection(contest);

            if (submissionId > 0) {
                getRequest().setAttribute(Constants.SUBMISSION_ID, submissionId);
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
    private void processSubmissionsSection(Contest c) throws Exception {
        boolean isOver = new Date().after(c.getEndTime());
        
        // in this case, no submission will be shown
        if (!isOver || !String.valueOf(true).equals(c.getViewableSubmissions().getValue())) {
            return;
        }

        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("submissions");
        r.setProperty(Constants.CONTEST_ID, String.valueOf(c.getId()));

        if (c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null) {
            r.setProperty(Constants.SUBMISSION_RANK, c.getMaxSubmissions().getValue());
        }

        getRequest().setAttribute("hasScores", c.getProject() != null);

        ResultSetContainer submissions = (ResultSetContainer) da.getData(r).get("submissions");

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

    private void loadData(Long cid) throws Exception {
        DataAccess da = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("contest_results");
        r.setProperty(Constants.CONTEST_ID, cid.toString());
        getRequest().setAttribute("results", da.getData(r).get("contest_results"));
    }

}
