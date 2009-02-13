package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.Map;
import java.util.Iterator;
import java.util.HashMap;

/**
 * @author rfairfax
 */
public abstract class StatBase extends Base {

    abstract String getDataSourceName() throws TCWebException;

    abstract String getCommandName() throws TCWebException;

    abstract String getPageName() throws TCWebException;

    abstract void statProcessing() throws TCWebException;

    protected void developmentProcessing() throws TCWebException {

        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY)&&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN)&&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            Map result = dai.getData(dataRequest);

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
