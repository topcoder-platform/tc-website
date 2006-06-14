/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0
 */
public class LeaderBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    private static final double[] placementPrize = {25000.0, 10000.0, 7000.0, 3000.0, 2000.0};

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        Request r = new Request();
        r.setContentHandle(Constants.DR_STAGE_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer stages = (ResultSetContainer)m.get(Constants.DR_STAGE_QUERY);
        log.debug("Got " +  stages.size() + " rows for stages");
        getRequest().setAttribute(Constants.STAGE_LIST_KEY, stages);

        log.debug("Getting Leader board coders...");
        ResultSetContainer rsc = retrieveBoardData(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY);

        List leaderBoardResult = new ArrayList(rsc.size());

        long topThirdAttempt = Math.round(Math.ceil(rsc.size() / 3.0));
        long topThirdThreshold = topThirdAttempt;
        long totalPoints = 0;
        long totalPointsThreshold = -1;
        long overallTopThirdPoints = 0;
        ResultSetRow row = null;
        int i = 1;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            totalPoints = row.getLongItem("total_points");

            if (i == topThirdAttempt) {
                totalPointsThreshold = totalPoints;
            }
            boolean inTopThird = false;
            if (i <= topThirdAttempt || totalPoints == totalPointsThreshold) {
                inTopThird = true;
                topThirdThreshold = i;
                overallTopThirdPoints += totalPoints;
            }

            leaderBoardResult.add(new LeaderBoardRow(row.getLongItem("rank"),
                    row.getLongItem("user_id"),
                    totalPoints,
                    inTopThird, i <= 5, inTopThird ? totalPoints : 0,
                    i <= 5 ? placementPrize[i-1]: 0, 0));
            i++;
        }

        double prizePerPoint = 28000 / overallTopThirdPoints;

        for (int j = 0; j < leaderBoardResult.size(); j++) {
            LeaderBoardRow leaderBoardRow = (LeaderBoardRow) leaderBoardResult.get(j);
            leaderBoardRow.setPointsPrize(leaderBoardRow.getPointsPrize() * prizePerPoint);
            leaderBoardRow.setTotalPrize(leaderBoardRow.getPointsPrize() + leaderBoardRow.getPlacementPrize());
        }

        log.debug("leaderBoardResult.size(): " + leaderBoardResult.size());
        log.debug("topThirdAttempt: " + topThirdAttempt);
        log.debug("topThirdThreshold: " + topThirdThreshold);
        log.debug("totalPointsThreshold: " + totalPointsThreshold);
        log.debug("overallTopThirdPoints: " + overallTopThirdPoints);
        log.debug("prizePerPoint: " + prizePerPoint);

        getRequest().setAttribute("testList", leaderBoardResult);
        getRequest().setAttribute("croppedDataBefore", new Boolean(false));
        getRequest().setAttribute("croppedDataAfter", new Boolean(true));

        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);

    }
}
