package com.topcoder.web.truveo.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.truveo.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class ViewContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        //load up the contests
        DataAccess da = new DataAccess(DBMS.TRUVEO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("admin_contest_list");

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "admin_contest_list");
        }

        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
        getRequest().setAttribute("contests", da.getData(r).get("admin_contest_list"));

        SortInfo s = new SortInfo();
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/admin/contests.jsp");
        setIsNextPageInContext(true);
    }
}
