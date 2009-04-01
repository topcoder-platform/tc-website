/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;

/**
 * <strong>Purpose</strong>:
 * Base implementation for the dr boards.
 *
 * @author pulky
 * @version 1.0.3
 */
public abstract class BaseBoard extends BaseProcessor {
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
     * Constants for contest.contest_type_lu
     */
    public static final int DR_TOP_PERFORMERS_CONTEST_TYPE = 18;
    public static final int DR_STAGE_CONTEST_TYPE = 19;
    public static final int DR_ROOKIE_CONTEST_TYPE = 20;
    
    /**
     * The requested period
     *
     * @since 1.0.3
     */
    protected String period = null;

    /**
     * Common parameters for board.
     */
    protected int phaseId;
    protected int projectTypeId;
    protected boolean invert;
    protected String sortCol; 
    protected int startRank;
    protected int numRecords;
    
    protected void businessProcessing() throws Exception {
        
        if (hasParameter(Constants.PHASE_ID) && !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        if (!hasParameter(Constants.PHASE_ID)) {
            if (!getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.DESIGN_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.DEVELOPMENT_PROJECT_TYPE)) &&
                    !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE))) {
                throw new TCWebException("invalid " + Constants.PROJECT_TYPE_ID + " parameter.");
            }
            
            projectTypeId = Integer.parseInt(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
            phaseId = projectTypeId + 111;
        } else {
            phaseId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));
            projectTypeId = phaseId - 111;
        }
            
        invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        
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

        
        setDefault(Constants.PHASE_ID, phaseId);
        setDefault(Constants.PROJECT_TYPE_ID, projectTypeId);
        getRequest().setAttribute("isDesign", projectTypeId == 1);
        getRequest().setAttribute("isDevelopment", projectTypeId == 2);
        getRequest().setAttribute("isAssembly", projectTypeId == 14);
        
        boardProcessing();
    }
    
    protected abstract void boardProcessing() throws Exception;
    
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
     * Crops coders list.
     *
     * @param boardResult the original board list.
     * @return the cropped list.
     */
    protected List<IBoardRow> cropResult(List<? extends IBoardRow> boardResult, int startRank, int numRecords) {
        if (boardResult.size() == 0) {
            return new ArrayList<IBoardRow>();
        }
        
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
        setDefault(DataAccessConstants.START_RANK, startRank);

        List<IBoardRow> cropped = new ArrayList<IBoardRow>(numRecords);
        for (int j = 0; j < numRecords && j + startRank <= boardResult.size(); j++)
        {
            cropped.add(boardResult.get(startRank + j - 1));
        }

        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        getRequest().setAttribute("croppedDataAfter", new Boolean(boardResult.size() > startRank + cropped.size()));

       return cropped;
    }

    /**
     * Sorts coders list.
     *
     * @param boardResult the original board list.
     * @param invert      true if the order is descending.
     * @return the sorted list.
     */
    protected void sortResult(List<? extends IBoardRow> boardResult, String sortCol, boolean invert) {
        if (boardResult.size() == 0) {
            return;
        }

        // all other columns are already sorted (rank)
        if (sortCol.equals(CODER_HANDLE_COLUMN)) {
            Collections.sort(boardResult, new Comparator<IBoardRow>() {
                public int compare(IBoardRow arg0, IBoardRow arg1) {
                    return arg0.getUserName().compareTo(arg1.getUserName());
                }
            });
        } else  if (sortCol.equals(OUTSTANDING_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator<IBoardRow>() {
                public int compare(IBoardRow arg0, IBoardRow arg1) {
                    return new Double(arg0.getPotentialPoints()).compareTo(new Double(arg1.getPotentialPoints()));
                }
            });
        } else if (sortCol.equals(TOTAL_POINTS_COLUMN)) {
            Collections.sort(boardResult, new Comparator<IBoardRow>() {
                public int compare(IBoardRow arg0, IBoardRow arg1) {
                    return new Double(arg0.getTotalPoints()).compareTo(new Double(arg1.getTotalPoints()));
                }
            });
        } else {
            // Default, sort by rank.

            Collections.sort(boardResult, new Comparator<IBoardRow>() {
                public int compare(IBoardRow arg0, IBoardRow arg1) {
                    return new Long(arg0.getRank()).compareTo(arg1.getRank());
                }
            });
        }

        if (invert) {
            Collections.reverse(boardResult);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(Integer.parseInt(CODER_HANDLE_COLUMN), "asc");
        s.addDefault(Integer.parseInt(OUTSTANDING_POINTS_COLUMN), "desc");
        s.addDefault(Integer.parseInt(TOTAL_POINTS_COLUMN), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
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
