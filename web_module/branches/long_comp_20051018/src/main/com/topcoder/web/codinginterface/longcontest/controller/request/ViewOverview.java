/*
 * ViewOverview.java
 *
 * Created on November 8, 2005, 4:59 PM
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import java.util.Map;

/**
 *
 * @author Porgery
 */
public class ViewOverview extends Base {
    protected static final Logger log = Logger.getLogger(ViewOverview.class);
    
    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            
            String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            
            int numRecords = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
            int startRank = 1, sortCol = 1;
            if (!"".equals(numRecordsStr)) {
                numRecords = Integer.parseInt(numRecordsStr);
            }
            if (!startRankStr.equals("")){
                startRank = Integer.parseInt(startRankStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }

            int endRank = startRank + numRecords - 1;
            
            r.setContentHandle("long_contest_overview");
            if(request.getParameter(Constants.ROUND_ID) == null){
                // TODO: Get the round ID of the most recent active round
            }else{
                r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            }
            Map result = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_contest_overview_coders");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));

            rsc = new ResultSetContainer(rsc, startRank, endRank);

            result.put("long_contest_overview_coders", rsc);

//            SortInfo s = new SortInfo();
//            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, ""+numRecords);
            setDefault(DataAccessConstants.START_RANK, ""+startRank);

            request.setAttribute("resultMap", result);
            setNextPage(Constants.PAGE_VIEW_OVERVIEW);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
