/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.dr;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve dr leader board.
 *
 * @author pulky, cucu
 * @version 1.0.3
 */
public class ViewLeaderBoard extends BaseProcessor {

   private static final String CODER_HANDLE_COLUMN = "2";
   private static final String OUTSTANDING_POINTS_COLUMN = "6";
   private static final String TOTAL_POINTS_COLUMN = "7";
   

    protected void businessProcessing() throws Exception {
        int trackId = -1; 

        if (hasParameter(Constants.TRACK_ID)) {
            trackId = Integer.parseInt(getRequest().getParameter(Constants.TRACK_ID));
        }
            
        if (trackId < 0) {
            trackId = getCurrentTrack(1);  // design type
        }
        
        int startRank;
        int numRecords;

        boolean invert = "desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

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
        
        // Get track details from database
        TrackInfo trackInfo = getTrackDetails(trackId);            
        getRequest().setAttribute("trackInfo", trackInfo);

        ResultSetContainer tracks = getTrackList(trackInfo.getTrackTypeId());
        getRequest().setAttribute("tracks", tracks);

        // Get the results from database
        List<LeaderBoardRow> results = getTrackResults(trackId);
            
        // Sort and crop the list
        sortResult(results, sortCol, invert);
        List<IBoardRow> cropped = cropResult(results, startRank, numRecords);
        
        getRequest().setAttribute("hasRookieCompetition", Boolean.FALSE);
        getRequest().setAttribute("results", cropped);
        getRequest().setAttribute("topTripWinners", 1);
        getRequest().setAttribute("trackExists", true);            

        getRequest().setAttribute("isDesign", trackInfo.getTrackTypeId() == 1);
        getRequest().setAttribute("isDevelopment", trackInfo.getTrackTypeId() == 2);

        getRequest().setAttribute(Constants.TRACK_ID, trackId);
        setDefault(Constants.TRACK_ID, trackId);

        setNextPage("/dr/drv2_view_leaders.jsp");
        setIsNextPageInContext(true);        
    }


