/*
 * PredictionSummary
 * 
 * Created Aug 14, 2008
 */
package com.topcoder.web.winformula.model;

import java.util.Collections;
import java.util.List;

/**
 * @author Diego Belfer (mural)
 * @version $Id: PredictionSummary.java 72326 2008-08-14 17:08:29Z dbelfer $
 */
public class PredictionSummary {
    public static final PredictionSummary NULL_SUMMARY = new PredictionSummary();
    private List<Prediction> predictions;
    private PredictionStat stats;
    private int worstWeekIndex;
    private int bestWeekIndex;
    
    private PredictionSummary() {
        predictions = Collections.emptyList();
        stats = new PredictionStat(0,0);
    }
    
    public PredictionSummary(PredictionStat stats, List<Prediction> predictions, int worstWeekIndex, int bestWeekIndex) {
        super();
        this.stats = stats;
        this.predictions = predictions;
        this.worstWeekIndex = worstWeekIndex;
        this.bestWeekIndex = bestWeekIndex;
    }
    
    public List<Prediction> getPredictions() {
        return predictions;
    }

    public PredictionStat getStats() {
        return stats;
    }
    
    public Prediction getBestWeek() {
        if (bestWeekIndex != -1) {
            return predictions.get(bestWeekIndex);
        }
        return null;
    }
    
    public Prediction getWorstWeek() {
        if (worstWeekIndex != -1) {
            return predictions.get(worstWeekIndex);
        }
        return null;
    }
    
}
