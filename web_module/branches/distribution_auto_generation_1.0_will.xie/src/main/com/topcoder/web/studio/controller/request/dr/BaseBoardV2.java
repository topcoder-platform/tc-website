/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.dr;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.studio.Constants;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Jul 16, 2008
 */
public abstract class BaseBoardV2 extends BaseProcessor {

    protected ResultSetContainer getPointsData(String datasource, String query, int trackId, int userId, boolean potential) throws Exception {
        CachedDataAccess cda = new CachedDataAccess(MaxAge.HALF_HOUR, datasource);
        Request dataRequest = new Request();
        dataRequest.setContentHandle(query);
        dataRequest.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        dataRequest.setProperty(Constants.CODER_ID, String.valueOf(userId));
        dataRequest.setProperty(Constants.POTENTIAL_FLAG_ID, potential ? "t" : "f");
        Map<String, ResultSetContainer> map = cda.getData(dataRequest);
        ResultSetContainer rsc = map.get(query);
        return rsc;
    }

    protected Object getConcurrentTrack(int trackId, int trackTypeId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_concurrent_track");
        r.setProperty(Constants.TRACK_TYPE_ID, String.valueOf((trackTypeId == 1) ? 2 : 1));
        r.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME); 
        Map m = null;
        try {
            m = dai.getData(r);
        } catch (Exception e) {
            throw new TCWebException("Command dr_concurrent_track failed.");
        }
        ResultSetContainer rsc = (ResultSetContainer) m.get("dr_concurrent_track");
        if (rsc.size() != 1) {
            throw new TCWebException("Command dr_concurrent_track failed.");
        }
        
