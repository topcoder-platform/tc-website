package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.tournament.RegistrationBase;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;
/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistrants extends ViewRegistrantsBase {
    protected final String getEventShortDesc() {
        return "tco07" + getRequest().getParameter("ct");
    }

    protected void dbProcessing() throws Exception {
        if (!RegistrationBase.TCO_COMPETITION_TYPES.contains(StringUtils.checkNull(getRequest().getParameter("ct")))) {
            throw new TCWebException("invalid ct parameter.");
        }
        super.dbProcessing();
    }
    
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_lower"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("dev_rating"), "desc");
        s.addDefault(rsc.getColumnIndex("des_rating"), "desc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
    
    protected void setNextPage(Event e) {
        getRequest().setAttribute("ct", getRequest().getParameter("ct"));
        setNextPage("/tournaments/tco07/" + getRequest().getParameter("ct") + "/registrants.jsp");
        setIsNextPageInContext(true);
    }
}
