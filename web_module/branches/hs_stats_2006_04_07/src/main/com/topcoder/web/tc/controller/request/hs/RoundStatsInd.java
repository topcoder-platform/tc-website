package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoundStatsInd extends Base { 


    /**
     * Column names used for sorting. 
     */
    private static String columnNames[] = {"handle", "division_placed",
         "submission_points", "total_challenge_points", "system_test_points", "final_points", 
         "old_rating", "rating_change", "new_rating"};

    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());
            
            boolean groupByRoom = !hasParameter("sc");
            
            ListInfo li = new ListInfo(getRequest(), 1, 50, 2, "ASC", columnNames);
            
            Request r = new Request();
            r.setContentHandle("hs_round_stats_ind");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames (round, result);
                                  
            if (!groupByRoom) {
                sortAndCrop(result, "team_result", li);
            }
                        
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("groupByRoom", groupByRoom? "true" : "false");
            getRequest().setAttribute("listInfo", li);
            
            setNextPage(Constants.HS_ROUND_STATS_IND);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
