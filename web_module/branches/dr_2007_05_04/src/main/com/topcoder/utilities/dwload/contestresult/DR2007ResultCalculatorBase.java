package com.topcoder.utilities.dwload.contestresult;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public abstract class DR2007ResultCalculatorBase extends DRResultCalculatorBase {

    private static final int[][] placementPoints = 
     {{500, 325, 270, 250, 245, 240, 235},
        {0, 175, 150, 145, 135, 130, 130},
        {0, 0, 80, 75, 75, 75, 75},
        {0, 0, 0, 30, 30, 30, 30},
        {0, 0, 0, 0, 15, 15, 15},
        {0, 0, 0, 0, 0, 10, 10},
        {0, 0, 0, 0, 0, 0, 5}
     };
        
    /**
     * Max place rewarded for placement points.
     */
    private static final int MAX_PLACE_REWARDED = 7;

    /**
     * Max number of submissions for placement points matrix.
     */
    private static final int MAX_NUM_SUBMISSIONS = 7;        
        


    @Override
    public double calculatePointsAwarded(ProjectResult pr) {
        return calculatePointsAwarded(pr.isPassedReview(), pr.getPlaced(), pr.getNumSubmissions());
    }

    @Override
    protected long calculatePotentialPoints(ProjectResult pr) {
        return calculatePointsAwarded(true, 1, pr.getNumSubmissions());        
    }

    @Override
    protected Comparator<ContestResult> getResultComparator() {
        return new ResultsComparator();
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

    
    /**
     * <p/>
     * Calculates points awarded based on the defined placementPoints matrix.
     * </p>
     *
     * @param passedReview true if submission passed review
     * @param placed       The submission placement
     * @return the points awarded.
     */
    private long calculatePointsAwarded(boolean passedReview, int placed, int numSubmissionsPassedReview) {
        // If not passed review or placed too far, there are no chances of winning points
        if (numSubmissionsPassedReview == 0 || !passedReview || placed > MAX_PLACE_REWARDED || placed == 0) {
            return 0;
        }

        // If there are more submissions, stick to the last points
        if (numSubmissionsPassedReview > MAX_NUM_SUBMISSIONS) {
            numSubmissionsPassedReview = MAX_NUM_SUBMISSIONS;
        }

        return (placementPoints[placed - 1][numSubmissionsPassedReview - 1]);
    }
    
    
    private class ResultsComparator implements Comparator<ContestResult> {

        public int compare(ContestResult o1, ContestResult o2) {
            System.out.println("compare results " + o1.getCoderId() + " vs " +o2.getCoderId());
            if (o1.getFinalPoints() > o2.getFinalPoints()) return -1;
            if (o1.getFinalPoints() < o2.getFinalPoints()) return 1;
            
            System.out.println("tie in points!");

            // Break tie with rule #1:
            // The competitor who has the most higher-placed submissions in the Stage.
            List<ProjectResult> r1 = o1.getResults();
            List<ProjectResult> r2 = o2.getResults();
            int n = r1.size() < r2.size()? r1.size() : r2.size();
            
            Collections.sort(r1, new ProjectResult.PlaceComparator());
            Collections.sort(r2, new ProjectResult.PlaceComparator());
            
            System.out.println("n=" + n);
            
            for (int i = 0; i < n; i++) {
                int p1 = r1.get(i).getPlaced();
                int p2 = r2.get(i).getPlaced();
                System.out.println(p1 + " vs " + p2);
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
            
            if (score1 > score2) return -1;
            if (score1 < score2) return 1;
            
            
            return 0;
        }
        
    }


}
