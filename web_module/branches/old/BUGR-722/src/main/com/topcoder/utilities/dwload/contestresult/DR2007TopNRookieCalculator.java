package com.topcoder.utilities.dwload.contestresult;

import java.util.List;
import java.util.Set;

/**
 * Calculator for DR 2007 Rookie contests.
 *  
 * @author Cucu
 */
public class DR2007TopNRookieCalculator extends DR2007ResultCalculatorBase implements RookieContest {
    
    private Set<Long> rookieIds = null;
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

    public void setRookies(Set<Long> ids) {
        this.rookieIds = ids;        
    }

    /**
     * Just process rookie project results.
     */
    protected boolean processProjectResult(ProjectResult p) {
        return rookieIds.contains(p.getUserId());
    }

}
