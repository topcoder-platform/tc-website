package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 15, 2007
 */
public class StudioUserContests extends Static {
    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("user_event_contests");
        r.setProperty(Constants.EVENT_ID, getRequest().getParameter(Constants.EVENT_ID));
        r.setProperty(Constants.USER_ID, getRequest().getParameter(Constants.USER_ID));
        ResultSetContainer rsc = (ResultSetContainer)
                new DataAccess(DBMS.STUDIO_DATASOURCE_NAME).getData(r).get("user_event_contests");

        String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
        String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
        if (sortCol != null && sortDir != null && rsc != null) {
            rsc.sortByColumn(Integer.parseInt(sortCol), sortDir.trim().toLowerCase().equals("asc"));
        }

        getRequest().setAttribute("results", rsc);

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("contest_name"), "asc");
        s.addDefault(rsc.getColumnIndex("start_time"), "desc");
        s.addDefault(rsc.getColumnIndex("end_time"), "desc");
        s.addDefault(rsc.getColumnIndex("registrants"), "desc");
        s.addDefault(rsc.getColumnIndex("submissions"), "desc");
        s.addDefault(rsc.getColumnIndex("place"), "asc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);


        super.businessProcessing();


    }
}
