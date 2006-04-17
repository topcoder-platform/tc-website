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
public class RoundOverview extends Base { 

    private int getSeasonForRound(int roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("lookup_season");
        r.setProperty("rd", "" + roundId);
        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) result.get("lookup_season");
        if (rsc.getRowCount() < 1) {
            throw new IllegalArgumentException("The round " + roundId + " does not belong to any season");
        }
        return rsc.getIntItem(0, "season_id");
    }
    
    private void getMostRecent(RoundInfo round) throws Exception {
        Request r = new Request();
        r.setContentHandle("Most_Recent_Round_And_Season");
        
        if (round.hasRoundId()) {
            r.setProperty("rd", "" + round.getRoundId());
        }

        if (round.hasSeasonId()) {
            r.setProperty("snid", "" + round.getSeasonId());
        }
        
        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);

        if (!round.hasSeasonId()) {
            ResultSetContainer rsc = (ResultSetContainer) result.get("most_recent_season");
            if (rsc.getRowCount() < 1) {
                throw new IllegalArgumentException("No seasons found!");
            }
            round.setSeasonId(rsc.getIntItem(0, "season_id"));
        }

        if (!round.hasRoundId()) {
            ResultSetContainer rsc = (ResultSetContainer) result.get("Most_Recent_Round_For_Season");
            if (rsc.getRowCount() < 1) {
                throw new IllegalArgumentException("No rounds found for season " + round.getSeasonId());
            }
            round.setRoundId(rsc.getIntItem(0, "round_id"));
        }
        
    }
    
    /**
     * Retrieves the round and season ids.
     * If possible, it gets them from the request parameters.
     * If season is missing but round is present, it looks up the season of the round.
     * If both parameters are missing or just the round id, the most recents are looked up
     * 
     * @param req Request where snid and rd may be present
     * @return a RoundInfo with round id and season id filled and emtpy names.
     */
    private RoundInfo getRoundAndSeasonIds(TCRequest req) throws Exception {
        RoundInfo round = new RoundInfo();
        
        
        if(hasParameter("snid")) {
            round.setSeasonId(Integer.parseInt(req.getParameter("snid")));
        } 

        if(hasParameter("rd")) {
            round.setRoundId(Integer.parseInt(req.getParameter("rd")));
        } 
        
        // If season what not specified but round was specified, lookup the season id
        if (!round.hasSeasonId() && round.hasRoundId()) {
            round.setSeasonId(getSeasonForRound(round.getRoundId()));
        }
        
        
        // If either season or round were not specified, retrieve the most recent ones
        if (!round.hasSeasonId() || !round.hasRoundId()) {
            getMostRecent(round);
        }

        return round;        
    }
    
    private void fillRoundAndSeasonNames(RoundInfo round, Map result) {
        // Look up Season Name
        String seasonName = null;
        for (Iterator it = ((ResultSetContainer) result.get("seasons")).iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();
            if (round.getSeasonId() == rsr.getIntItem("season_id")) {
                seasonName = rsr.getStringItem("name");
                break;
            }                
        }
        if (seasonName == null) {
            throw new IllegalArgumentException("can't find the season name for season id " + round.getSeasonId() );
        }

        // Look up Round Name
        String roundName = null;
        for (Iterator it = ((ResultSetContainer) result.get("rounds_for_season")).iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();
            if (round.getRoundId() == rsr.getIntItem("round_id")) {
                roundName = rsr.getStringItem("name");
                break;
            }                
        }
        if (roundName == null) {
            throw new IllegalArgumentException("can't find the round name for round id " + round.getRoundId());
        }
          
        round.setRoundName(roundName);
        round.setSeasonName(seasonName);
    }
    
    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());

            Request r = new Request();
            r.setContentHandle("HS_RoundOverview");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", "1"); // HIGH SCHOOL: FIX USE A CONSTANT!
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames (round, result);
            
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            
            setNextPage(Constants.HS_ROUND_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    /*
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("HS_RoundOverview");
            int snid = -1;
            int rd = -1;
            
            
            if(hasParameter("snid")) {
                r.setProperty("snid", getRequest().getParameter("snid"));
                snid = Integer.parseInt(getRequest().getParameter("snid"));
            } 

            if(hasParameter("rd")) {
                r.setProperty("rd", getRequest().getParameter("rd"));
                rd = Integer.parseInt(getRequest().getParameter("rd"));
            } 
            
            r.setProperty("sntid", "1"); // HIGH SCHOOL: FIX USE A CONSTANT!
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            
            // if no season id specified, get the most recent.
            if(!hasParameter("snid")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("most_recent_season");
                snid = rsc.getIntItem(0, "season_id");
            }
            
            // if no round id specified, get the most recent.
            if(!hasParameter("rd")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("Most_Recent_Round_For_Season");
                rd = rsc.getIntItem(0, "round_id");
            }
            
            // Look up Season Name
            String seasonName = null;
            for (Iterator it = ((ResultSetContainer) result.get("seasons")).iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();
                if (snid == rsr.getIntItem("season_id")) {
                    seasonName = rsr.getStringItem("name");
                    break;
                }                
            }
            if (seasonName == null) {
                throw new IllegalArgumentException("can't find the season name for season id " + snid);
            }

            // Look up Round Name
            String roundName = null;
            for (Iterator it = ((ResultSetContainer) result.get("rounds_for_season")).iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();
                if (rd == rsr.getIntItem("round_id")) {
                    roundName = rsr.getStringItem("name");
                    break;
                }                
            }
            if (roundName == null) {
                throw new IllegalArgumentException("can't find the round name for round id " + rd);
            }

            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("snid", "" + snid);
            getRequest().setAttribute("rd", "" + rd);
            getRequest().setAttribute("seasonName", seasonName);
            getRequest().setAttribute("roundName", roundName);
            
            setNextPage(Constants.HS_ROUND_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    */

}
