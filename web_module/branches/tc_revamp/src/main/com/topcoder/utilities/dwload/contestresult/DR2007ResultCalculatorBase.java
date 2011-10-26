package com.topcoder.utilities.dwload.contestresult;

import java.util.Comparator;

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
    public double calculatePotentialPoints(ProjectResult pr) {
        return calculatePointsAwarded(true, 1, pr.getNumSubmissions());        
    }

    @Override
    protected Comparator<ContestResult> getResultComparator() {
        return new ResultsComparator();
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

        return placementPoints[placed - 1][numSubmissionsPassedReview - 1];
    }
    
    


}
