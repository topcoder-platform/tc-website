package com.topcoder.web.tc.controller.request.introevent;

import java.util.ArrayList;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 7, 2006
 */
public class Description extends BaseProcessor {
    protected void businessProcessing() throws Exception {

        ResultSetContainer rsc = getData();
        sortData(rsc);
        rsc = filterData(rsc);
        rsc = cropData(rsc);

        getRequest().setAttribute("list", rsc);
        setNextPage("/introevent/collegetour/description.jsp");
        setIsNextPageInContext(true);
    }

    private ResultSetContainer cropData(ResultSetContainer rsc)
            throws Exception {
        Boolean full = "true".equals(StringUtils.checkNull(getRequest().getParameter(Constants.FULL_LIST)));
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        if ("".equals(numRecords)) {
            numRecords = Constants.DEFAULT_COLLEGE_TOUR;
        } else if (Integer.parseInt(numRecords) > Integer.parseInt(Constants.MAX_COLLEGE_TOUR)) {
            numRecords = Constants.MAX_COLLEGE_TOUR;
        }

        if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }

        int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

        if (!full) {
            // crops data
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);
        }
            
        getRequest().setAttribute("goToSchools", StringUtils.checkNull(getRequest().getParameter("goToSchools")));
        getRequest().setAttribute(Constants.FULL_LIST, full);
        setDefault(DataAccessConstants.START_RANK, startRank);
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
        return rsc;
    }

    private ResultSetContainer filterData(ResultSetContainer rsc) {
        ArrayList<ResultFilter> filters = new ArrayList<ResultFilter>(1);
        String eventName = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_NAME));
        if (!eventName.equals("")) {
            filters.add(new Contains(eventName, "event_name"));
            setDefault(Constants.EVENT_NAME, eventName);
        }
        if (filters.size() > 0) {
            rsc = new ResultSetContainer(rsc, filters.toArray(new ResultFilter[0]));
        }
        return rsc;
    }

    private void sortData(ResultSetContainer rsc) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!sortCol.equals("")) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
        }

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("start_time"), "desc");
        s.addDefault(rsc.getColumnIndex("event_name"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

    private ResultSetContainer getData() throws Exception {
        Request r = new Request();
        r.setContentHandle("college_tour_school_list");
        Map result = new CachedDataAccess(MaxAge.HOUR, DBMS.OLTP_DATASOURCE_NAME).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) result.get("college_tour_school_list");
        return rsc;
    }

}
