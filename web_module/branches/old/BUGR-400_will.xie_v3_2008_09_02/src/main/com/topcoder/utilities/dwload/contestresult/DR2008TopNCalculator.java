package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Calculator for DR 2008 Top Stage contests.
 *  
 * @author pulky
 */
public class DR2008TopNCalculator extends DR2008ResultCalculatorBase {
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

}
