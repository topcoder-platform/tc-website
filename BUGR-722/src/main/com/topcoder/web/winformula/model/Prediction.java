/*
 * Prediction
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;
import java.util.List;

/**
 * @autor Diego Belfer (Mural)
 * @version $Id: Prediction.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class Prediction implements Serializable {
    private int week;
    private List<PredictionItem> predictions;
    private Integer score;
    private PredictionStat stats;
    
    
    
    public Prediction(int week, List<PredictionItem> predictions, Integer score, PredictionStat stats) {
        this.week = week;
        this.predictions = predictions;
        this.score = score;
        this.stats = stats;
    }
    public Integer getScore() {
        return score;
    }
    public int getWeek() {
        return week;
    }
    public List<PredictionItem> getPredictions() {
        return predictions;
    }
    public void setPredictions(List<PredictionItem> predictions) {
        this.predictions = predictions;
    }
    public PredictionStat getStats() {
        return stats;
    }
    
    @Override
    public String toString() {
        return "Week ID: "+week+", Score: "+score+" Predictions: "+predictions;
    }
}
