package com.topcoder.web.csf.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.DBMS;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 7, 2006
 */
public class ViewPastContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        //load up the contests
        DataAccess da = new DataAccess(DBMS.CSF_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("past_contests");

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "past_contests");
        }

        getRequest().setAttribute("contests", da.getData(r).get("past_contests"));

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/pastContests.jsp");
        setIsNextPageInContext(true);
    }
}
