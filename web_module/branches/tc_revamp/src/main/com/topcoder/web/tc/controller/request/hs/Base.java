package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCRequest;

import java.util.Iterator;
import java.util.Map;

abstract public class Base extends BaseProcessor {

    /**
     * Season type id for high school.
     */
    public static final int HS_SNTID = 2;


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
        return getRoundAndSeasonIds(req, true);
    }

    /**
     * Retrieves the round and season ids.
     * If possible, it gets them from the request parameters.
     * If season is missing but round is present, it looks up the season of the round.
     * If both parameters are missing or just the round id, the most recents are looked up
     *
     * @param req                Request where snid and rd may be present
     * @param retrieveMostRecent whether to retrieve the most  recent season and round if not present.
     * @return a RoundInfo with round id and season id filled and emtpy names.
     */
    protected RoundInfo getRoundAndSeasonIds(TCRequest req, boolean retrieveMostRecent) throws Exception {
        RoundInfo round = new RoundInfo();


        if (hasParameter("snid")) {
            round.setSeasonId(Integer.parseInt(req.getParameter("snid")));
        }

        if (hasParameter("rd")) {
            round.setRoundId(Integer.parseInt(req.getParameter("rd")));
        }

        // If season what not specified but round was specified, lookup the season id
        if (!round.hasSeasonId() && round.hasRoundId()) {
            round.setSeasonId(getSeasonForRound(round.getRoundId()));
        }

        // If either season or round were not specified, retrieve the most recent ones
        if (retrieveMostRecent && (!round.hasSeasonId() || !round.hasRoundId())) {
            getMostRecent(round);
        }

        return round;
    }

    /**
     * Retrieves the season ids.
     * If possible, it gets it from the request parameters, if not the most recent is looked up.
     *
     * @param req Request where snid may be present
     * @return a RoundInfo with season id filled and emtpy name.
     */
    protected RoundInfo getSeasonId(TCRequest req) throws Exception {
        RoundInfo round = new RoundInfo();

        if (hasParameter("snid")) {
            round.setSeasonId(Integer.parseInt(req.getParameter("snid")));
        } else {
            getMostRecent(round);
        }

        return round;
    }


    /**
     * Fills the RoundInfo object with the season and round names and the forum_id
     * The result map must contain ResultSets for queries "seasons" and "rounds_for_season"
     *
     * @param round  a Round having roundId and seasonId, and whose names will be filled
     * @param result a map that must contain ResultSets for queries "seasons" and "rounds_for_season"
     */
    protected void fillRoundAndSeasonNames(RoundInfo round, Map result) {
        fillRoundAndSeasonNames(round, result, "seasons", "rounds_for_season");
    }

    /**
     * Fills the RoundInfo object with the season and round names and the forum_id
     *
     * @param round           a Round having roundId and seasonId, and whose names will be filled
     * @param seasonQueryName name of the query that retrieves the seasons.
     * @param roundQueryName  name of the query that retrieves the rounds. If null, it won't retrieve round names
     * @param result          a map that must contain ResultSets for queries "seasons" and "rounds_for_season"
     */
    protected void fillRoundAndSeasonNames(RoundInfo round, Map result, String seasonQueryName, String roundQueryName) {
        // Look up Season Name
        if (log.isDebugEnabled()) {
            log.debug("fillRoundAndSeasonNames, season_id = " + round.getSeasonId());
        }
        String seasonName = null;
        for (Iterator it = ((ResultSetContainer) result.get(seasonQueryName)).iterator(); it.hasNext();) {
            ResultSetRow rsr = (ResultSetRow) it.next();
            if (log.isDebugEnabled()) {
                log.debug("looking season_id = " + rsr.getIntItem("season_id"));
            }
            if (round.getSeasonId() == rsr.getIntItem("season_id")) {
                seasonName = rsr.getStringItem("name");
                break;
            }
        }
        if (seasonName == null) {
            throw new IllegalArgumentException("can't find the season name for season id " + round.getSeasonId());
        }

        round.setSeasonName(seasonName);

        if (roundQueryName != null) {
            // Look up Round Name
            String roundName = null;
            int forumId = -1;
            for (Iterator it = ((ResultSetContainer) result.get(roundQueryName)).iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();
                if (round.getRoundId() == rsr.getIntItem("round_id")) {
                    roundName = rsr.getStringItem("name");

                    // if the forum_id can't be retrieved, ignore it so it will be -1
                    try {
                        forumId = rsr.getIntItem("forum_id");
                    } catch (Exception e) {
                    }
                    break;
                }
            }
            if (roundName == null) {
                throw new IllegalArgumentException("can't find the round name for round id " + round.getRoundId());
            }

            round.setForumId(forumId);
            round.setRoundName(roundName);
        }

    }

    /**
     * Sort and crop a ResultSetContainer using the ListInfo parameters.
     *
     * @param rsc ResultSetContainer to sort and crop
     * @param li  information about sorting and croping
     */
    protected void sortAndCrop(Map map, String name, ListInfo li) {
        ResultSetContainer rsc = (ResultSetContainer) map.get(name);
        rsc.sortByColumn(li.getSortColumn(), "ASC".equalsIgnoreCase(li.getSortDirection()));
        if (li.isCropped()) {
            map.put(name, rsc.subList(li.getStartRow() - 1, li.getEndRow() - 1));
        } else {
            map.put(name, rsc);
        }
    }


    /**
     * Cuts the team name so that it can be displayed with at most 15 chars.
     *
     * @param name the team name
     * @return a team name of at most 15 characters
     */
    public static String cutTeamName(String name) {
        if (name == null) {
            return "";
        }
        if (name.length() <= 15) {
            return name;
        }

        int last = name.lastIndexOf(' ', 12);

        // if there is an space and is not in the first 4 characters, cut there
        if (last > 3) {
            name = name.substring(0, last);
        } else {
            name = name.substring(0, 12);
        }

        return name + "...";
    }

}
