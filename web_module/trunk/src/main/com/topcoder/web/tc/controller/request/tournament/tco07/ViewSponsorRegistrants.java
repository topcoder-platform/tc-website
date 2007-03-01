package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ViewSponsorRegistrants extends ViewRegistrantsBase {
    protected final String getEventShortDesc() {
        return getEvent().getShortDescription();
    }

    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_lower"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

    protected void setNextPage(Event e) {
        setNextPage("/tournaments/tco07/algorithm/sponsorRegistrants.jsp");
        setIsNextPageInContext(true);
    }
}
