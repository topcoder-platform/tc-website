/*
 * Accuracy
 * 
 * Created Aug 14, 2008
 */
package com.topcoder.web.winformula.model;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: PredictionStat.java 72321 2008-08-14 16:27:40Z dbelfer $
 */
public class PredictionStat {
    private static final Double ZERO = Double.valueOf(0);
    private int totalItems;
    private int correctItems;
    
    public PredictionStat(int totalItems, int correctItems) {
        this.totalItems = totalItems;
        this.correctItems = correctItems;
    }
    
    public int getTotalItems() {
        return totalItems;
    }
    
    public int getCorrectItems() {
        return correctItems;
    }
    
    public Double getAccuracy() {
        if (totalItems > 0) {
            if (correctItems > 0) {
                return new Double(((double) correctItems)/ totalItems);
            } else {
                return ZERO;
            }
        }
        return null;
    }
}
