package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class ViewSubmissions extends HibernateProcessor {

    //allow for filters
    //allow for paging
    //allow for sorting

    protected void dbProcessing() throws Exception {
        Long contestId;
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE)).trim().toLowerCase();
        Integer status = null;

        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }

        try {
            status = new Integer(getRequest().getParameter(Constants.REVIEW_STATUS_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Review Status Specified");
        }

        QueryRequest r = new QueryRequest();
        DataAccessInt dai = new QueryDataAccess(DBMS.CREATIVE_DATASOURCE_NAME);


        StringBuffer query = new StringBuffer();
        query.append("select u.handle as submitter_handle");
        query.append(" , s.submitter_id");
        query.append(" , s.original_file_name");
        query.append(" , s.create_date as submit_date");
        query.append(" , sr.modify_date as review_date");
        query.append(" , u1.handle as reviewer_handle");
        query.append(" , sr.reviewer_id");
        query.append(" , rs.review_status_desc");
        query.append("from submission s");
        query.append(" , user u");
        query.append(" , outer (submission_review sr, user u1, review_status_lu rs)");
        query.append(" where u.user_id = s.submitter_id");
        query.append("  and sr.submission_id = s.submission_id");
        query.append("  and sr.reviewer_id = u1.user_id");
        query.append("  and sr.review_status_id = rs.review_status_id");
        query.append("  and s.contest_id = ").append(contestId);
        if (!"".equals(handle)) {
            query.append(" and u.handle_lower = ").append(handle);
        }
        if (status != null) {
            query.append(" and sr.review_status_id = ").append(status);
        }

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            query.append(" order by ").append(col).append(" ").append(dir);
        } else {
            query.append(" order by s.create_date desc");
        }

        r.addQuery("submissions", query.toString());

        getRequest().setAttribute("submissions", dai.getData(r).get("submissions"));

        SortInfo info = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, info);

        getRequest().setAttribute("contest", CreativeDAOUtil.getFactory().getContestDAO().find(contestId));

        setNextPage("/viewSubmissions.jsp");
        setIsNextPageInContext(true);

    }
}
