package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class ViewSubmissions extends Base {

    protected void dbProcessing() throws Exception {
        Long contestId;
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE)).trim().toLowerCase();
        Integer status = null;
        boolean unMarkedOnly;

        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }

        try {
            unMarkedOnly = "null".equals(getRequest().getParameter(Constants.REVIEW_STATUS_ID));
            if (!unMarkedOnly &&
                    !"".equals(StringUtils.checkNull(getRequest().getParameter(Constants.REVIEW_STATUS_ID)))) {
                status = new Integer(getRequest().getParameter(Constants.REVIEW_STATUS_ID));
            }
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Review Status Specified");
        }

        QueryRequest r = new QueryRequest();
        DataAccessInt dai = new QueryDataAccess(DBMS.CSF_DATASOURCE_NAME);


        StringBuffer query = new StringBuffer(300);
        StringBuffer countQuery = new StringBuffer(300);
        StringBuffer from = new StringBuffer(200);
        countQuery.append(" select count(*) ");

        if (unMarkedOnly) {
            query.append(" select u.handle as submitter_handle ");
            query.append(" , s.submitter_id ");
            query.append(" , s.original_file_name ");
            query.append(" , s.submission_date as submit_date ");
            query.append(" , s.submission_id ");
            query.append(" , s.rank as submitter_rank");

            from.append(" from submission s ");
            from.append(" , user u ");
            from.append(" where s.submitter_id = u.user_id ");
            if (!"".equals(handle)) {
                from.append(" and u.handle_lower = '").append(handle).append("'");
            }
            from.append("  and s.contest_id = ").append(contestId);
            from.append(" and not exists (select '1'  ");
            from.append(" from submission_review ");
            from.append(" where submission_id = s.submission_id)");

        } else {
            query.append("select u.handle as submitter_handle");
            query.append(" , s.submitter_id");
            query.append(" , s.original_file_name");
            query.append(" , s.submission_date as submit_date");
            query.append(" , sr.modify_date as review_date");
            query.append(" , u1.handle as reviewer_handle");
            query.append(" , sr.reviewer_id");
            query.append(" , rs.review_status_desc");
            query.append(" , s.rank as submitter_rank");
            query.append(" , s.submission_id");

            from.append(" from submission s");
            from.append(" , user u");
            if (status == null) {
                from.append(" , outer (submission_review sr, user u1, review_status_lu rs)");
            } else {
                from.append(" , submission_review sr");
                from.append(" , user u1");
                from.append(" , review_status_lu rs");
            }
            from.append(" where u.user_id = s.submitter_id");
            from.append("  and sr.submission_id = s.submission_id");
            from.append("  and sr.reviewer_id = u1.user_id");
            from.append("  and sr.review_status_id = rs.review_status_id");
            from.append("  and s.contest_id = ").append(contestId);
            if (!"".equals(handle)) {
                from.append(" and u.handle_lower = '").append(handle).append("'");
            }
            if (status != null) {
                from.append(" and sr.review_status_id = ").append(status);
            }
        }
        query.append(from);
        countQuery.append(from);

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            query.append(" order by ").append(col).append(" ").append(dir);
        } else {
            query.append(" order by s.create_date desc");
        }

        r.addQuery("submissions", query.toString());
        r.addQuery("count", countQuery.toString());

        String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        if (start.equals(""))
            start = "1";
        r.setProperty("submissions" + DataAccessConstants.START_RANK, start);

        String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
        if (end.equals(""))
            end = String.valueOf(Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE);

        if (Integer.parseInt(end) - Integer.parseInt(start) > (Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE - 1)) {
            r.setProperty("submissions" + DataAccessConstants.END_RANK,
                    String.valueOf(Integer.parseInt(start) + Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE - 1));
        } else {
            r.setProperty("submissions" + DataAccessConstants.END_RANK, end);
        }

        getRequest().setAttribute("submissions", dai.getData(r).get("submissions"));
        getRequest().setAttribute("count", ((ResultSetContainer) dai.getData(r).get("count")).getItem(0, 0));


        SortInfo info = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, info);

        getRequest().setAttribute("contest", CSFDAOUtil.getFactory().getContestDAO().find(contestId));
        getRequest().setAttribute("reviewStatuses", CSFDAOUtil.getFactory().getReviewStatusDAO().getReviewStatuses());
        setDefault(Constants.CONTEST_ID, contestId.toString());
        if (!"".equals(handle)) {
            setDefault(Constants.HANDLE, handle);
        }
        getRequest().setAttribute("unMarkedOnly", Boolean.valueOf(unMarkedOnly));

        setNextPage("/admin/submissions.jsp");
        setIsNextPageInContext(true);

    }
}
