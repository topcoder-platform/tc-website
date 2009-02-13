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
 * @version $Id$
 */
public class Prediction implements Serializable {
    private int week;
    private List<PredictionItem> predictions;
    private Integer score;
    
    
    
    public Prediction(int week, List<PredictionItem> predictions, Integer score) {
        this.week = week;
        this.predictions = predictions;
        this.score = score;
    }
    public Integer getScore() {
        return score;
    }
    public int getWeek() {
        return week;
    }
    public List getPredictions() {
        return predictions;
    }
   
    @Override
    public String toString() {
        return "Week ID: "+week+", Score: "+score+" Predictions: "+predictions;
    }
}
