package com.topcoder.web.tc.controller.request.hs;

import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoundStatsTeam extends Base { 

    
    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());
            ListInfo li = new ListInfo(getRequest(), 1, 50, 3, "ASC");
            
            Request r = new Request();
            r.setContentHandle("hs_round_stats_team");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames (round, result);
            
//            ResultSetContainer rsc = (ResultSetContainer) ((ResultSetContainer) result.get("team_result")).
                    //subList(li.getStartRow(), li.getEndRow());
  //          rsc.sortByColumn(li.getSortColumn(), "ASC".equalsIgnoreCase(li.getSortDirection()));
            sortAndCrop((ResultSetContainer) result.get("team_result"), li);
            
            //getRequest().setAttribute("team_result", rsc);
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("listInfo", li);
            
            setNextPage(Constants.HS_ROUND_STATS_TEAM);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
