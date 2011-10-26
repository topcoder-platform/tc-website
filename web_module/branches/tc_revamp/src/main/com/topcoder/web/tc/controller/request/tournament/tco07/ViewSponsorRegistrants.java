package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;

/**
 * @author dok
 * @version $Revision: 58248 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ViewSponsorRegistrants extends ViewRegistrantsBase {
    protected final String getEventShortDesc() {
        //this is just used to figure out what command to run.  it's the same as algo, just a different event id,
        //so we can reuse the algo query.
        return "tco07algorithm";
    }

    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_lower"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

    protected void setNextPage(Event e) {
        setNextPage("/tournaments/tco07/sponsortrack/registrants.jsp");
        setIsNextPageInContext(true);
    }
}
