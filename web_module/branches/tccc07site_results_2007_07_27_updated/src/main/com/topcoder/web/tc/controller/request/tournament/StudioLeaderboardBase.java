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
public abstract class StudioLeaderboardBase extends StatBase {
    
    protected abstract String getContestPrefix();
    
    protected String getCommandName() {
        return getContestPrefix() + "_event_results";
    }

    protected String getDataSourceName() {
        return DBMS.STUDIO_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/studio/leaderboard.jsp";
    }

    protected void statProcessing() throws com.topcoder.web.common.TCWebException {
        Map result = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result.get(getContestPrefix() + "_event_results");

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle"), "asc");
        s.addDefault(rsc.getColumnIndex("completed_contests"), "desc");
        s.addDefault(rsc.getColumnIndex("points"), "desc");
        s.addDefault(rsc.getColumnIndex("current_contests"), "desc");
        s.addDefault(rsc.getColumnIndex("potential_points"), "desc");
        s.addDefault(rsc.getColumnIndex("total_potential_points"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
