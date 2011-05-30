/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>
 * <strong>Purpose</strong>: This class is used to calculate review costs for the new studio contests. The payments are
 * all constants.
 * </p>
 * 
 * @author flexme
 * @version 1.0 (Online Review Replatforming Release 2)
 */
public class StudioConstantReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
    /**
     * Represents the payments for the milestone screener.
     */
    private static final float MILESTONE_SCREENER_PAYMENT = 50.0f;

    /**
     * Represents the payment for the screener payment.
     */
    private static final float SCREENER_PAYMENT = 50.0f;

    /**
     * Constructor using parameters
     * 
     * @param firstPlacePrize
     *            the first place prize
     * @param submissionCount
     *            the submission count
     * @param passedScreeningCount
     *            the submissions that passed screening count
     */
    public StudioConstantReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    /**
     * Gets the payment for the screener.
     * 
     * @return the payment for the screener.
     */
    public float getScreeningCost() {
        return SCREENER_PAYMENT;
    }

    /**
     * Gets the payment for the milestone screener.
     * 
     * @return the payment for the milestone screener.
     */
    public float getMilestoneScreeningCost() {
        return MILESTONE_SCREENER_PAYMENT;
    }

    /**
     * Gets the payment for the reviewer.
     * 
     * @return the payment for the reviewer.
     */
    public float getReviewCost() {
        return 0;
    }

    /**
     * Gets the payment for the aggregator.
     * 
     * @return the payment for the aggregator.
     */
    public float getAggregationCost() {
        return 0;
    }

    /**
     * Gets the payment for the final reviewer.
     * 
     * @return the payment for the final reviewer.
     */
    public float getFinalReviewCost() {
        return 0;
    }
}
