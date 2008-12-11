package com.topcoder.web.winformula.model;

import java.io.Serializable;
import java.util.List;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id: GameData.java 72735 2008-09-08 14:59:44Z pwolfus $
 */
public class GameData implements Serializable {
    private WeekData week;
    private String home;
    private String away;
    private GameResult result;
    private Double winPercent;
    List<PredictionItem> predictions;

    public GameData(WeekData week, String home, String away, GameResult result,
            Double winPercent, List<PredictionItem> predictions) {
        super();
        this.week = week;
        this.home = home;
        this.away = away;
        this.result = result;
        this.winPercent = winPercent;
        this.predictions = predictions;
    }
    
    public WeekData getWeek() {
        return week;
    }
    public void setWeek(WeekData week) {
        this.week = week;
    }
    public String getHome() {
        return home;
    }
    public void setHome(String home) {
        this.home = home;
    }
    public String getAway() {
        return away;
    }
    public void setAway(String away) {
        this.away = away;
    }
    public GameResult getResult() {
        return result;
    }
    public void setResult(GameResult result) {
        this.result = result;
    }
    public Double getWinPercent() {
        return winPercent;
    }
    public void setWinPercent(Double winPercent) {
        this.winPercent = winPercent;
    }
    public List<PredictionItem> getPredictions() {
        return predictions;
    }
    public void setPredictions(List<PredictionItem> predictions) {
        this.predictions = predictions;
    } 
}
