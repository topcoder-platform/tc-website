package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

/**
 * List the winner(s) for each match.
 * 
 * @author cucu
 */
public class MatchWinners extends Base {

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

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

            r.setContentHandle("marathon_match_winners");

            Map<String, ResultSetContainer> result = getDataAccess(DBMS.DW_DATASOURCE_NAME,true).getData(r);

            ResultSetContainer rsc = result.get("marathon_match_winners");

            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }
            
            result.put("marathon_match_winners", (ResultSetContainer)rsc.subList(Integer.parseInt(startRank)-1, endRank));

            SortInfo s = new SortInfo();
/*            s.addDefault(rsc.getColumnIndex("num_competitors"), "desc");            
            s.addDefault(rsc.getColumnIndex("num_submissions"), "desc");
            s.addDefault(rsc.getColumnIndex("avg_submissions"), "desc");
            s.addDefault(rsc.getColumnIndex("date"), "desc");
*/
            
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
            setDefault(DataAccessConstants.START_RANK, startRank);
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("matches", rsc);
            getRequest().setAttribute("croppedDataBefore", rsc.croppedDataBefore());
            getRequest().setAttribute("croppedDataAfter", rsc.croppedDataAfter());

            setNextPage(Constants.PAGE_MATCH_LIST);
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

