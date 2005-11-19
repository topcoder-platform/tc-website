/*
 * ViewSystemTestResults.java
 *
 * Created on November 9, 2005, 3:21 AM
 *
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import java.util.Map;
import java.util.HashMap;
import java.util.ListIterator;

/**
 *
 * @author Porgery
 */
public class ViewSystemTestResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewSystemTestResults.class);
    
    protected void businessProcessing() throws TCWebException {
	if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
	}
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            
            String startRowStr = StringUtils.checkNull(getRequest().getParameter(Constants.START_ROW));
            String startColStr = StringUtils.checkNull(getRequest().getParameter(Constants.START_COL));
            String rowCountStr = StringUtils.checkNull(getRequest().getParameter(Constants.ROW_COUNT));
            String colCountStr = StringUtils.checkNull(getRequest().getParameter(Constants.COL_COUNT));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(Constants.SORT_ORDER));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_COLUMN));
            
            int rowCount = Integer.parseInt(Constants.DEFAULT_SYSTEM_TEST_RESULTS_ROW_COUNT);
            int colCount = Integer.parseInt(Constants.DEFAULT_COL_COUNT);
            int startRow = 1, startCol = 1, sortCol = 2;
            if (!"".equals(rowCountStr)) {
                rowCount = Integer.parseInt(rowCountStr);
            }
            if (!"".equals(colCountStr)) {
                colCount = Integer.parseInt(colCountStr);
            }
            if (!startRowStr.equals("")){
                startRow = Integer.parseInt(startRowStr);
            }
            if (!startColStr.equals("")){
                startCol = Integer.parseInt(startColStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }
            if (sortDir.equals("")) {
                sortDir = (sortCol == 1)?"asc":"desc";
            }

            int endRow = startRow + rowCount - 1;
            int endCol = startCol + colCount - 1;
            
            r.setContentHandle("long_contest_system_test_results");
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.PROBLEM_ID,request.getParameter(Constants.PROBLEM_ID));
            if(!"".equals(StringUtils.checkNull(request.getParameter(Constants.TEST_CASE_ID))))
                r.setProperty(Constants.TEST_CASE_ID,request.getParameter(Constants.TEST_CASE_ID));

            Map result = getDataAccess(DBMS.DW_DATASOURCE_NAME, false).getData(r);
  
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_contest_test_results_coders");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));
            rsc = new ResultSetContainer(rsc, startRow, endRow);
            result.put("long_contest_test_results_coders", rsc);

            rsc = (ResultSetContainer) result.get("long_contest_test_results_cases");
//            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));
            rsc = new ResultSetContainer(rsc, startCol, endCol);
            result.put("long_contest_test_results_cases", rsc);

            rsc = (ResultSetContainer) result.get("long_contest_system_test_results");
            HashMap hash = new HashMap();
            for(ListIterator iter = rsc.listIterator(); iter.hasNext(); ){
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)iter.next();
                hash.put(row.getItem("coder_id") + "_" + row.getItem("test_case_id"), "" + row.getItem("score"));
            }

            request.setAttribute("resultMap", result);
            request.setAttribute("scoreHash", hash);
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
