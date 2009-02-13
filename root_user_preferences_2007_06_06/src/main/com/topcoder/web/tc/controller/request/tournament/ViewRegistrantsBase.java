package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class ViewRegistrantsBase extends ShortHibernateProcessor {

    protected String getEventShortDesc() {
        return getEvent().getShortDescription();
    }

    protected abstract void setSortInfo(ResultSetContainer rsc);

    protected void dbProcessing() throws Exception {
        Event e = getEvent();
        getRequest().setAttribute("event", e);
        Request r = new Request();
        r.setContentHandle(getEventShortDesc() + "_registrants");
        r.setProperty(Constants.EVENT_ID, String.valueOf(e.getId().intValue()));

        //this gets refreshed when people sign up.
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) m.get(getEventShortDesc() + "_registrants");

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            rsc.sortByColumn(Integer.parseInt(sortCol), sortDir.equals("asc"));
        }

        setSortInfo(rsc);

        getRequest().setAttribute("list", rsc);

        setNextPage(e);
    }

    public Event getEvent() {
        String eventId = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID));
        if ("".equals(eventId)) {
            log.warn("event id missing, attempting to use short description");
            return DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
        } else {
            return DAOUtil.getFactory().getEventDAO().find(new Long(eventId));
        }
    }

    protected void setNextPage(Event e) {
        setNextPage("/tournaments/" + e.getShortDescription() + "/registrants.jsp");
        setIsNextPageInContext(true);
    }

    protected DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }
}
