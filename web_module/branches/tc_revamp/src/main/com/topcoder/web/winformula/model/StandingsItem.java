/*
 * Prediction
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id: StandingsItem.java 72742 2008-09-08 16:11:25Z pwolfus $
 */
public class StandingsItem implements Serializable {
    private Integer rank;
    private Integer rankDiff;
    private String handle;
    private Integer coderId;
    private Integer points;
    private Double winPercent;
    private Double avgTotalScoreVariance;
    private Double avgVictoryMarginVariance;

    public StandingsItem(Integer rank, Integer rankDiff, 
            String handle, Integer coderId, 
            Integer points, Double winPercent,
            Double avgTotalScoreVariance,
            Double avgVictoryMarginVariance) {
        super();
        this.avgTotalScoreVariance = avgTotalScoreVariance;
        this.avgVictoryMarginVariance = avgVictoryMarginVariance;
        this.coderId = coderId;
        this.handle = handle;
        this.points = points;
        this.rank = rank;
        this.rankDiff = rankDiff;
        this.winPercent = winPercent;
    }

    public Integer getRank() {
        return rank;
    }
    public void setRank(Integer rank) {
        this.rank = rank;
    }
    public Integer getRankDiff() {
        return rankDiff;
    }
    public void setRankDiff(Integer rankDiff) {
        this.rankDiff = rankDiff;
    }
    public String getHandle() {
        return handle;
    }
    public String getHandleLower() {
        return handle.toLowerCase();
    }
    public void setHandle(String handle) {
        this.handle = handle;
    }
    public Integer getCoderId() {
        return coderId;
    }
    public void setCoderId(Integer coderId) {
        this.coderId = coderId;
    }
    public Integer getPoints() {
        return points;
    }
    public void setPoints(Integer points) {
        this.points = points;
    }
    public Double getWinPercent() {
        return winPercent;
    }
    public void setWinPercent(Double winPercent) {
        this.winPercent = winPercent;
    }
    public Double getAvgTotalScoreVariance() {
        return avgTotalScoreVariance;
    }
    public void setAvgTotalScoreVariance(Double avgTotalScoreVariance) {
        this.avgTotalScoreVariance = avgTotalScoreVariance;
    }
    public Double getAvgVictoryMarginVariance() {
        return avgVictoryMarginVariance;
    }
    public void setAvgVictoryMarginVariance(Double avgVictoryMarginVariance) {
        this.avgVictoryMarginVariance = avgVictoryMarginVariance;
    }
}
