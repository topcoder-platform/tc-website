/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.BoardRowComparator;
import com.topcoder.web.tc.model.dr.IBoardRow;

import java.util.*;

/**
 * <strong>Purpose</strong>:
 * Base implementation for the dr boards.
 *
 * @author pulky
 * @version 1.0.2
 */
public abstract class BaseBoard extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(BaseBoard.class);

    /**
     * The coder handle column
     */
    private static final String CODER_HANDLE_COLUMN = "2";

    /**
     * The outstanding points column
     */
    private static final String OUTSTANDING_POINTS_COLUMN = "6";

    /**
     * The total points column
     */
    private static final String TOTAL_POINTS_COLUMN = "7";

    /**
     * Child must implement businessProcessing.
     */
    protected void businessProcessing() throws Exception {
    }

    /**
     * private method to retrieve from DB current periods ids.
     *
     * @param period_id the period key (could be stage or season).
     * @return the current period id
     */
    protected String getCurrentPeriod(String period_id) throws TCWebException {
        ResultSetContainer currentPeriod = runQuery(Constants.CURRENT_PERIOD_COMMAND, Constants.CURRENT_PERIOD_QUERY);
        return (String.valueOf(currentPeriod.getLongItem(0, period_id)));
    }

    /**
     * Retrieves coders list for development or design for a particular period.
     *
     * @param period_id the period key (could be stage or season).
     * @param command   the command to retrieve from DB.
     * @param query     the query to retrieve from DB.
     * @return the retrieved ResultSetContainer.
     */
    protected ResultSetContainer retrieveBoardData(String period_id, String command, String query) throws Exception {
        // Phase ID is required.
        if (!hasParameter(Constants.PHASE_ID)) {
            throw new TCWebException("parameter " + period_id + " expected.");
        }

        if (!getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        setDefault(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));

        // if period is not available, get current one from DB.
        String period = null;
        if (!hasParameter(period_id)) {
            period = getCurrentPeriod(period_id);
        } else {
            period = getRequest().getParameter(period_id);
        }
        setDefault(period_id, period);

        // Prepare request for data retrieval
        Request r = new Request();
        r.setProperty(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
        r.setProperty(period_id, period);
        r.setContentHandle(command);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer board = (ResultSetContainer) m.get(query);
        if (log.isDebugEnabled()) {
            log.debug("Got " + board.size() + " rows for board");
        }

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.TYPE_KEY,
                (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ?
                        HandleTag.DEVELOPMENT : HandleTag.DESIGN));

        return board;
    }

    /**
     * Crops coders list.
     *
     * @param boardResult the original board list.
     * @return the cropped list.
     */
    protected List cropResult(List boardResult) {
        if (boardResult.size() == 0) {
            return boardResult;
        }

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
        for (int j = 0; j < Integer.parseInt(numRecords) && j + Integer.parseInt(startRank) <= boardResult.size(); j++)
        {
            Object rookieBoardRow = boardResult.get(Integer.parseInt(startRank) + j - 1);
            resultBoard.add(rookieBoardRow);
        }

        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        getRequest().setAttribute("croppedDataAfter", new Boolean(boardResult.size() > Integer
                .parseInt(startRank) + resultBoard.size()));

        return resultBoard;
    }

    /**
     * Sorts coders list.
     *
     * @param boardResult the original board list.
     * @param invert      true if the order is descending.
     * @return the sorted list.
     */
    protected void sortResult(List boardResult, boolean invert) {
        if (boardResult.size() == 0) {
            return;
        }

        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        // all other columns are already sorted (rank)
        if (sortCol.equals(CODER_HANDLE_COLUMN)) {
            Collections.sort(boardResult, new Comparator() {
                public int compare(Object arg0, Object arg1) {
                    return ((IBoardRow) arg0).getUserName().compareTo(((IBoardRow) arg1).getUserName());
                }
            });
            if (invert) {
                Collections.reverse(boardResult);
            }
        }
        if (sortCol.equals(OUTSTANDING_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator() {
                public int compare(Object arg0, Object arg1) {
                    return new Long(((IBoardRow) arg0).getOutstandingPoints()).compareTo(new Long(((IBoardRow) arg1).getOutstandingPoints()));
                }
            });
            if (invert) {
                Collections.reverse(boardResult);
            }
        }
        if (sortCol.equals(TOTAL_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator() {
                public int compare(Object arg0, Object arg1) {
                    return new Long(((IBoardRow) arg0).getTotalPoints()).compareTo(new Long(((IBoardRow) arg1).getTotalPoints()));
                }
            });
            if (invert) {
                Collections.reverse(boardResult);
            }
        }
    }

    /**
     * Breaks coders ties.
     *
     * @param boardResult      the original board list.
     * @param placementPrize   array with the placement prizes.
     * @param invert           true if the order is descending.
     * @param placementCommand the placement command to retrieve from db.
     * @param scoreCommand     the score command to retrieve from db.
     * @param periodKey        the period key (could be stage or season).
     */
    protected void tieBreak(List boardResult, double[] placementPrize,
                            boolean invert, String placementCommand, String scoreCommand, String periodKey) {

        if (boardResult.size() == 0) {
            return;
        }

        IBoardRow[] sortArray = (IBoardRow[]) boardResult.toArray(new IBoardRow[boardResult.size()]);

        BoardRowComparator brc = new BoardRowComparator(placementCommand, scoreCommand, periodKey);
        Arrays.sort(sortArray, brc);

        // Calculates placement prizes. Shares prize pool in case of a tie.
        int numberPlacementPrizes = placementPrize.length;
        int prizes = 0;
        double prizePool = placementPrize[0];
        double poolCount = 1;
        int place = 1;
        for (int j = sortArray.length - 2; prizes < numberPlacementPrizes && j >= 0; j--) {
            if (sortArray[j + 1].getPoints() > 0) {
                if (brc.compare(sortArray[j + 1], sortArray[j]) != 0) {
                    for (int k = 0; k < poolCount; k++) {
                        sortArray[j + k + 1].setPlacementPrize(prizePool / poolCount);
                    }
                    prizes += poolCount;
                    prizePool = 0;
                    poolCount = 1;
                } else {
                    poolCount++;
                }
                if (place < numberPlacementPrizes) {
                    prizePool += placementPrize[place];
                    place++;
                }
            }
        }
        if (prizes < numberPlacementPrizes) {
            for (int k = 0; k < poolCount; k++) {
                if (sortArray[k].getPoints() > 0) {
                    sortArray[k].setPlacementPrize(prizePool / poolCount);
                }
            }
        }
        boardResult.clear();
        if (invert) {
            for (int j = 0; j < sortArray.length; j++)
                boardResult.add(sortArray[j]);
        } else {
            for (int j = sortArray.length - 1; j >= 0; j--)
                boardResult.add(sortArray[j]);
        }
    }

    /**
     * Helper method to run a simple query
     *
     * @param command the command to retrieve.
     * @param query   the query to retrieve.
     * @return the retrieved ResultSetContainer.
     */
    protected ResultSetContainer runQuery(String command, String query) throws TCWebException {
        Request r = new Request();
        r.setContentHandle(command);
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = null;
        try {
            m = dai.getData(r);
        } catch (Exception e) {
            throw new TCWebException("Command " + command + " failed.");
        }
        return (ResultSetContainer) m.get(query);
    }
}
