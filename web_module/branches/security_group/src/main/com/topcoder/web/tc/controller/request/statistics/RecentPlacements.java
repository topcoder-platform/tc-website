package com.topcoder.web.tc.controller.request.statistics;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

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
        ret = (ResultSetContainer)getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r).get("recent_placement_full");

        getRequest().setAttribute("list", ret);
        setNextPage("/contracting/placed.jsp");
        setIsNextPageInContext(true);


    }
}
