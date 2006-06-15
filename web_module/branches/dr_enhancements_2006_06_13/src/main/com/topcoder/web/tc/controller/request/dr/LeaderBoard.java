/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRowComparator;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;

import java.util.ArrayList;
import java.util.Arrays;
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

            long period = 0;
            if (!hasParameter(Constants.STAGE_ID)) {
                period = new Long(getCurrentPeriod(Constants.STAGE_ID)).longValue();
            } else {
                period = new Long(getRequest().getParameter(Constants.STAGE_ID)).longValue();
            }

            long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

            leaderBoardResult.add(new LeaderBoardRow(period, phase,
                    row.getLongItem("rank"),
                    row.getLongItem("user_id"), row.getStringItem("handle_lower"),
                    totalPoints, inTopThird, i <= 5, inTopThird ? totalPoints : 0,
                    i <= 5 ? placementPrize[i-1]: 0, 0));
            i++;
        }

        double prizePerPoint = 28000.0 / overallTopThirdPoints;

        tieBreak(leaderBoardResult);

        // sort

        // crop
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
//        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
//        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        // Normalizes optional parameters and sets defaults
        if ("".equals(numRecords)) {
            numRecords = String.valueOf(Constants.DEFAULT_LEADERS);
        } else if (Integer.parseInt(numRecords) > Constants.MAX_LEADERS) {
            numRecords = String.valueOf(Constants.MAX_LEADERS);
        }
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

        if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
        setDefault(DataAccessConstants.START_RANK, startRank);

        log.debug("startRank: " + startRank);
        log.debug("numRecords: " + numRecords);

        List resultBoard = new ArrayList(Integer.parseInt(numRecords));
        for (int j = 0; j < Integer.parseInt(numRecords) && j + Integer.parseInt(startRank) < leaderBoardResult.size(); j++) {
            LeaderBoardRow leaderBoardRow = (LeaderBoardRow) leaderBoardResult.get(Integer.parseInt(startRank) + j - 1);
            leaderBoardRow.setPointsPrize(leaderBoardRow.getPointsPrize() * prizePerPoint);
            leaderBoardRow.setTotalPrize(leaderBoardRow.getPointsPrize() + leaderBoardRow.getPlacementPrize());
            resultBoard.add(leaderBoardRow);
        }

        log.debug("leaderBoardResult.size(): " + leaderBoardResult.size());
        log.debug("resultBoard.size(): " + resultBoard.size());
        log.debug("topThirdAttempt: " + topThirdAttempt);
        log.debug("topThirdThreshold: " + topThirdThreshold);
        log.debug("totalPointsThreshold: " + totalPointsThreshold);
        log.debug("overallTopThirdPoints: " + overallTopThirdPoints);
        log.debug("prizePerPoint: " + prizePerPoint);

        getRequest().setAttribute("testList", resultBoard);
        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        getRequest().setAttribute("croppedDataAfter", new Boolean(leaderBoardResult.size() > Integer.parseInt(startRank) + resultBoard.size()));

        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);

    }

    private void tieBreak(List leaderBoardResult) {
        int prizes = 0;
        List coderTie = new ArrayList();
        long prevPoints = ((LeaderBoardRow)leaderBoardResult.get(0)).getPoints();
        for (int i = 1; i < leaderBoardResult.size() && prizes < 5; i++) {
            LeaderBoardRow leaderBoardRow = (LeaderBoardRow)leaderBoardResult.get(i);
            if (prevPoints == (leaderBoardRow).getPoints()) {
                log.debug("coderTie.add : " + ((LeaderBoardRow)leaderBoardResult.get(i-1)).getUserId());
                log.debug("coderTie.add : " + ((LeaderBoardRow)leaderBoardResult.get(i-1)).getUserName());
                coderTie.add((LeaderBoardRow)leaderBoardResult.get(i-1));
            } else {
                if (coderTie.size() > 0) {
                    log.debug("coderTie.add : " + ((LeaderBoardRow)leaderBoardResult.get(i-1)).getUserName());
                    coderTie.add((LeaderBoardRow)leaderBoardResult.get(i-1));
                    prizes += 1 + coderTie.size();

                    log.debug("Sorting...");
                    for (int j = 0; j < coderTie.size(); j++)
                        log.debug(String.valueOf(j) + " : " + ((LeaderBoardRow)coderTie.get(j)).getUserName());

                    Arrays.sort(coderTie.toArray(), new LeaderBoardRowComparator());

                    log.debug("Sort result...");
                    for (int j = 0; j < coderTie.size(); j++)
                        log.debug(String.valueOf(j) + ((LeaderBoardRow)coderTie.get(j)).getUserName());

                    coderTie.clear();
                }
            }
            prevPoints = leaderBoardRow.getPoints();
        }
    }
}
