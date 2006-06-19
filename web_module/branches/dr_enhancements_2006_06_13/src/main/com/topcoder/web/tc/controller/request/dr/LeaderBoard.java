/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRowComparator;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import java.util.Comparator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.TCWebException;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky
 * @version 1.0
 */
public class LeaderBoard extends BaseBoard {

    private static final int NUMBER_PLACEMENT_PRIZES = 5;

    private static final double DEVELOPMENT_POOL_PRIZE = 14000.0;

    private static final double DESIGN_POOL_PRIZE = 28000.0;

    private static final String CODER_HANDLE_COLUMN = "2";

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoard.class);

    private static final double[] designPlacementPrize = {25000.0, 10000.0, 7000.0, 3000.0, 2000.0};
    private static final double[] developmentPlacementPrize = {12500.0, 5000.0, 3500.0, 1500.0, 1000.0};

    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        ResultSetContainer stages = runQuery(Constants.DR_STAGE_COMMAND, Constants.DR_STAGE_QUERY);
        log.debug("Got " +  stages.size() + " rows for stages");
        getRequest().setAttribute(Constants.STAGE_LIST_KEY, stages);

        boolean designBoard = getRequest().getParameter(Constants.PHASE_ID).equals("112");

        log.debug("Getting Leader board coders...");
        ResultSetContainer rsc = retrieveBoardData(Constants.STAGE_ID, Constants.LEADER_BOARD_COMMAND, Constants.LEADER_BOARD_QUERY);

        List leaderBoardResult = new ArrayList(rsc.size());

        // pre-process board for the prizes
        double prizePerPoint = 0.0;
        processBoard(rsc, designBoard, leaderBoardResult, prizePerPoint);

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        boolean invert = sortDir.equals("asc");

        // break prizes ties
        if (designBoard) {
            tieBreak(leaderBoardResult, designPlacementPrize, invert);
        } else {
            tieBreak(leaderBoardResult, developmentPlacementPrize, invert);
        }

        // sort
        sortResult(leaderBoardResult, sortDir, invert);

        // crop
        List resultBoard = cropResult(leaderBoardResult, prizePerPoint);

        getRequest().setAttribute("testList", resultBoard);

        setNextPage(Constants.VIEW_LEADER_BOARD_PAGE);
        setIsNextPageInContext(true);

    }

    private void processBoard(ResultSetContainer rsc, boolean designBoard, List leaderBoardResult,
        double prizePerPoint) throws TCWebException {

        long topThirdAttempt = Math.round(Math.ceil(rsc.size() / 3.0));
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
                overallTopThirdPoints += totalPoints;
            }

            long period = 0;
            if (!hasParameter(Constants.STAGE_ID)) {
                period = new Long(getCurrentPeriod(Constants.STAGE_ID)).longValue();
            } else {
                period = new Long(getRequest().getParameter(Constants.STAGE_ID)).longValue();
            }

            long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

            leaderBoardResult.add(new LeaderBoardRow(period, phase, row
                .getLongItem("rank"), row.getLongItem("user_id"), row
                .getStringItem("handle_lower"), totalPoints, inTopThird,
                false, inTopThird ? totalPoints : 0, 0, 0));
            i++;
        }

        prizePerPoint = (designBoard ? DESIGN_POOL_PRIZE : DEVELOPMENT_POOL_PRIZE) / overallTopThirdPoints;
    }

    /**
     * @param leaderBoardResult
     * @param prizePerPoint
     * @param startRank
     * @param numRecords
     * @return
     * @throws NumberFormatException
     */
    private List cropResult(List leaderBoardResult, double prizePerPoint) throws NumberFormatException {
        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

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

        List resultBoard = new ArrayList(Integer.parseInt(numRecords));
        for (int j = 0; j < Integer.parseInt(numRecords) && j + Integer.parseInt(startRank) <= leaderBoardResult.size(); j++) {
            LeaderBoardRow leaderBoardRow = (LeaderBoardRow) leaderBoardResult.get(Integer.parseInt(startRank) + j - 1);
            leaderBoardRow.setPointsPrize(leaderBoardRow.getPointsPrize() * prizePerPoint);
            leaderBoardRow.setTotalPrize(leaderBoardRow.getPointsPrize() + leaderBoardRow.getPlacementPrize());
            resultBoard.add(leaderBoardRow);
        }

        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        getRequest().setAttribute( "croppedDataAfter", new Boolean(leaderBoardResult.size() > Integer
            .parseInt(startRank) + resultBoard.size()));

        return resultBoard;
    }

    /**
     * @param leaderBoardResult
     * @param sortDir
     * @param invert
     */
    private void sortResult(List leaderBoardResult, String sortDir, boolean invert) {
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        // all other columns are sorted already (rank)
        if (sortCol.equals(CODER_HANDLE_COLUMN)) {
            LeaderBoardRow[] sortArray = (LeaderBoardRow[]) leaderBoardResult.toArray(new LeaderBoardRow[leaderBoardResult.size()]);

            Arrays.sort(sortArray, new Comparator() {
                public int compare(Object arg0, Object arg1) {
                return ((LeaderBoardRow) arg0).getUserName().compareTo(((LeaderBoardRow) arg1).getUserName());
                }
            });

            leaderBoardResult.clear();
            if (invert) {
                for (int j = 0; j < sortArray.length; j++)
                    leaderBoardResult.add(sortArray[j]);
            } else {
                for (int j = sortArray.length - 1; j >= 0 ; j--)
                    leaderBoardResult.add(sortArray[j]);
            }
            log.debug("Sort by name - " + sortDir);
        }
    }

    private void tieBreak(List leaderBoardResult, double[] placementPrize, boolean invert) {
        LeaderBoardRow[] sortArray = (LeaderBoardRow[]) leaderBoardResult.toArray(new LeaderBoardRow[leaderBoardResult.size()]);

        LeaderBoardRowComparator lbrc = new LeaderBoardRowComparator();
        Arrays.sort(sortArray, lbrc);

        // Calculates placement prizes. Shares prize pool in case of a tie.
        int prizes = 0;
        double prizePool = placementPrize[0];
        double poolCount = 1;
        int place = 1;
        for (int j = sortArray.length - 2; prizes < NUMBER_PLACEMENT_PRIZES && j >= 0 ; j--) {
            if (lbrc.compare(sortArray[j+1], sortArray[j]) != 0){
                for (int k = 0; k < poolCount; k++) {
                    sortArray[j+k+1].setPlacementPrize(prizePool / poolCount);
                    sortArray[j+k+1].setWinTrip(true);
                }
                prizes += poolCount;
                prizePool = 0;
                poolCount = 1;
            } else {
                poolCount++;
            }
            if (place < NUMBER_PLACEMENT_PRIZES) {
                prizePool += placementPrize[place];
                place++;
            }
        }

        leaderBoardResult.clear();
        if (invert) {
            for (int j = 0; j < sortArray.length; j++)
                leaderBoardResult.add(sortArray[j]);
        } else {
            for (int j = sortArray.length - 1; j >= 0 ; j--)
                leaderBoardResult.add(sortArray[j]);
        }
    }
}
