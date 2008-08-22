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
    private Integer overallPoints;
    private Integer highestWeeklyRank;
    private Integer highestWeeklyRankPoints;
    private String highestWeeklyRankWeek;
    private Integer overallRank;
    private Integer totalRankedMembers;
    private Integer userId;
    private Double winPercent;
    
    public MemberData(String handle, Integer highestOverallRank, String highestOverallRankWeek,
            Integer overallPoints, Integer highestWeeklyRank, Integer highestWeeklyRankPoints,
            String highestWeeklyRankWeek, Integer overallRank, Integer totalRankedMembers,
            Integer userId, Double winPercent) {
        super();
        this.handle = handle;
        this.highestOverallRank = highestOverallRank;
        this.highestOverallRankWeek = highestOverallRankWeek;
        this.overallPoints = overallPoints;
        this.highestWeeklyRank = highestWeeklyRank;
        this.highestWeeklyRankPoints = highestWeeklyRankPoints;
        this.highestWeeklyRankWeek = highestWeeklyRankWeek;
        this.overallRank = overallRank;
        this.totalRankedMembers = totalRankedMembers;
        this.userId = userId;
        this.winPercent = winPercent;
    }

    public Integer getOverallPoints() {
        return overallPoints;
    }

    public void setOverallPoints(Integer overallPoints) {
        this.overallPoints = overallPoints;
    }

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getHandle() {
        return handle;
    }
    public void setHandle(String handle) {
        this.handle = handle;
    }
    public Integer getTotalRankedMembers() {
        return totalRankedMembers;
    }
    public void setTotalRankedMembers(Integer totalRankedMembers) {
        this.totalRankedMembers = totalRankedMembers;
    }
    public Integer getOverallRank() {
        return overallRank;
    }
    public void setOverallRank(Integer overallRank) {
        this.overallRank = overallRank;
    }
    public Integer getHighestOverallRank() {
        return highestOverallRank;
    }
    public void setHighestOverallRank(Integer highestOverallRank) {
        this.highestOverallRank = highestOverallRank;
    }
    public String getHighestOverallRankWeek() {
        return highestOverallRankWeek;
    }
    public void setHighestOverallRankWeek(String highestOverallRankWeek) {
        this.highestOverallRankWeek = highestOverallRankWeek;
    }
    public Integer getHighestWeeklyRank() {
        return highestWeeklyRank;
    }
    public void setHighestWeeklyRank(Integer highestWeeklyRank) {
        this.highestWeeklyRank = highestWeeklyRank;
    }
    public String getHighestWeeklyRankWeek() {
        return highestWeeklyRankWeek;
    }
    public void setHighestWeeklyRankWeek(String highestWeeklyRankWeek) {
        this.highestWeeklyRankWeek = highestWeeklyRankWeek;
    }
    public Integer getHighestWeeklyRankPoints() {
        return highestWeeklyRankPoints;
    }
    public void setHighestWeeklyRankPoints(Integer highestWeeklyRankPoints) {
        this.highestWeeklyRankPoints = highestWeeklyRankPoints;
    }
    public Double getWinPercent() {
        return winPercent;
    }
    public void setWinPercent(Double winPercent) {
        this.winPercent = winPercent;
    }

    
}
