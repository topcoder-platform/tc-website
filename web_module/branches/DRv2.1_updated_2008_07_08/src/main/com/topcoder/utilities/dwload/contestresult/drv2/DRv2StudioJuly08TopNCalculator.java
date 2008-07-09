package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.Arrays;
import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;

/**
 * Calculator for DRv2 July 2008 Top Stage contests.
 *  
 * @author pulky
 */
public class DRv2StudioJuly08TopNCalculator extends DRv2July08ResultCalculatorBase {
    
    private static List<Double> prizesAmount = Arrays.asList(50000d, 40000d, 30000d, 20000d, 10000d);
    
    protected void assignPrizes(List<ContestResult> pr) {
        assignTopNPrizes(pr, prizesAmount);
    }

}
