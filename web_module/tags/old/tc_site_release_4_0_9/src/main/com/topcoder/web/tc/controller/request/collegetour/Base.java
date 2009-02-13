package com.topcoder.web.tc.controller.request.collegetour;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.HashMap;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
abstract public class Base extends BaseProcessor {
    private long schoolId = 0;
    private long roundId = 0;
    private long eventId = 0;

    protected final void businessProcessing() throws Exception {
        String eid = getRequest().getParameter(Constants.COLLEGE_TOUR_EVENT_ID);
        if (eid==null) {
            throw new TCWebException("invalid request no event id specified");
        } else {
            eventId = Long.parseLong(eid);
            Request r = new Request();
            r.setContentHandle("college_tour_event_info");
            r.setProperty(Constants.COLLEGE_TOUR_EVENT_ID, eid);
            ResultSetContainer rsc = (ResultSetContainer)getDataAccess(true).getData(r).get("college_tour_event_info");
            if (rsc.isEmpty()) {
                throw new TCWebException("Missing config info for college tour event " + eid);
            } else {
                schoolId = rsc.getLongItem(0, "school_id");
                roundId = rsc.getLongItem(0, "round_id");
                getRequest().setAttribute(Constants.ROUND_ID, String.valueOf(roundId));
                getRequest().setAttribute(Constants.SCHOOL_ID, String.valueOf(schoolId));
                getRequest().setAttribute(Constants.SCHOOL_NAME, rsc.getStringItem(0, "school_name"));
                getRequest().setAttribute(Constants.ROUND_NAME, rsc.getStringItem(0, "round_name"));
            }
        }
        collegeTourProcessing();
    }

    protected void loadConfigInfo() throws Exception {
        Request r = new Request();
        r.setContentHandle("college_tour_event_config");
        r.setProperty(Constants.COLLEGE_TOUR_EVENT_ID, String.valueOf(eventId));
        ResultSetContainer rsc = (ResultSetContainer)getDataAccess(true).getData(r).get("college_tour_event_config");
        if (rsc.isEmpty()) {
            throw new TCWebException("no config found in db for event " + eventId);
        } else {
            ResultSetContainer.ResultSetRow row;
            HashMap map = new HashMap();
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                map.put(new Long(row.getLongItem("property_id")), row.getStringItem("property_value"));
            }
            setDefault(Constants.COLLEGE_TOUR_CONFIG_INFO, map);
        }
    }

    public long getSchoolId() {
        return schoolId;
    }

    public long getRoundId() {
        return roundId;
    }

    public long getEventId() {
        return eventId;
    }

    protected abstract void collegeTourProcessing() throws Exception;

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }
}
