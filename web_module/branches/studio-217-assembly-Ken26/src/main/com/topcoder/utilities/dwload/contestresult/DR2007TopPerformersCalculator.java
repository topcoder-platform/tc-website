package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Calculator for DR 2007 top performers.
 * 
 * @author Cucu
 */
public class DR2007TopPerformersCalculator extends DR2007ResultCalculatorBase  implements TopPerformersCalculator{
    
    private double factor = 0;
    
    protected void assignPrizes(List<ContestResult> cr, List<Double> prizesAmount) {
        if (factor <= 0) {
            throw new IllegalArgumentException("factor expected to be positive!");
        }
        assingTopPerformersPrize(cr, prizesAmount.get(0), factor);
    }

    public void setFactor(double factor) {
        this.factor = factor;
        
    }

}
