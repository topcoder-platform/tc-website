/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0.3
 */
public class LeaderBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    protected void leaderBoard2007dot5() throws Exception {
        if (!getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        // Stage list for combo box
        ResultSetContainer stages = runQuery(Constants.DR_STAGE_COMMAND, Constants.DR_STAGE_QUERY);
        getRequest().setAttribute("stages", stages);

        int stageId = Integer.parseInt(hasParameter(Constants.STAGE_ID) ? getRequest().getParameter(Constants.STAGE_ID) : getCurrentPeriod(Constants.STAGE_ID));
        setDefault(Constants.STAGE_ID, stageId);

        int phase = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));
        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        
        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
        int startRank;
        int numRecords;
        
        if ("".equals(numRecordsStr)) {
            numRecords = Constants.DEFAULT_LEADERS;
        } else {
            numRecords = Integer.parseInt(numRecordsStr); 

            if (numRecords > Constants.MAX_LEADERS) {
                numRecords = Constants.MAX_LEADERS;
            }
        }

        if ("".equals(startRankStr) || Integer.parseInt(startRankStr) <= 0) {
            startRank = 1;
        } else {
            startRank = Integer.parseInt(startRankStr);
        }

        
        Request r = new Request();
        r.setContentHandle("dr_results");
        r.setProperty("ct", "252"); // fix!
        r.setProperty("tpct", "254"); // fix!
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME); // change to cached
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_results");
        
        List<LeaderBoardRow> results = new ArrayList<LeaderBoardRow>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            LeaderBoardRow lbr = new LeaderBoardRow(stageId, phase, row.getIntItem("current_place"), row.getLongItem("coder_id"),row.getStringItem("handle"),
                     row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                     row.getStringItem("current_top_performer_prize") == null? 0.0 : row.getDoubleItem("current_top_performer_prize"),
                     row.getStringItem("current_top_n_prize") == null? 0.0 : row.getDoubleItem("current_top_n_prize"));
            
            results.add(lbr);
            
        }
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        boolean hasRookie = false;
        for (ResultSetContainer.ResultSetRow row : stages) {
            if (row.getIntItem("stage_id") == stageId) {
                hasRookie = row.getIntItem("rookie_competition_ind") == 1;
            }
        }
        
        getRequest().setAttribute("hasRookieCompetition", hasRookie);
        getRequest().setAttribute("results", cropped);
        getRequest().setAttribute("isDesign", phase == 112);
        getRequest().setAttribute("isDevelopment", phase == 113);
        setNextPage("/dr/view_leaders_20075.jsp");
        setIsNextPageInContext(true);
        
    }
    
    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        

        leaderBoard2007dot5();
if (!"1".equals(getRequest().getParameter("force20075"))) return;
        
            
        boolean designBoard = getRequest().getParameter(Constants.PHASE_ID).equals("112");

        if (log.isDebugEnabled()) {
            log.debug("Getting Leader board coders...");
        }
        ResultSetContainer rsc = retrieveBoardData(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY);

        // pre-process board for the prizes
        List leaderBoardResult = processBoard(rsc, designBoard, getTopPerformersFactor(period, designBoard ? "112" : "113"));

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        boolean invert = sortDir.equals("desc");

        // break prizes ties
        tieBreak(leaderBoardResult, getPlacementPrize(period, designBoard ? "112" : "113"), invert,
                "dr_leader_tie_break_placement", "dr_leader_tie_break_score", Constants.STAGE_ID);

        // sort
 //       String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
 
        // crop
