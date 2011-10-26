package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;

/**
 * Calculator for DRv2 July 2008 Top Stage contests.
 *  
 * @author pulky
 */
public class DRv2July08TopNCalculator extends DRv2July08ResultCalculatorBase {
    
    private List<Double> prizesPercentages = Arrays.asList(50d, 25d, 13d, 8d, 4d);

    protected void assignPrizes(List<ContestResult> crl) {
        double totalPrizePool = getTopNPrizePool(crl);
        List<Double> prizesAmount = new ArrayList<Double>(prizesPercentages.size());
        int i = 0;
        for (Double d : prizesPercentages) {
            prizesAmount.add(i++, (d * totalPrizePool) / 100);
        }
        assignTopNPrizes(crl, prizesAmount);
    }

    protected double getTopNPrizePool(List<ContestResult> crl) {
        double totalPoints = getTotalPrizePool(crl);
        return ((totalPoints < 10000) ? 10000 : totalPoints) / 2;
    }

}
