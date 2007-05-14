package com.topcoder.utilities.dwload.contestresult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class DRResultCalculatorBase implements ContestResultCalculator {

        
    /**
     * Active Project status 
     */    
    private static final int STATUS_ACTIVE = 1;
    
    // todo: change name (calculateResult?)
    public  List<ContestResult> calculateResults(List<ProjectResult> pr, List<Double> prizesAmount) {
        Map<Long, ContestResult> results = new HashMap<Long, ContestResult>();
        
        for(ProjectResult p : pr) {
            ContestResult cr = results.get(p.getUserId());
            
            if (cr == null)  {
                cr = new ContestResult(p.getUserId());
                results.put(p.getUserId(), cr);
            }

            if (p.getStatusId() == STATUS_ACTIVE) {
                cr.addPotentialPoints(calculatePotentialPoints(p));
            } else {
                // Completed project:
                // add the points for placement
                cr.addPoints(calculatePointsAwarded(p));
                
                // remove penalty points if needed.
                if (p.getPointAdjustment() > 0) {
                    cr.discountPoints(p.getPointAdjustment());
                }
            }            
        }

        List<ContestResult> l = new ArrayList<ContestResult> ();
        l.addAll(results.values());
        
        // sort using the comparator defined in extending classes
        Comparator<ContestResult> rc = getResultComparator(); 
        Collections.sort(l, rc);
        
        // Assign places
        ContestResult previous = null;
        int place = 1;
        for (ContestResult cr : l) {
            if (previous != null && rc.compare(cr, previous) != 0) {
                place++;
            }
            cr.setPlace(place);
            previous = cr;
            
        }
        
        // TO DO: assign prizes.
        assignPrizes(l, prizesAmount);
        return l;        
    }
    
    public abstract double calculatePointsAwarded(ProjectResult pr);

    protected abstract void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount);

    protected abstract long calculatePotentialPoints(ProjectResult pr);

    protected abstract Comparator<ContestResult> getResultComparator();
    
}
