/*
 * Prediction
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id$
 */
public class MemberData implements Serializable {
    private String handle;
    private Integer highestOverallRank;
    private String highestOverallRankWeek;
    private Integer highestWeeklyRank;
    private Integer highestWeeklyRankPoints;
    private String highestWeeklyRankWeek;
    private Integer overallRank;
    private Integer totalRankedMembers;
    private Integer userId;
    private Double winPercent;
    
    public MemberData(String handle, Integer highestOverallRank, String highestOverallRankWeek,
            Integer highestWeeklyRank, Integer highestWeeklyRankPoints,
            String highestWeeklyRankWeek, Integer overallRank, Integer totalRankedMembers,
            Integer userId, Double winPercent) {
        super();
        this.handle = handle;
        this.highestOverallRank = highestOverallRank;
        this.highestOverallRankWeek = highestOverallRankWeek;
        this.highestWeeklyRank = highestWeeklyRank;
        this.highestWeeklyRankPoints = highestWeeklyRankPoints;
        this.highestWeeklyRankWeek = highestWeeklyRankWeek;
        this.overallRank = overallRank;
        this.totalRankedMembers = totalRankedMembers;
        this.userId = userId;
        this.winPercent = winPercent;
    }

    protected Integer getUserId() {
        return userId;
    }
    protected void setUserId(Integer userId) {
        this.userId = userId;
    }
    protected String getHandle() {
        return handle;
    }
    protected void setHandle(String handle) {
        this.handle = handle;
    }
    protected Integer getTotalRankedMembers() {
        return totalRankedMembers;
    }
    protected void setTotalRankedMembers(Integer totalRankedMembers) {
        this.totalRankedMembers = totalRankedMembers;
    }
    protected Integer getOverallRank() {
        return overallRank;
    }
    protected void setOverallRank(Integer overallRank) {
        this.overallRank = overallRank;
    }
    protected Integer getHighestOverallRank() {
        return highestOverallRank;
    }
    protected void setHighestOverallRank(Integer highestOverallRank) {
        this.highestOverallRank = highestOverallRank;
    }
    protected String getHighestOverallRankWeek() {
        return highestOverallRankWeek;
    }
    protected void setHighestOverallRankWeek(String highestOverallRankWeek) {
        this.highestOverallRankWeek = highestOverallRankWeek;
    }
    protected Integer getHighestWeeklyRank() {
        return highestWeeklyRank;
    }
    protected void setHighestWeeklyRank(Integer highestWeeklyRank) {
        this.highestWeeklyRank = highestWeeklyRank;
    }
    protected String getHighestWeeklyRankWeek() {
        return highestWeeklyRankWeek;
    }
    protected void setHighestWeeklyRankWeek(String highestWeeklyRankWeek) {
        this.highestWeeklyRankWeek = highestWeeklyRankWeek;
    }
    protected Integer getHighestWeeklyRankPoints() {
        return highestWeeklyRankPoints;
    }
    protected void setHighestWeeklyRankPoints(Integer highestWeeklyRankPoints) {
        this.highestWeeklyRankPoints = highestWeeklyRankPoints;
    }
    protected Double getWinPercent() {
        return winPercent;
    }
    protected void setWinPercent(Double winPercent) {
        this.winPercent = winPercent;
    }

    
}
