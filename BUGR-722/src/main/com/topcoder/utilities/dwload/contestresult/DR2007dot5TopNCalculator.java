package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Calculator for DR 2007.5 Top Stage contests.
 *  
 * @author Cucu
 */
public class DR2007dot5TopNCalculator extends DR2007dot5ResultCalculatorBase {
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

}
