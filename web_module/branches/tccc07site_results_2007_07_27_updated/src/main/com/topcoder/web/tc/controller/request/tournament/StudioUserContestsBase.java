package com.topcoder.web.tc.controller.request.tournament;

import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.development.StatBase;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class StudioUserContestsBase extends StatBase {
    
    protected abstract String getContestPrefix();
    
    protected String getCommandName() {
        return getContestPrefix() + "_user_event_contests";
    }

    protected String getDataSourceName() {
        return DBMS.STUDIO_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/studio/completedContests.jsp";
    }

    protected void statProcessing() throws com.topcoder.web.common.TCWebException {
        Map result = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result.get(getContestPrefix() + "_user_event_contests");

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("contest_name"), "asc");
        s.addDefault(rsc.getColumnIndex("start_time"), "desc");
        s.addDefault(rsc.getColumnIndex("end_time"), "desc");
        s.addDefault(rsc.getColumnIndex("registrants"), "desc");
        s.addDefault(rsc.getColumnIndex("submissions"), "desc");
        s.addDefault(rsc.getColumnIndex("place"), "asc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
