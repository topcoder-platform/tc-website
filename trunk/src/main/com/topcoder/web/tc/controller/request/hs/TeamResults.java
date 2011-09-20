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
            int tmid = Integer.parseInt((String) getRequest().getParameter("tmid"));

            // if the most recent round or season are not found, don't use the typical query because
            // just rounds and seasons where the team has participated are needed
            RoundInfo round = getRoundAndSeasonIds(getRequest(), false);

            // retrieve the last season if necessary
            if (!round.hasSeasonId()) {
                round.setSeasonId(getMostRecentSeason(tmid));
                
                // if still no season found, the team has never competed, then set the required values so that
                // a legend is written in the page.
                if (!round.hasSeasonId()) {
                    getRequest().setAttribute("competed", "false");            
                    setNextPage(Constants.HS_TEAM_RESULTS);
                    setIsNextPageInContext(true);                    
                    return;
                }
            }
            
                    
            if (!round.hasRoundId()) {
                round.setRoundId(getMostRecentRound(tmid, round.getSeasonId()));
            }

            ListInfo li = new ListInfo(getRequest(), 3, "ASC");
            
            
            Request r = new Request();
            r.setContentHandle("hs_team_result");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            r.setProperty("tmid", getRequest().getParameter("tmid"));
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames(round, result, "seasons_for_team", "rounds_for_season_and_team");

            sortAndCrop(result, "hs_ind_result_for_team", li);                        
            getRequest().setAttribute("listInfo", li);
            getRequest().setAttribute("tmid", tmid + "");            
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("competed", "true");
            
            setNextPage(Constants.HS_TEAM_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    /**
     * Get the most recent season where the team has competed.
     * 
     * @param tmid team to check
     * @return the most recent season where the team has competed.
     * @throws Exception
     */
    private int getMostRecentSeason(int tmid) throws Exception {
        Request r = new Request();
        r.setContentHandle("seasons_for_team");
        r.setProperty("sntid", HS_SNTID + "");
        r.setProperty("tmid", tmid + "");

        Map result = getDataAccess(true).getData(r);
 
        ResultSetContainer rsc = (ResultSetContainer) result.get("seasons_for_team");
        
        if (rsc.getRowCount() == 0) {
            return -1;
        }
        return rsc.getIntItem(rsc.getRowCount() - 1, "season_id");
    }

    /**
     * Get the most recent round in a season where the team has competed.
     * 
     * @param tmid team to check
     * @param snid season id of the round
     * @return the most recent round in a season where the team has competed.
     * @throws Exception
     */
    private int getMostRecentRound(int tmid, int snid) throws Exception {
        Request r = new Request();
        r.setContentHandle("rounds_for_season_and_team");
        r.setProperty("snid", snid + "");
        r.setProperty("tmid", tmid + "");

        Map result = getDataAccess(true).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) result.get("rounds_for_season_and_team");
        
        if (rsc.getRowCount() == 0) {
            return -1;
        }
        return rsc.getIntItem(rsc.getRowCount() - 1, "round_id");
    }


}
