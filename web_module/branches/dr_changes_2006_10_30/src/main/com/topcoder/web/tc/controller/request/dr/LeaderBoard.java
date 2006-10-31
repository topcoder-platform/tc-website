/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0.2
 */
public class LeaderBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    /**
     * The development prize pool for the top third.
     */
    private double DEVELOPMENT_POOL_PRIZE = -1;

    /**
     * The design prize pool for the top third.
     */
    private double DESIGN_POOL_PRIZE = -1;

    /**
     * The design leader placement prizes.
     */
//    private double[] designPlacementPrize = null;

    /**
     * The development leader placement prizes.
     */
//    private double[] developmentPlacementPrize = null;

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        ResultSetContainer stages = runQuery(Constants.DR_STAGE_COMMAND, Constants.DR_STAGE_QUERY);
        if (log.isDebugEnabled()) {
            log.debug("Got " + stages.size() + " rows for stages");
        }
        getRequest().setAttribute(Constants.STAGE_LIST_KEY, stages);

        boolean designBoard = getRequest().getParameter(Constants.PHASE_ID).equals("112");

        if (log.isDebugEnabled()) {
            log.debug("Getting Leader board coders...");
        }
        ResultSetContainer rsc = retrieveBoardData(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY);

        // pre-process board for the prizes
        List leaderBoardResult = processBoard(rsc, designBoard);

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        boolean invert = sortDir.equals("desc");

        // break prizes ties
        
        tieBreak(leaderBoardResult, getPlacementPrize(period, designBoard ? "112" : "113"), invert,
                "dr_leader_tie_break_placement", "dr_leader_tie_break_score", Constants.STAGE_ID);

        // sort
        sortResult(leaderBoardResult, invert);

        // crop
        List resultBoard = cropResult(leaderBoardResult);

        getRequest().setAttribute("boardList", resultBoard);
        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);

    }

    private double[] getPlacementPrize(String stageId, String phaseId) throws TCWebException {
        double[] placementArray = null;

        Request r = new Request();
        r.setContentHandle("leader_board_placement_prize");
        r.setProperty(Constants.PHASE_ID, phaseId);
        r.setProperty(Constants.STAGE_ID, stageId);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = null;
        try {
            m = dai.getData(r);

            ResultSetContainer placementPoints = (ResultSetContainer) m.get("leader_board_placement_prize");        
        
            placementArray = new double[placementPoints.size()];
            int i = 1;
            for (Iterator it = placementPoints.iterator(); it.hasNext(); i++) {
                if (((ResultSetRow) it.next()).getIntItem("place") != i) {
                    throw new TCWebException("Wrong contest_prize for stage " + stageId + " phase " + phaseId);
                }
                placementArray[i-1] = ((ResultSetRow) it.next()).getDoubleItem("prize_amount");
            }
        } catch (Exception e) {
            throw new TCWebException("Command " + "leader_board_placement_prize" + " failed.");
        }

        return placementArray;
    }

    /**
     * First processing of the board
     *
     * @param rsc         the ResultSetContainer retrieved from DB
     * @param designBoard true if its a design board (false if development)
     */
    private List processBoard(ResultSetContainer rsc, boolean designBoard) {
        long topThirdAttempt = 0;

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            if (((ResultSetRow) it.next()).getLongItem("total_points") > 0) {
                topThirdAttempt++;
            }
        }

        topThirdAttempt = Math.round(Math.ceil(topThirdAttempt / 3.0));

        long totalPoints = 0;
        long totalPointsThreshold = -1;
        long overallTopThirdPoints = 0;
        ResultSetRow row = null;
        int i = 1;
        List leaderBoardResult = new ArrayList(rsc.size());

        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            totalPoints = row.getLongItem("total_points");

            if (i == topThirdAttempt) {
                totalPointsThreshold = totalPoints;
            }
            boolean inTopThird = false;
            if (i <= topThirdAttempt || totalPoints == totalPointsThreshold) {
                inTopThird = true;
                overallTopThirdPoints += totalPoints;
            }

            long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

            leaderBoardResult.add(new LeaderBoardRow(row.getLongItem("stage_id"), phase, row
                    .getLongItem("rank"), row.getLongItem("user_id"), row
                    .getStringItem("handle_lower"), totalPoints, inTopThird,
                    false, inTopThird ? totalPoints : 0, 0, 0, row.getLongItem("outstanding_points")));
            i++;
        }

        double prizePerPoint = 0;
        if (overallTopThirdPoints > 0) {
            prizePerPoint = (designBoard ? DESIGN_POOL_PRIZE : DEVELOPMENT_POOL_PRIZE) / overallTopThirdPoints;
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
}
