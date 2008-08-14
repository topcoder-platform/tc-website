/*
 * PredictionSummary
 * 
 * Created Aug 14, 2008
 */
package com.topcoder.web.winformula.model;

import java.util.List;

/**
 * @author Diego Belfer (mural)
 * @version $Id$
 */
public class PredictionSummary {
    public static final PredictionSummary NULL_SUMMARY = new PredictionSummary();
    private List<Prediction> predictions;
    private PredictionStat stats;
    
    private PredictionSummary() {
    }
    
    public PredictionSummary(PredictionStat stats, List<Prediction> predictions) {
        super();
        this.stats = stats;
        this.predictions = predictions;
    }
    
    public List<Prediction> getPredictions() {
        return predictions;
    }

    public PredictionStat getStats() {
        return stats;
    }
}
