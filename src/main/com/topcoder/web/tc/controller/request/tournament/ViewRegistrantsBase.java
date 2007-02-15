package com.topcoder.web.tc.controller.request.tournament;

import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class ViewRegistrantsBase extends ShortHibernateProcessor {

    protected abstract String getEventShortDesc();

    protected abstract void setSortInfo(ResultSetContainer rsc);

    protected void dbProcessing() throws Exception {
        Event e = getEvent();
        getRequest().setAttribute("event", e);
        Request r = new Request();
        r.setContentHandle(e.getShortDescription() + "_registrants");
        r.setProperty("eid", String.valueOf(e.getId().intValue()));
        
        //this gets refreshed when people sign up.
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) m.get(e.getShortDescription() + "_registrants");

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            rsc.sortByColumn(Integer.parseInt(sortCol), sortDir.equals("asc"));
        }

        setSortInfo(rsc);

        getRequest().setAttribute("list", rsc);

        setNextPage(e);
    }

    protected Event getEvent() {
        return DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
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
