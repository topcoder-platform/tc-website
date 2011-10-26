package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.tc.Constants;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Map;

/**
 * @author dok, pulky
 * @version $Revision: 63505 $ Date: 2005/01/01 00:00:00
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

        if (!(sortCol.equals(""))) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
        }

        setSortInfo(rsc);
        getRequest().setAttribute("numRegistrants", rsc.size());

        if (e.getRegistrationStart().after(new GregorianCalendar(2007, 6, 1).getTime())) {
            log.debug("Registrants page pageable.");
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

            if ("".equals(numRecords)) {
                numRecords = "50";
            } else if (Integer.parseInt(numRecords) > 200) {
                numRecords = "200";
            }

            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            setDefault(DataAccessConstants.START_RANK, startRank);
            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);


            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

            ArrayList<ResultFilter> filters = new ArrayList<ResultFilter>(1);
            String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
            if (!handle.equals("")) {
                if (log.isDebugEnabled()) {
                    log.debug("add handle filter: " + handle);
                }
                filters.add(new Contains(handle.toLowerCase(), "handle_lower"));
                setDefault(Constants.HANDLE, handle);
            }

            if (filters.size() > 0) {
                rsc = new ResultSetContainer(rsc, filters.toArray(new ResultFilter[0]));
            }
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);

        } else {
            log.debug("Registrants page NOT pageable.");
        }

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

    protected final String getContestTypeUsingEventType(Integer eventTypeId) {
        if (EventType.COMPONENT_TOURNAMENT_ID.equals(eventTypeId)) {
            return "component";
        } else if (EventType.ALGORITHM_TOURNAMENT_ID.equals(eventTypeId)) {
            return "algorithm";
        } else if (EventType.MARATHON_TOURNAMENT_ID.equals(eventTypeId)) {
            return "marathon";
        } else if (EventType.STUDIO_TOURNAMENT_ID.equals(eventTypeId)) {
            return "studio";
        } else if (EventType.SPONSOR_TRACK_ID.equals(eventTypeId)) {
            return "sponsortrack";
        }
        return "";
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
