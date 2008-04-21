/*
 * ViewOverview.java
 *
 * Created on November 8, 2005, 4:59 PM
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
/**
 * @author Porgery, Cucu
 */
public class ViewOverview extends Base {
    protected static final Logger log = Logger.getLogger(ViewOverview.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            Request r = new Request();

            String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            int numRecords = 50;
            int startRank = 1;

            r.setContentHandle("long_contest_overview");

            String roundID = request.getParameter(Constants.ROUND_ID);
            if (roundID == null) {
                // Find most recent round
                Request req = new Request();
                req.setContentHandle("marathon_match_list");
                ResultSetContainer rsc = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(req).get("marathon_match_list");
                roundID = rsc.getStringItem(0, "round_id");
                getRequest().setAttribute(Constants.ROUND_TYPE_ID, new Integer(rsc.getIntItem(0, "round_type_id")));
            }
            
            r.setProperty(Constants.ROUND_ID, roundID);
            
            Map<String, ResultSetContainer> result = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);
            ResultSetContainer rsc = result.get("long_contest_overview_coders");

            int sortCol = rsc.getColumnIndex("placed");
            if (!numRecordsStr.equals("")) {
                numRecords = Integer.parseInt(numRecordsStr);
            }
            if (!startRankStr.equals("")) {
                startRank = Integer.parseInt(startRankStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }
            int endRank = startRank + numRecords - 1;

            
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));
            rsc = new ResultSetContainer(rsc, startRank, endRank);

            ResultSetContainer rounds = new ResultSetContainer(result.get("long_contest_round_list"), new RoundDisplayNameCalculator("display_name"));
            
            ResultSetContainer info = new ResultSetContainer(result.get("long_contest_overview_info"), new RoundDisplayNameCalculator("display_name"));
            
            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("point_total"), "desc");
            s.addDefault(rsc.getColumnIndex("system_point_total"), "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            
            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
            setDefault(DataAccessConstants.START_RANK, startRank);

            request.setAttribute("infoRow", info.get(0));
            request.setAttribute("categories", result.get("long_contest_round_categories"));
            request.setAttribute("competitors", rsc);
            request.setAttribute("rounds", rounds);
            request.setAttribute("columnMap", rsc.getColumnNameMap());  
            request.setAttribute("roundId", roundID);
            
            setDefault(Constants.ROUND_ID, roundID);
            setNextPage(Constants.PAGE_VIEW_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
        
}
