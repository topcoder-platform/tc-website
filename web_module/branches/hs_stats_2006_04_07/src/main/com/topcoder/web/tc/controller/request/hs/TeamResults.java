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
public class TeamResults extends Base { 

    /**
     * Column names used for sorting. 
     */
    private static String columnNames[] = {"handle", "division_placed",          
        "problems_submitted", "submission_points", 
        "challenge_attempts_received", "defense_points", "challenge_attempts_made",
        "challenge_points", "system_test_points", "final_points"};

    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());
            ListInfo li = new ListInfo(getRequest(), 1, "ASC", columnNames);
            
            int tmid = Integer.parseInt((String) getRequest().getParameter("tmid"));
            
            Request r = new Request();
            r.setContentHandle("hs_team_result");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            r.setProperty("tmid", getRequest().getParameter("tmid"));
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames (round, result);

            sortAndCrop(result, "hs_ind_result_for_team", li);                        
            getRequest().setAttribute("listInfo", li);
            getRequest().setAttribute("tmid", tmid + "");            
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            
            setNextPage(Constants.HS_TEAM_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
