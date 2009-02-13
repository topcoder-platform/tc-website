package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.Comparator;
import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;

/**
 * Base class for calculating points for DRv2 July 2008
 * 
 * @author pulky
 *
 */
public abstract class DRv2July08ResultCalculatorBase extends DRv2ResultCalculatorBase {

    private static final double[][] amountFraction = 
     {{ 1.00, 0.70, 0.65, 0.60, 0.56},
        {0  , 0.30, 0.25, 0.22, 0.20},
        {0  , 0   , 0.10, 0.10, 0.10},
        {0  , 0   , 0   , 0.08, 0.08},
        {0  , 0   , 0   , 0   , 0.06}
     };
        
    /**
     * Max place rewarded for placement points.
     */
    private static final int MAX_PLACE_REWARDED = 5;

    /**
     * Max number of submissions for placement points matrix.
     */
    private static final int MAX_NUM_SUBMISSIONS = 5;        
        

    protected double getTotalPrizePool(List<ContestResult> crl) {
        double totalPrizePool = 0;
        for (ContestResult cr : crl) {
            totalPrizePool += cr.getFinalPoints();
        }
        return totalPrizePool;
    }

    @Override
    public double calculatePointsAwarded(ProjectResult pr) {
        return calculatePointsAwarded(pr.isPassedReview(), pr.getPlaced(), pr.getNumSubmissions(), pr.getAmount());
    }

    @Override
    public double calculatePotentialPoints(ProjectResult pr) {
        return calculatePointsAwarded(true, 1, pr.getNumSubmissions(), pr.getAmount());        
    }

    @Override
    protected Comparator<ContestResult> getResultComparator() {
        return new ResultsComparator();
    }

    

    
    /**
     * <p/>
     * Calculates points awarded based on the defined amountFraction matrix and the project amount
     * </p>
     *
     * @param passedReview true if submission passed review
     * @param placed       The submission placement
     * @return the points awarded.
     */
    private double calculatePointsAwarded(boolean passedReview, int placed, int numSubmissionsPassedReview, double amount) {
        // If not passed review or placed too far, there are no chances of winning points
        if (numSubmissionsPassedReview == 0 || !passedReview || placed > MAX_PLACE_REWARDED || placed == 0) {
            return 0;
        }

        // If there are more submissions, stick to the last points
        if (numSubmissionsPassedReview > MAX_NUM_SUBMISSIONS) {
            numSubmissionsPassedReview = MAX_NUM_SUBMISSIONS;
        }

        return amount * amountFraction[placed - 1][numSubmissionsPassedReview - 1];
    }
}
