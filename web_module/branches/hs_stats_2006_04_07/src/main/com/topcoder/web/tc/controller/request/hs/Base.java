package com.topcoder.web.tc.controller.request.hs;

import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;

abstract public class Base extends BaseProcessor {

    /**
     * Season type id for high school.
     */
    public static final int HS_SNTID = 1;

  
    
    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.DW_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }


    /**
     * Looks up the season id for a round.
     * 
     * @param roundId round id to look up
     * @return the season id for that round
     * @throws Exception
     */
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
    
    /**
     * Get the most recent round id and/or season_id
     * 
     * @param round the object where round id and/or season id will be stored
     * @throws Exception
     */
    private void getMostRecent(RoundInfo round) throws Exception {
        Request r = new Request();
        r.setContentHandle("Most_Recent_Round_And_Season");
        r.setProperty("sntid", HS_SNTID + "");
        
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
    protected RoundInfo getRoundAndSeasonIds(TCRequest req) throws Exception {
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
    
    /**
     * Fills the RoundInfo object with the season and round names and the forum_id
     * The result map must contain ResultSets for queries "seasons" and "rounds_for_season"
     *  
     * @param round a Round having roundId and seasonId, and whose names will be filled
     * @param result a map that must contain ResultSets for queries "seasons" and "rounds_for_season"
     */
    protected void fillRoundAndSeasonNames(RoundInfo round, Map result) {
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
        int forumId = -1;
        for (Iterator it = ((ResultSetContainer) result.get("rounds_for_season")).iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();
            if (round.getRoundId() == rsr.getIntItem("round_id")) {
                roundName = rsr.getStringItem("name");
                
                // if the forum_id can't be retrieved, ignore it so it will be -1
                try {
                    forumId = rsr.getIntItem("forum_id");
                } catch(Exception e) {}
                break;
            }                
        }
        if (roundName == null) {
            throw new IllegalArgumentException("can't find the round name for round id " + round.getRoundId());
        }
         
        round.setForumId(forumId);
        round.setRoundName(roundName);
        round.setSeasonName(seasonName);
    }

}
