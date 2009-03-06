/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * <p>An implementation of the <code>RBoard EJB</code>.</p>
 *
 * <p>
 *   Version 1.0.1 (2009 TopCoder Open Site Integration 1.1)  Change notes: 
 *   <ol>
 *     <li><code>developmentProcessing()</code> method was modified to return a typed <code>Map</code>.</li>
 *   </ol>
 * </p>
 *
 * @author rfairfax, TCSDEVELOPER
 * @version 1.0.1
 */
public abstract class StatBase extends Base {

    protected abstract String getDataSourceName() throws TCWebException;

    protected abstract String getCommandName() throws TCWebException;

    protected abstract String getPageName() throws TCWebException;

    protected abstract void statProcessing() throws TCWebException;

    /**
     * <p>Generic request processing method. It will get query information from
     * sub classes and run it against the corresponding datasource.</p>
     *
     * @throws TCWebException if an error occurs.
     */
    protected void developmentProcessing() throws TCWebException {

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
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            
            // This had to be fixed, otherwise JSTL confuses casts.
            Map<String, ResultSetContainer> result = dai.getData(dataRequest);

            //probably need to change this to sort multiple datasets
            /* ResultSetContainer rsc = (ResultSetContainer)result.get(dataRequest.getContentHandle());
             String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
             String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
             if (sortCol != null && sortDir != null && rsc != null)
                 rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc")); */

            getRequest().setAttribute("resultMap", result);

            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

            statProcessing();

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
