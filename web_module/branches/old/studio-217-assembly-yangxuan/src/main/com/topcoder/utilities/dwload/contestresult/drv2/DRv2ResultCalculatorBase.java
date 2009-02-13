package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;

/**
 * Base class for calculating results for DR.
 * 
 * @author Cucu
 *
 */
public abstract class DRv2ResultCalculatorBase implements ContestResultCalculatorV2 {

    /**
     * Maximum difference between points to consider them equals
     */
    private static final double DELTA_POINTS = 0.01;

    /**
     * Maximum difference between scores to consider them equals
     */
    private static final double DELTA_SCORE = 0.01;

    /**
     * Filter that can be overriden in inherited classes to skip some results.
     * 
     * @param p project result.
     * @return whether the project result must be considered.
     */
    protected boolean processProjectResult(ProjectResult p) {
        return true;
    }

    /**
     * Helper method to assing prizes to the first placements.
     * 
     * @param cr list of contest results, must be already sorted by placement
     * @param prizesAmount prize amounts, from the first to the nth.
     */
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

            // just give prizes to people that won points
            if (result.getFinalPoints() > 0) {
                result.setPrize(placeAmount[place] /  placeCount[place]);
            }
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
        
        
        // sum the total points won by the top performers
        double totalPoints = 0;
        
        // min points required for a coder to be in the top performers.
        // max place is not enough since it could happen that some coders are tied.
        double minPoints = -1;
        
        
        for (ContestResult result : cr) {        
            if (result.getPlace() >= maxPlace && minPoints < 0) {
                minPoints = result.getFinalPoints();
            }
            if (result.getFinalPoints() < minPoints) break;
                
            totalPoints += result.getFinalPoints();
        }
        

        if (totalPoints > 0) {
            // Set prizes
            double amountPerPoint = prizePool / totalPoints;
            for (ContestResult result : cr) {
                if (result.getFinalPoints() < minPoints) break;
    
                result.setPrize(amountPerPoint * result.getFinalPoints());
            }
        }
        
    }
    
    public abstract double calculatePointsAwarded(ProjectResult pr);

    public abstract double calculatePotentialPoints(ProjectResult pr);

    protected abstract void assignPrizes(List<ContestResult> pr);

    protected abstract Comparator<ContestResult> getResultComparator();

    
    protected class ResultsComparator implements Comparator<ContestResult> {

        public int compare(ContestResult o1, ContestResult o2) {
            if (Math.abs(o1.getFinalPoints() - o2.getFinalPoints()) > DELTA_POINTS) {
                if (o1.getFinalPoints() > o2.getFinalPoints()) return -1;
                if (o1.getFinalPoints() < o2.getFinalPoints()) return 1;
            }
            
            // Rank he coders with higher potential points first.
            // When the contest is over, potential points will be 0, so it won't apply.
            if (o1.getPotentialPoints() > o2.getPotentialPoints()) return -1;
            if (o1.getPotentialPoints() < o2.getPotentialPoints()) return 1;

            // Break tie with rule #1:
            // The competitor who has the most higher-placed submissions in the Stage.
            List<ProjectResult> r1 = o1.getResults();
            List<ProjectResult> r2 = o2.getResults();
            int n = r1.size() < r2.size()? r1.size() : r2.size();
            
            Collections.sort(r1, new ProjectResult.PlaceComparator());
            Collections.sort(r2, new ProjectResult.PlaceComparator());
            
            for (int i = 0; i < n; i++) {
                int p1 = r1.get(i).getPlaced();
                int p2 = r2.get(i).getPlaced();

                if (p1 < p2) return -1;
                if (p1 > p2) return 1;
            }
            
            
            // Break tie with rule #2:
            // The competitor with the highest average individual component score of the lesser number of components 
            // used to develop the placement scores for the tied competitors.
            
            Collections.sort(r1, new ProjectResult.ScoreComparator());
            Collections.sort(r2, new ProjectResult.ScoreComparator());


            double score1 = 0;
            double score2 = 0;
            
            for (int i = 0; i < n; i++) {
                score1 += r1.get(i).getFinalScore();
                score2 += r2.get(i).getFinalScore(); 
            }

            if (Math.abs(score1 - score2) > DELTA_SCORE) {
                if (score1 > score2) return -1;
                if (score1 < score2) return 1;
            }
            
            return 0;
        }
        
    }

    public  List<ContestResult> calculateResults(List<ContestResult> l) {
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
        
        // inheriting classes must implement this method.
        assignPrizes(l);

        return l;        
    }
}
