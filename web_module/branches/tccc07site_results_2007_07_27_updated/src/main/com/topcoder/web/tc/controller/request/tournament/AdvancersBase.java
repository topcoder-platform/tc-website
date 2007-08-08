package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class AdvancersBase extends Base {
    
    protected abstract String getContestPrefix();

    protected abstract int getNumberInstances();

    protected abstract Map<Long, Integer> getRoundsSort();

    protected String getCommandName() {
        return "tccc07_alg_adv_overview";
    }

    protected String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/advancers.jsp";
    }

    protected void developmentProcessing() throws com.topcoder.web.common.TCWebException {
        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY) &&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN) &&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        try {

            log.debug("full param: " + StringUtils.checkNull(getRequest().getParameter("full")));

            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            Map result = dai.getData(dataRequest);

            ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(sortCol.equals("")) && rsc != null) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }

            setSortInfo(rsc);

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
                filters.add(new Contains(handle.toLowerCase(), "handle_sort"));
                setDefault(Constants.HANDLE, handle);
            }
    
            if (filters.size() > 0) {
                rsc = new ResultSetContainer(rsc, filters.toArray(new ResultFilter[0]));
            }

            // crops data
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);

            getRequest().setAttribute("result", rsc);
            getRequest().setAttribute("full", Boolean.FALSE);

            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
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

}
