/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

    /**
     * First processing of the board
     *
     * @param rsc         the ResultSetContainer retrieved from DB
     * @param designBoard true if its a design board (false if development)
     */
    private List processBoard(ResultSetContainer rsc, boolean designBoard) throws TCWebException {
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
            prizePerPoint = getPoolPrize(period, designBoard ? "112" : "113") / overallTopThirdPoints;
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
