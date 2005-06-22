package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 25, 2005
 */
public class RecentPlacements extends Base {

    public void businessProcessing() throws Exception {
        Request r = new Request();

        ResultSetContainer ret = null;

        r.setContentHandle("recent_placement_full");
        ret = (ResultSetContainer)getDataAccess(true).getData(r).get("recent_placement_full");

        getRequest().setAttribute("list", ret);
        setNextPage("/contracting/placed.jsp");
        setIsNextPageInContext(true);


    }
}
