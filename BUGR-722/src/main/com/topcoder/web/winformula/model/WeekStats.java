/*
 * Prediction
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id: WeekStats.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class WeekStats implements Serializable {
    private String weekName;
    private Integer rank;
    private Integer maxRank;
    private Double winPercent;
    private Integer points;
    
    public WeekStats(String weekName, Integer rank, Integer maxRank, 
            Double winPercent, Integer points) {
        super();
        this.maxRank = maxRank;
        this.points = points;
        this.rank = rank;
        this.weekName = weekName;
        this.winPercent = winPercent;
    }
    public String getWeekName() {
        return weekName;
    }
    public void setWeekName(String weekName) {
        this.weekName = weekName;
    }
    public Integer getRank() {
        return rank;
    }
    public void setRank(Integer rank) {
        this.rank = rank;
    }
    public Integer getMaxRank() {
        return maxRank;
    }
    public void setMaxRank(Integer maxRank) {
        this.maxRank = maxRank;
    }
    public Double getWinPercent() {
        return winPercent;
    }
    public void setWinPercent(Double winPercent) {
        this.winPercent = winPercent;
    }
    public Integer getPoints() {
        return points;
    }
    public void setPoints(Integer points) {
        this.points = points;
    }
}
