package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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
            
            ListInfo li = new ListInfo(getRequest(), 1, 50, 2, "ASC");

            Request r = new Request();
            r.setContentHandle("hs_round_stats_team");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);

            fillRoundAndSeasonNames (round, result);

            getRequest().setAttribute("totalRows", ((ResultSetContainer) result.get("team_result")).getRowCount() + "");

            sortAndCrop(result, "team_result", li);

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