        return rsc.getIntItem(0, "track_id"); 
    }


    protected int getCurrentTrack(int trackTypeId) throws Exception {
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


    protected ResultSetContainer getTrackList(int trackTypeId) throws Exception {
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
    protected LeaderBoardResult getTrackResults(int trackId) throws Exception {
        Double totalPoints = 0d;
        Double totalTopFivePrize = 0d;
        Double totalTopPerformerPrize = 0d;
        Double totalPrizes = 0d;

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
                 row.getIntItem("has_won_trip") == 1);
            
            results.add(lbr);
            
            totalPoints += lbr.getPoints();
            totalTopFivePrize += lbr.getPlacementPrize();
            totalTopPerformerPrize += lbr.getPointsPrize();
            totalPrizes += lbr.getTotalPrize();
        }

        return new LeaderBoardResult(results, totalPoints, totalTopFivePrize, totalTopPerformerPrize, totalPrizes);
    }


    /**
     * @param trackId
     * @throws Exception
     */
    protected TrackInfo getTrackDetails(int trackId) throws Exception {
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
    
    protected String numToLetters(int i) {
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
    
    public class LeaderBoardRow {


        /**
         * Property containing the project type
         */
        protected long projectTypeId;

        /**
         * Property containing the period
         */
        protected long period;

        /**
         * Property containing the rank
         */
        protected long rank;

        /**
         * Property containing the userId
         */
        protected long userId;

        /**
         * DProperty containing the userName
         */
        protected String userName;

        /**
         * Property containing the points
         */
        protected double points;

        /**
         * Property containing the placementPrize
         */
        protected double placementPrize;

        /**
         * Property to store the outstanding points
         */
        protected double potentialPoints;

        /**
         * Property containing the winTrip flag
         */
        protected boolean winTrip;

        /**
         * @return Returns the period.
         */
        public long getPeriod() {
            return period;
        }

        /**
         * @param period The period to set.
         */
        public void setPeriod(long period) {
            this.period = period;
        }

        /**
         * @return Returns the project type.
         */
        public long getProjectTypeId() {
            return projectTypeId;
        }

        /**
         * @param project type The project type to set.
         */
        public void setProjectTypeId(long projectTypeId) {
            this.projectTypeId = projectTypeId;
        }

        /**
         * @return Returns the userName.
         */
        public String getUserName() {
            return userName;
        }

        /**
         * @param userName The userName to set.
         */
        public void setUserName(String userName) {
            this.userName = userName;
        }

        /**
         * @return Returns the placementPrize.
         */
        public double getPlacementPrize() {
            return placementPrize;
        }

        /**
         * @param placementPrize The placementPrize to set.
         */
        public void setPlacementPrize(double placementPrize) {
            this.placementPrize = placementPrize;
        }

        /**
         * @return Returns the points.
         */
        public double getPoints() {
            return points;
        }

        /**
         * @param points The points to set.
         */
        public void setPoints(double points) {
            this.points = points;
        }

        /**
         * @return Returns the rank.
         */
        public long getRank() {
            return rank;
        }

        /**
         * @param rank The rank to set.
         */
        public void setRank(long rank) {
            this.rank = rank;
        }

        /**
         * @return Returns the userId.
         */
        public long getUserId() {
            return userId;
        }

        /**
         * @param userId The userId to set.
         */
        public void setUserId(long userId) {
            this.userId = userId;
        }

        /**
         * @return Returns the outstandingPoints.
         */
        public double getPotentialPoints() {
            return potentialPoints;
        }

        /**
         * @param outstandingPoints The outstandingPoints to set.
         */
        public void setPotentialPoints(double potentialPoints) {
            this.potentialPoints = potentialPoints;
        }

        /**
         * @return Returns the total points.
         */
        public double getTotalPoints() {
            return this.points + this.potentialPoints;
        }

        /**
         * @return true winTrip flag
         */
        public boolean isWinTrip() {
            return winTrip;
        }

        /**
         * @param winTrip true if the coder will win a trip.
         */
        public boolean setWinTrip(boolean winTrip) {
            return winTrip;
        }

        /**
         * Property to store the points prize
         */
        private double pointsPrize;

        /**
         * Default constructor
         */
        public LeaderBoardRow() {
            super();
        }

        /**
         * Constructor setting properties.
         *
         * @param period         The period to set.
         * @param projectTypeId          The project type to set.
         * @param rank           The rank to set.
         * @param userId         The userId to set.
         * @param userName       The userName to set.
         * @param points         The points to set.
         * @param topPerformer   The topPerformer to set.
         * @param winTrip        The winTrip to set.
         * @param pointsPrize    The pointsPrize to set.
         * @param placementPrize The placementPrize to set.
         * @param totalPrize     The totalPrize to set.
         * @param outstandingPoints     The outstandingPoints to set.
         * @param winTrip        The winTrip flag to set.
         */
        public LeaderBoardRow(long period, long projectTypeId, long rank, long userId, String userName, double points, double potentialPoints,
                              double pointsPrize, double placementPrize, boolean winTrip) {
            super();
            this.period = period;
            this.projectTypeId = projectTypeId;
            this.rank = rank;
            this.userId = userId;
            this.userName = userName;
            this.points = points;
            this.pointsPrize = pointsPrize;
            this.placementPrize = placementPrize;
            this.potentialPoints = potentialPoints;
            this.winTrip = winTrip;
        }

        /**
         * @return Returns the pointsPrize.
         */
        public double getPointsPrize() {
            return pointsPrize;
        }

        /**
         * @param pointsPrize The pointsPrize to set.
         */
        public void setPointsPrize(double pointsPrize) {
            this.pointsPrize = pointsPrize;
        }

        /**
         * @return Returns the topPerformer.
         */
        public boolean isTopPerformer() {
            return pointsPrize > 0;
        }

        /**
         * @return Returns the totalPrize.
         */
        public double getTotalPrize() {        
            return placementPrize + pointsPrize;
        }

    }

    public class LeaderBoardResult {

        List<LeaderBoardRow> results;
        Double totalPoints;
        Double totalTopFivePrize;
        Double totalTopPerformerPrize;
        Double totalPrizes;

        
        public LeaderBoardResult(List<LeaderBoardRow> results, Double totalPoints,
                Double totalTopFivePrize, Double totalTopPerformerPrize, Double totalPrizes) {
            super();
            this.results = results;
            this.totalPoints = totalPoints;
            this.totalPrizes = totalPrizes;
            this.totalTopFivePrize = totalTopFivePrize;
            this.totalTopPerformerPrize = totalTopPerformerPrize;
        }
        
        public List<LeaderBoardRow> getResults() {
            return results;
        }
        public void setResults(List<LeaderBoardRow> results) {
            this.results = results;
        }
        public Double getTotalPoints() {
            return totalPoints;
        }
        public void setTotalPoints(Double totalPoints) {
            this.totalPoints = totalPoints;
        }
        public Double getTotalTopFivePrize() {
            return totalTopFivePrize;
        }
        public void setTotalTopFivePrize(Double totalTopFivePrize) {
            this.totalTopFivePrize = totalTopFivePrize;
        }
        public Double getTotalTopPerformerPrize() {
            return totalTopPerformerPrize;
        }
        public void setTotalTopPerformerPrize(Double totalTopPerformerPrize) {
            this.totalTopPerformerPrize = totalTopPerformerPrize;
        }
        public Double getTotalPrizes() {
            return totalPrizes;
        }
        public void setTotalPrizes(Double totalPrizes) {
            this.totalPrizes = totalPrizes;
        }
        
    }

}