//        List resultBoard = cropResult(leaderBoardResult);

        //getRequest().setAttribute("boardList", resultBoard);
        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);

    }

    /**
     * Gets the top X prize factor.
     * <p/>
     * Top Third: 3.0
     * Top Half: 2.0
     *
     * @param rsc         the ResultSetContainer retrieved from DB
     * @param designBoard true if its a design board (false if development)
     */
    private double getTopPerformersFactor(String stageId, String phaseId) throws TCWebException {
        double topPerformersFactor = 3.0;

        Request r = new Request();
        r.setContentHandle("dr_stage_top_performers_factor");
        r.setProperty(Constants.PHASE_ID, phaseId);
        r.setProperty(Constants.STAGE_ID, stageId);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = null;
        try {
            m = dai.getData(r);

            ResultSetContainer rscTopFactor = (ResultSetContainer) m.get("dr_stage_top_performers_factor");

            if (rscTopFactor.size() != 1) {
                throw new TCWebException("Could not find top prize factor for the leader board.");
            }
            topPerformersFactor = rscTopFactor.getDoubleItem(0, "top_performers_factor");
        } catch (Exception e) {
            throw new TCWebException("Command " + "dr_stage_top_performers_factor" + " failed.", e);
        }

        return topPerformersFactor;
    }

    /**
     * First processing of the board
     *
     * @param rsc                 the ResultSetContainer retrieved from DB
     * @param designBoard         true if its a design board (false if development)
     * @param topPerformersFactor the part of the board that will recieve top X prize.
     */
    private List processBoard(ResultSetContainer rsc, boolean designBoard, double topPerformersFactor) throws TCWebException {
        long topBoardAttempt = 0;

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            if (((ResultSetRow) it.next()).getLongItem("total_points") > 0) {
                topBoardAttempt++;
            }
        }

        topBoardAttempt = Math.round(Math.ceil(topBoardAttempt / topPerformersFactor));

        long totalPoints = 0;
        long totalPointsThreshold = -1;
        long overallTopBoardPoints = 0;
        ResultSetRow row = null;
        int i = 1;
        List leaderBoardResult = new ArrayList(rsc.size());

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            totalPoints = row.getLongItem("total_points");

            if (i == topBoardAttempt) {
                totalPointsThreshold = totalPoints;
            }
            boolean inTopBoard = false;
            if (i <= topBoardAttempt || totalPoints == totalPointsThreshold) {
                inTopBoard = true;
                overallTopBoardPoints += totalPoints;
            }

            long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();
/*
            leaderBoardResult.add(new LeaderBoardRow(row.getLongItem("stage_id"), phase, row
                    .getLongItem("rank"), row.getLongItem("user_id"), row
                    .getStringItem("handle_lower"), totalPoints, inTopBoard,
                    false, inTopBoard ? totalPoints : 0, 0, 0, row.getLongItem("outstanding_points")));
  */          i++;
        }

        double prizePerPoint = 0;
        if (overallTopBoardPoints > 0) {
            prizePerPoint = getPoolPrize(period, designBoard ? "112" : "113") / overallTopBoardPoints;
        }
        if (log.isDebugEnabled()) {
            log.debug("prizePerPoint: " + prizePerPoint);
        }

        for (int j = 0; j < leaderBoardResult.size(); j++) {
            LeaderBoardRow leaderBoardRow = (LeaderBoardRow) leaderBoardResult.get(j);
            leaderBoardRow.setPointsPrize(leaderBoardRow.getPointsPrize() * prizePerPoint);
        }
        return leaderBoardResult;
    }


    /**
     * Queries pool prize for leader board
     * Retrieves the value of the pool prize for a particualr stage and phase
     *
     * @since 1.0.3
     */
    private double getPoolPrize(String stageId, String phaseId) throws TCWebException {
        return getPlacementPrize("leader_board_pool_prize", Constants.STAGE_ID, stageId, phaseId)[0];
    }

    /**
     * Queries placement points for the leader board
     * Retrieves an array of the placement points for a particular stage and phase
     *
     * @since 1.0.3
     */
    private double[] getPlacementPrize(String stageId, String phaseId) throws TCWebException {
        return getPlacementPrize("leader_board_placement_prize", Constants.STAGE_ID, stageId, phaseId);
    }
}
