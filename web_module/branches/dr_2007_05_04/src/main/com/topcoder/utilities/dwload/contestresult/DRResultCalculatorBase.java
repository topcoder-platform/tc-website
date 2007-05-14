package com.topcoder.utilities.dwload.contestresult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
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

            cr.addResult(p);
            
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
    
    protected void assignTopNPrizes(List<ContestResult> cr, List<Double> prizesAmount) {
        int n = prizesAmount.size();
        int [] placeCount = new int[n+1];
        double [] placeAmount = new double[n+1];
        
        for (int i = 0; i < n; i ++) {
            placeCount[i] = 0;
        }
        
        Iterator prize = prizesAmount.iterator();
        // get the number of people in each place and the total prize
        for (ContestResult result : cr) {
            int place = result.getPlace();
            
            // up to n prizes
            if (place > n) break;
            
            placeCount[place]++;
            
            if (prize.hasNext()) {
                placeAmount[place] += ((Double) prize.next());
            }
        }

        // set the amounts
        for (ContestResult result : cr) {
            int place = result.getPlace();
            
            // up to n prizes
            if (place > n) break;

            result.setPrize(placeAmount[place] /  placeCount[place]);
        }

    }

    protected void assingTopPerformersPrize(List<ContestResult> cr, double prizePool, double factor) {
        
        // count how many coders won points.
        int codersWithPoints = 0;
        for (ContestResult result : cr) {
            if (result.getFinalPoints() <=0) break;
            
            codersWithPoints++;
        }
        int maxPlace = (int) Math.round(Math.ceil(codersWithPoints / factor));
        System.out.println("codersWithPoints="+codersWithPoints);
        System.out.println("maxPlace="+maxPlace);
        
        
        // sum the total points won by the top performers
        double totalPoints = 0;
        
        for (ContestResult result : cr) {
            if (result.getPlace() > maxPlace) break;
            
            totalPoints += result.getFinalPoints();
        }
        
        
        // Set prizes
        double amountPerPoint = prizePool / totalPoints;
        for (ContestResult result : cr) {
            if (result.getPlace() > maxPlace) break;
            
            result.setPrize(amountPerPoint * result.getFinalPoints());
        }
        
        
    }
    
    public abstract double calculatePointsAwarded(ProjectResult pr);

    protected abstract void assignPrizes(List<ContestResult> pr, List<Double> prizesAmount);

    protected abstract long calculatePotentialPoints(ProjectResult pr);

    protected abstract Comparator<ContestResult> getResultComparator();
    
}
