package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import javax.servlet.http.HttpUtils;
import java.util.Map;

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
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString());
        map.remove(Constants.MODULE_KEY);
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
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
