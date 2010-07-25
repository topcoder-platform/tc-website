/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p><strong>Purpose</strong>: This class is used to calculate review costs for Studio related review projects.</p>
 *
 * @author pulky
 * @version 1.0 (Studio Coding In Online Review)
 */
public class StudioReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
    /**
     * <p>An <code>float</code> representing standard price.</p>
     */
    private static final float STANDARD_PRIZE = 750f;

    /**
     * <p>An <code>float</code> representing standard submissions.</p>
     */
    private static final float STANDARD_SUBMISSIONS = 3f;

    /**
     * Constructor using parameters
     *
     * @param firstPlacePrize the first place prize
     * @param submissionCount the submission count
     * @param passedScreeningCount the submissions that passed screening count
     */
    public StudioReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    /**
     * Gets the screening cost
     *
     * @return the screening cost
     */
    public float getScreeningCost() {
        return getActualBaseRate() * 0.5f * getSubmissionCount();
    }

    /**
     * Gets the review cost
     *
     * @return the review cost
     */
    public float getReviewCost() {
        return (Math.max(0f, STANDARD_SUBMISSIONS + 1 - getPassedScreeningCount()) * 1.5f + 2f 
                * getPassedScreeningCount()) * getActualBaseRate();
    }

    /**
     * Gets the aggregation cost
     *
     * @return the aggregation cost
     */
    public float getAggregationCost() {
        return 2f * getActualBaseRate() * 0.25f;
    }

    /**
     * Gets the final review cost
     *
     * @return the final review cost
     */
    public float getFinalReviewCost() {
        return 2f * getActualBaseRate() * 0.75f;
    }

    /**
     * Gets the calculated base hourly rate for the reviewers, scaled by the first place prize.
     *
     * @return the base hourly rate for the reviewers
     */
    protected float getCalculatedBaseRate() {
        return 15f + (getFirstPlacePrize() - STANDARD_PRIZE) * 0.01f;
    }

    /**
     * Gets the calculated review cost for this project, assuming it has three submissions and they all pass
     * screening.
     *
     * @return the review cost for this project with the mentioned assumptions.
     */
    protected float getCalculatedReviewCost() {
        return 26f * getCalculatedBaseRate();
    }

    /**
     * Gets the actual base hourly rate for the reviewers, which right now is the same as the calculated base rate.
     * This is in place should an override be added later.
     *
     * @return the base hourly rate for the reviewers
     */
    protected float getActualBaseRate() {
        return getCalculatedBaseRate();
    }

    /**
     * Gets the additional payment due to the primary reviewer.
     *
     * @return the additional payment due to the primary reviewer
     */
    protected float getPrimaryExtraCost() {
        return 2f * getActualBaseRate() + getActualBaseRate() * 0.5f * getSubmissionCount();
    }
}
