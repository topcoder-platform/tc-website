/*
 * ViewSystemTestResults.java
 *
 * Created on November 9, 2005, 3:21 AM
 *
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
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
public class ViewSystemTestResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewSystemTestResults.class);
    
    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            
            String startRank = StringUtils.checkNull(getRequest().getParameter(Constants.START_ROW));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(Constants.ROW_COUNT));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(Constants.SORT_ORDER));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_COLUMN));
            
            if ("".equals(numRecords)) {
                numRecords = "10";
            } else if (Integer.parseInt(numRecords)>200) {
                numRecords="200";
            }
            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }
            if (sortCol.equals("")) {
                sortCol = "1";
            }

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;
            
            r.setContentHandle("long_contest_system_test_results");
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.PROBLEM_ID,request.getParameter(Constants.PROBLEM_ID));

            Map result = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
  
//            ResultSetContainer rsc = (ResultSetContainer) result.get("long_contest_round_registrants");
//            rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
//            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank),endRank);
//            result.put("long_contest_round_registrants", rsc);

//            SortInfo s = new SortInfo();
//            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(Constants.ROW_COUNT, numRecords);
            setDefault(Constants.START_ROW, startRank);

            request.setAttribute("resultMap", result);
            setNextPage(Constants.PAGE_VIEW_SYSTEM_TEST_RESULTS);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
