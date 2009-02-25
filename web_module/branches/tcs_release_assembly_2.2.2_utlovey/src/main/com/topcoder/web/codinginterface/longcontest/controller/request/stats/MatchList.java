package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

/**
 * Display a list of completed matches.
 * 
 * @author cucu
 */
public class MatchList extends Base {

    protected void longContestProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if ("".equals(numRecords)) {
                numRecords = "50";
            } else if (Integer.parseInt(numRecords)>200) {
                numRecords="200";
            } else if (Integer.parseInt(numRecords)<=0) {
                numRecords="50";
            }

            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            int sr =  Integer.parseInt(startRank);
            int nr = Integer.parseInt(numRecords);
            int endRank = sr + nr - 1;

            r.setContentHandle("marathon_match_list");

            Map<String, ResultSetContainer> result = getDataAccess(DBMS.DW_DATASOURCE_NAME,true).getData(r);

            ResultSetContainer rsc = result.get("marathon_match_list");
            rsc = new ResultSetContainer(rsc, new RoundDisplayNameCalculator("display_name"));

            if ("".equals(sortCol)) {
                sortCol = rsc.getColumnIndex("date") + "";
                sortDir = "desc";
            }
            
            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }
            
            rsc = new ResultSetContainer(rsc, sr, endRank);
            
            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("num_competitors"), "desc");            
            s.addDefault(rsc.getColumnIndex("num_submissions"), "desc");
            s.addDefault(rsc.getColumnIndex("avg_submissions"), "desc");
            s.addDefault(rsc.getColumnIndex("date"), "desc");

            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, nr);
            setDefault(DataAccessConstants.START_RANK, sr);
            getRequest().setAttribute("matches", rsc);
            getRequest().setAttribute("columnMap", rsc.getColumnNameMap());

            setNextPage(Constants.PAGE_MATCH_LIST);
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

