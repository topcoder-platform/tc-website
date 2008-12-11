package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Equals;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;

import java.util.Date;

/**
 * @author dok
 * @version $Revision: 60454 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 31, 2006
 */
public class ViewSubmissions extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        }
        Contest c = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
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

        //load up the submissions
        DataAccess da = new CachedDataAccess(DBMS.CSF_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("submissions");
        r.setProperty(Constants.CONTEST_ID, contestId);

        if (c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null) {
            r.setProperty(Constants.SUBMISSION_RANK, c.getMaxSubmissions().getValue());
        }

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

        String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        if (start.equals("")) {
            start = "0";
        }

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals("")) {
            end = String.valueOf(Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
        }

        if (log.isDebugEnabled()) {
            log.debug("start: " + start + " end: " + end);
        }
        if (Integer.parseInt(end) - Integer.parseInt(start) > (Constants.VIEW_SUBMISSIONS_SCROLL_SIZE)) {
            end = String.valueOf(Integer.parseInt(start) + Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
        }
        if (log.isDebugEnabled()) {
            log.debug("start: " + start + " end: " + end);
        }

        getRequest().setAttribute("submissions", submissions.subList(Integer.parseInt(start), Integer.parseInt(end)));

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/submissions.jsp");
        setIsNextPageInContext(true);


    }
}
