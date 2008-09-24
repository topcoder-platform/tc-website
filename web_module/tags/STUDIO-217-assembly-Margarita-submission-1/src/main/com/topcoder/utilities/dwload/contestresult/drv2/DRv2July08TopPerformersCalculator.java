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
        assingTopPerformersPrize(crl, getTopPerformersPrizePool(crl), factor);
    }

    protected double getTopPerformersPrizePool(List<ContestResult> crl) {
        double totalPoints = getTotalPrizePool(crl);
        return ((totalPoints < 10000) ? 10000 : totalPoints) / 2;
    }

    public void setFactor(double factor) {
        this.factor = factor;
        
    }

}
