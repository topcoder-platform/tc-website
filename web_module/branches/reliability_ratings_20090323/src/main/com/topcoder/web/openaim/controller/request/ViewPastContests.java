package com.topcoder.web.openaim.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 7, 2006
 */
public class ViewPastContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        //load up the contests
        DataAccess da = new DataAccess(DBMS.OPENAIM_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("past_contests");

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "past_contests");
        }

        ResultSetContainer rsc = da.getData(r).get("past_contests");
        getRequest().setAttribute("contests", rsc);

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("name"), "asc");
        s.addDefault(rsc.getColumnIndex("start_time"), "desc");
        s.addDefault(rsc.getColumnIndex("end_time"), "desc");
        s.addDefault(rsc.getColumnIndex("amount"), "desc");
        s.addDefault(rsc.getColumnIndex("registrants"), "desc");
        s.addDefault(rsc.getColumnIndex("submission_count"), "desc");
        s.addDefault(rsc.getColumnIndex("passing_submission_count"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/pastContests.jsp");
        setIsNextPageInContext(true);
    }
}
