package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

public class DR2007dot5TopNCalculator extends DR2007dot5ResultCalculatorBase {
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

}
