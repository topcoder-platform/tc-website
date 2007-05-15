package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

public class DR2007dot5TopPerformersCalculator extends DR2007dot5ResultCalculatorBase  implements TopPerformersCalculator{
    
    private double factor = 0;
    
    protected void assignPrizes(List<ContestResult> cr, List<Double> prizesAmount) {
        if (factor <= 0) {
            throw new IllegalArgumentException("factor expected to be positive");
        }
        if (prizesAmount.size() == 0) {
            throw new IllegalArgumentException("Prize missing for the contest");
        }
        assingTopPerformersPrize(cr, prizesAmount.get(0), factor);
    }

    public void setFactor(double factor) {
        this.factor = factor;
        
    }

}
