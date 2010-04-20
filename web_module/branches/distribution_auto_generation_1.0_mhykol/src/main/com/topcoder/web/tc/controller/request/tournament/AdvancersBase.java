package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * Base class for Algo and Marathon tournament advancers stats
 * 
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class AdvancersBase extends Base {
    
    public static final String FULL_LIST = "full";
    
    /**
     * Gets the contest prefix. It will be used mainly for the jsp path but could be used for other purposes as well. 
     * Example: tco07, tccc07, etc.
     * 
     * @return the contest prefix
     */
    protected abstract String getContestPrefix();

    /**
     * Gets the command name for this stat
     * 
     * @return the command name
     */
    protected abstract String getCommandName();


    /**
     * Gets the page for this stat
     * 
     * @return the page
     */
    protected abstract String getPageName();
    
    /**
     * Sets the sort info for the result
     * 
     * @param rsc
     */
    protected abstract void setSortInfo(ResultSetContainer rsc);

    /**
     * Gets the datasource for this stat
     * 
     * @return the datasource name
     */
    protected abstract String getDataSourceName();

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws com.topcoder.web.common.TCWebException {

        try {
            // get data from DB
            ResultSetContainer rsc = getData();

            // sort result
            sortResult(rsc);
    
            // filter handle
            rsc = filterResult(rsc);

            // crop result
            rsc = cropResult(rsc);

            // go to result page
            getRequest().setAttribute("result", rsc);
            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * Crops the result as specified
     * 
     * @param rsc the resultsetcontainter to crop
     * @throws Exception
     */
    private ResultSetContainer cropResult(ResultSetContainer rsc) throws Exception {
        Boolean full = "true".equals(StringUtils.checkNull(getRequest().getParameter(FULL_LIST)));

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

        if (!full) {
            // crops data
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);
        }
            
        getRequest().setAttribute(FULL_LIST, full);
        return rsc;
    }

    /**
     * Filters the result according to the specified handle 
     * 
     * @param rsc the resultsetcontainter to filter
     */
    private ResultSetContainer filterResult(ResultSetContainer rsc) {
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
        return rsc;
    }

    /**
     * Sorts the result as specified
     * 
     * @param rsc the resultsetcontainter to sort
     */
    private void sortResult(ResultSetContainer rsc) {
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        if (!(sortCol.equals("")) && rsc != null) {
            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
        }
        setSortInfo(rsc);
    }

    /**
     * Gets the necessary data from the DB to build this stat
     * 
     * @return the ResultSetContainer with the data from the DB
     * @throws Exception
     */
    private ResultSetContainer getData() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle(getCommandName());
        DataAccessInt dai = getDataAccess(getDataSourceName(), true);
        
        // check if there are params to add
        Map filteredMap = getFilter();
        if (filteredMap.size() > 0) {
            dataRequest.setProperties(filteredMap);
        }
        
        Map result = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
        return rsc;
    }

    /**
     * Base implementation returns an emtpy Map
     * 
     * @return a Map with the filter for the data retrieval
     */
    protected Map getFilter() throws TCWebException {
        return new HashMap();
    }    
}