    private int getCurrentTrack(int trackTypeId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_current_track");
        r.setProperty(Constants.TRACK_TYPE_ID, String.valueOf(trackTypeId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = null;
        try {
            m = dai.getData(r);
        } catch (Exception e) {
            throw new TCWebException("Command dr_current_track failed.");
        }
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_current_track");
        if (rsc.size() != 1) {
            throw new TCWebException("Command dr_current_track failed.");
        }
        
        return rsc.getIntItem(0, "track_id"); 
    }


    private ResultSetContainer getTrackList(int trackTypeId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_track_list");
        r.setProperty(Constants.TRACK_TYPE_ID, String.valueOf(trackTypeId));
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = null;
        try {
            m = dai.getData(r);
        } catch (Exception e) {
            throw new TCWebException("Command dr_track_list failed.");
        }
        return (ResultSetContainer) m.get("dr_track_list");
    }


    /**
     * @param trackId
     * @return
     * @throws Exception
     */
    private List<LeaderBoardRow> getTrackResults(int trackId) throws Exception {
        Request r = new Request();
        r.setContentHandle("drv2_results");
        r.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("drv2_results");
            
        // Put the results in a list
        List<LeaderBoardRow> results = new ArrayList<LeaderBoardRow>();
        for (ResultSetContainer.ResultSetRow row : rsc) {
            LeaderBoardRow lbr = new LeaderBoardRow(trackId, 1, row.getIntItem("current_place"), row.getLongItem("coder_id"),
                 row.getStringItem("handle"),
                 row.getDoubleItem("final_points"), row.getDoubleItem("potential_points"), 
                 row.getStringItem("current_top_performer_prize") == null? 0.0 : row.getDoubleItem("current_top_performer_prize"),
                 row.getStringItem("current_top_n_prize") == null? 0.0 : row.getDoubleItem("current_top_n_prize"),
                 hasWonTrip(row.getIntItem("current_place"), 1));
            
            results.add(lbr);
            
        }
        return results;
    }


    /**
     * @param trackId
     * @throws Exception
     */
    private TrackInfo getTrackDetails(int trackId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_track_details");
        r.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_track_details");
        
        TrackInfo ti = new TrackInfo();
        if (rsc.size() > 0) {
            ResultSetRow row  = rsc.get(0);
            ti.setTrackTypeId(row.getIntItem("track_type_id"));
            ti.setTrackTypeDesc(row.getStringItem("track_type_desc"));
            ti.setTrackStatusId(row.getIntItem("track_status_id"));
            ti.setTrackStatusDesc(row.getStringItem("track_status_desc"));
            ti.setTrackDesc(row.getStringItem("track_desc"));
            ti.setTrackStartDate(row.getTimestampItem("track_start_date"));
            ti.setTrackEndDate(row.getTimestampItem("track_end_date"));
        }
        return ti;
    }
    
    
    private String numToLetters(int i) {
        switch (i) {
        case 1:
            return "One";
        case 2:
            return "Two";
        case 3:
            return "Three";
        case 4:
            return "Four";
        case 5:
            return "Five";
        case 6:
            return "Six";
        case 7:
            return "Seven";
        case 8:
            return "Eight";
        case 9:
            return "Nine";
        case 10:
            return "Ten";
        default:
            return String.valueOf(i);
        }
    }


    /**
     * Checks if the coder has win a trip
     * 
     * @param rank
     * @param topTripWinners
     * @return true if the winner won a trip
     */
    private boolean hasWonTrip(int rank, int topTripWinners) {
        return rank <= topTripWinners;
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

    public class TrackInfo {
        int trackId;
        int trackTypeId;
        String trackTypeDesc;
        int trackStatusId;
        String trackStatusDesc;
        String trackDesc;
        Timestamp trackStartDate;
        Timestamp trackEndDate;
        /**
         * @return the trackId
         */
        public int getTrackId() {
            return trackId;
        }
        /**
         * @param trackId the trackId to set
         */
        public void setTrackId(int trackId) {
            this.trackId = trackId;
        }
        /**
         * @return the trackStatusId
         */
        public int getTrackStatusId() {
            return trackStatusId;
        }
        /**
         * @param trackStatusId the trackStatusId to set
         */
        public void setTrackStatusId(int trackStatusId) {
            this.trackStatusId = trackStatusId;
        }
        /**
         * @return the trackStatusDesc
         */
        public String getTrackStatusDesc() {
            return trackStatusDesc;
        }
        /**
         * @param trackStatusDesc the trackStatusDesc to set
         */
        public void setTrackStatusDesc(String trackStatusDesc) {
            this.trackStatusDesc = trackStatusDesc;
        }
        /**
         * @return the trackDesc
         */
        public String getTrackDesc() {
            return trackDesc;
        }
        /**
         * @param trackDesc the trackDesc to set
         */
        public void setTrackDesc(String trackDesc) {
            this.trackDesc = trackDesc;
        }
        /**
         * @return the trackStartDate
         */
        public Timestamp getTrackStartDate() {
            return trackStartDate;
        }
        /**
         * @param trackStartDate the trackStartDate to set
         */
        public void setTrackStartDate(Timestamp trackStartDate) {
            this.trackStartDate = trackStartDate;
        }
        /**
         * @return the trackEndDate
         */
        public Timestamp getTrackEndDate() {
            return trackEndDate;
        }
        /**
         * @param trackEndDate the trackEndDate to set
         */
        public void setTrackEndDate(Timestamp trackEndDate) {
            this.trackEndDate = trackEndDate;
        }
        /**
         * @return the trackTypeId
         */
        public int getTrackTypeId() {
            return trackTypeId;
        }
        /**
         * @param trackTypeId the trackTypeId to set
         */
        public void setTrackTypeId(int trackTypeId) {
            this.trackTypeId = trackTypeId;
        }
        /**
         * @return the trackTypeDesc
         */
        public String getTrackTypeDesc() {
            return trackTypeDesc;
        }
        /**
         * @param trackTypeDesc the trackTypeDesc to set
         */
        public void setTrackTypeDesc(String trackTypeDesc) {
            this.trackTypeDesc = trackTypeDesc;
        }
    }
}
