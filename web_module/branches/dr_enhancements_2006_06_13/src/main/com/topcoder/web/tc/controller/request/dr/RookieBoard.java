/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.RookieBoardRow;
import com.topcoder.web.tc.model.dr.RookieBoardRowComparator;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import java.util.Comparator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr rookie board.
 *
 * @author pulky
 * @version 1.0
 */
public class RookieBoard extends BaseBoard {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(RookieBoard.class);

    private static final int NUMBER_PLACEMENT_PRIZES = 10;

    private static final String CODER_HANDLE_COLUMN = "2";

    private static final double[] designPlacementPrize = {10000.0, 7500.0, 5000.0, 2500.0, 1500.0, 1250.0, 750.0, 500.0, 500.0, 500.0};
    private static final double[] developmentPlacementPrize = {7500.0, 5000.0, 3000.0, 1500.0, 900.0, 750.0, 450.0, 300.0, 300.0, 300.0};


    /**
     * Process the dr rookie board request.
     * Retrieves rookie list for development or design for a particular season.
     */
    protected void businessProcessing() throws Exception {
        // Prepare request for data retrieval
        ResultSetContainer seasons = runQuery(Constants.DR_SEASON_COMMAND, Constants.DR_SEASON_QUERY);
        log.debug("Got " +  seasons.size() + " rows for seasons");
        getRequest().setAttribute(Constants.SEASON_LIST_KEY, seasons);

        log.debug("Getting rookie board coders...");
        ResultSetContainer rsc = retrieveBoardData(Constants.SEASON_ID, Constants.ROOKIE_BOARD_COMMAND, Constants.ROOKIE_BOARD_QUERY);

        long phase = new Long(getRequest().getParameter(Constants.PHASE_ID)).longValue();

        List rookieBoardResult = new ArrayList(rsc.size());
        ResultSetRow row = null;
        boolean firstRow = true;
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            row = (ResultSetRow) it.next();
            rookieBoardResult.add(new RookieBoardRow(row.getLongItem("season_id"), phase, row.getLongItem("rank"),
                    row.getLongItem("user_id"), row.getStringItem("handle_lower"),
                    row.getLongItem("total_points"),
                    firstRow, 0));
            firstRow = false;
        }

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        boolean invert = sortDir.equals("asc");

        // break prizes ties
        if (phase == 112) {
            tieBreak(rookieBoardResult, designPlacementPrize, invert);
        } else {
            tieBreak(rookieBoardResult, developmentPlacementPrize, invert);
        }

        // sort
        sortResult(rookieBoardResult, sortDir, invert);

        // crop
        List resultBoard = cropResult(rookieBoardResult);

        getRequest().setAttribute("testList", resultBoard);

        setNextPage(Constants.VIEW_ROOKIE_BOARD_PAGE);
        setIsNextPageInContext(true);

    }

    /**
     * @param rookieBoardResult
     * @param prizePerPoint
     * @param startRank
     * @param numRecords
     * @return
     * @throws NumberFormatException
     */
    private List cropResult(List rookieBoardResult) throws NumberFormatException {
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
        for (int j = 0; j < Integer.parseInt(numRecords) && j + Integer.parseInt(startRank) <= rookieBoardResult.size(); j++) {
            RookieBoardRow rookieBoardRow = (RookieBoardRow) rookieBoardResult.get(Integer.parseInt(startRank) + j - 1);
            resultBoard.add(rookieBoardRow);
        }

        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        getRequest().setAttribute( "croppedDataAfter", new Boolean(rookieBoardResult.size() > Integer
            .parseInt(startRank) + resultBoard.size()));

        return resultBoard;
    }

    /**
     * @param rookieBoardResult
     * @param sortDir
     * @param invert
     */
    private void sortResult(List rookieBoardResult, String sortDir, boolean invert) {
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        // all other columns are sorted already (rank)
        if (sortCol.equals(CODER_HANDLE_COLUMN)) {
            RookieBoardRow[] sortArray = (RookieBoardRow[]) rookieBoardResult.toArray(new RookieBoardRow[rookieBoardResult.size()]);

            Arrays.sort(sortArray, new Comparator() {
                public int compare(Object arg0, Object arg1) {
                return ((RookieBoardRow) arg0).getUserName().compareTo(((RookieBoardRow) arg1).getUserName());
                }
            });

            rookieBoardResult.clear();
            if (invert) {
                for (int j = 0; j < sortArray.length; j++)
                    rookieBoardResult.add(sortArray[j]);
            } else {
                for (int j = sortArray.length - 1; j >= 0 ; j--)
                    rookieBoardResult.add(sortArray[j]);
            }
            log.debug("Sort by name - " + sortDir);
        }
    }

    private void tieBreak(List rookieBoardResult, double[] placementPrize, boolean invert) {
        RookieBoardRow[] sortArray = (RookieBoardRow[]) rookieBoardResult.toArray(new RookieBoardRow[rookieBoardResult.size()]);

        RookieBoardRowComparator lbrc = new RookieBoardRowComparator();
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

        rookieBoardResult.clear();
        if (invert) {
            for (int j = 0; j < sortArray.length; j++)
                rookieBoardResult.add(sortArray[j]);
        } else {
            for (int j = sortArray.length - 1; j >= 0 ; j--)
                rookieBoardResult.add(sortArray[j]);
        }
    }
}
