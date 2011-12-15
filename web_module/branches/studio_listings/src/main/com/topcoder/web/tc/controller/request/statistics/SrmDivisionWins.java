package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

import java.util.Map;

/**
 *
 * @author coachbudka
 */
public class SrmDivisionWins extends Base {

    protected void businessProcessing() throws TCWebException {
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

            r.setContentHandle("srm_division_wins");

            Map result = getDataAccess(true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("srm_division_wins");
            if (sortCol.equals("4")) {  // Division 1 wins, desc default
                rsc.sortByColumn("winnerhandle1", "desc".equals(sortDir));
                rsc.sortByColumn("wins1", !"desc".equals(sortDir));
            } else if (sortCol.equals("8")) {  // Division 2 total wins
                // List the highest div 2 winners first; list their won SRM's in asc/desc order
                rsc.sortByColumn("winnerhandle2", "desc".equals(sortDir));
                rsc.sortByColumn("wins2", !"desc".equals(sortDir));
            } else if (sortCol.equals("3")) {  // Division 1 handle
                // Sort coders alphabetically (asc/desc); list won SRM's in order
                rsc.sortByColumn("calendar_id", true);
                rsc.sortByColumn("winnerhandle1", !"desc".equals(sortDir));                
            } else if (sortCol.equals("7")) {  // Division 2 handle
                // Sort coders alphabetically (asc/desc); list won SRM's in order
                rsc.sortByColumn("calendar_id", true);
                rsc.sortByColumn("winnerhandle2", !"desc".equals(sortDir));                
            } else if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }

            result.put("srm_division_wins", (ResultSetContainer)rsc.subList(Integer.parseInt(startRank)-1, endRank));

            SortInfo s = new SortInfo();
            s.addDefault(4, "desc");
            s.addDefault(8, "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
            setDefault(DataAccessConstants.START_RANK, startRank);
            getRequest().setAttribute("resultMap", result);

            setNextPage("/statistics/srmDivisionWins.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

