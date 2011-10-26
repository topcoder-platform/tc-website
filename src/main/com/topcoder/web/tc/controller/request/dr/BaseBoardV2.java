/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.dr;

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
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.dr.IBoardRow;
import com.topcoder.web.tc.model.dr.LeaderBoardResult;
import com.topcoder.web.tc.model.dr.LeaderBoardRow;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: BaseBoardV2.java 76196 2009-08-20 16:31:19Z ivern $
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
        List<IBoardRow> results = new ArrayList<IBoardRow>();
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
}
