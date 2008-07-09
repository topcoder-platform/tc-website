package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.TopPerformersCalculator;

/**
 * Calculator for DRv2 July 2008 top performers.
 * 
 * @author pulky
 */
public class DRv2July08TopPerformersCalculator extends DRv2July08ResultCalculatorBase implements TopPerformersCalculator{
    
    private double factor = 0;
    
    protected void assignPrizes(List<ContestResult> crl) {
        if (factor <= 0) {
            throw new IllegalArgumentException("factor expected to be positive");
        }

        // total points as prize pool
        assingTopPerformersPrize(crl, getTotalPoints(crl), factor);
    }

    private double getTotalPoints(List<ContestResult> crl) {
        double totalPrizePool = 0;
        for (ContestResult cr : crl) {
            totalPrizePool += cr.getFinalPoints();
        }
        return totalPrizePool;
    }

    public void setFactor(double factor) {
        this.factor = factor;
        
    }

}
