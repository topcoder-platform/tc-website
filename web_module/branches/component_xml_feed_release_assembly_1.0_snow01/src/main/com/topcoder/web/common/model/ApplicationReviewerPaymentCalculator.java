/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

public class ApplicationReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
	private static final float STANDARD_PRIZE = 750f;
	private static final float STANDARD_SUBMISSIONS = 3f;
	
    public ApplicationReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    public float getScreeningCost() {
        return getActualBaseRate() * 0.5f * getSubmissionCount();
    }

    public float getReviewCost() {
        return (Math.max(0f, STANDARD_SUBMISSIONS + 1 - getPassedScreeningCount()) * 1.5f + 2f * getPassedScreeningCount())
        		* getActualBaseRate();
    }

    public float getAggregationCost() {
        return 2f * getActualBaseRate() * 0.25f;
    }

    public float getFinalReviewCost() {
        return 2f * getActualBaseRate() * 0.75f;
    }
    
    /**
     * Returns the calculated base hourly rate for the reviewers, scaled by the first place prize.
     * 
     * @return
     */
    protected float getCalculatedBaseRate() {
        return 15f + (getFirstPlacePrize() - STANDARD_PRIZE) * 0.01f;
    }

    /**
     * Returns the calculated review cost for this project, assuming it has three submissions and they all pass
     * screening.
     * 
     * @return
     */
    protected float getCalculatedReviewCost() {
        return 26f * getCalculatedBaseRate();
    }

    /**
     * Returns the actual base hourly rate for the reviewers, which right now is the same as the calculated base rate.
     * This is in place should an override be added later.
     * 
     * @return
     */
    protected float getActualBaseRate() {
        return getCalculatedBaseRate();
    }

    /**
     * Returns the additional payment due to the primary reviewer.
     * 
     * @return
     */
    protected float getPrimaryExtraCost() {
        return 2f * getActualBaseRate() + getActualBaseRate() * 0.5f * getSubmissionCount();
    }
}
