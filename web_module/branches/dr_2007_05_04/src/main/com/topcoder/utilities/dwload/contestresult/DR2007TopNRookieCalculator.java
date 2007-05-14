package com.topcoder.utilities.dwload.contestresult;

import java.util.List;
import java.util.Set;

public class DR2007TopNRookieCalculator extends DR2007ResultCalculatorBase implements RookieContest {
    
    private Set<Long> rookieIds = null;
    
    protected void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount) {
        assignTopNPrizes(pr, prizesAmount);
    }

    public void setRookies(Set<Long> ids) {
        this.rookieIds = ids;        
    }

    protected boolean processProjectResult(ProjectResult p) {
        System.out.println("processProjectResult for " + p.getUserId() + " : " + rookieIds.contains(p.getUserId()));
        return rookieIds.contains(p.getUserId());
    }

}
