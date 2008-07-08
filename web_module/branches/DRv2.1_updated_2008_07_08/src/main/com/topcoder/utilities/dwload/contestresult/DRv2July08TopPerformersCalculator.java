package com.topcoder.utilities.dwload.contestresult;

import java.util.Arrays;
import java.util.List;

/**
 * Calculator for DRv2 July 2008 top performers.
 * 
 * @author pulky
 */
public class DRv2July08TopPerformersCalculator extends DRv2July08ResultCalculatorBase implements TopPerformersCalculator{
    
    private static List<Double> prizesAmount = Arrays.asList(50000d, 40000d, 30000d, 20000d, 10000d);
    
    private double factor = 0;
    
    protected void assignPrizes(List<ContestResult> cr) {
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
