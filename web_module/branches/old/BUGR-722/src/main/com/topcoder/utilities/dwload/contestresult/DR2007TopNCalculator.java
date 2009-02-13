package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Calculator for DR 2007 Top Stage contests.
 *  
 * @author Cucu
 */
public class DR2007TopNCalculator extends DR2007ResultCalculatorBase {
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

}
