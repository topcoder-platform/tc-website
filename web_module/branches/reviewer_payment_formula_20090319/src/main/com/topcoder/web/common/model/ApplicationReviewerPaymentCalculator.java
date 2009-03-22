/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

public class ApplicationReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
    public ApplicationReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    // TODO: Switch everything to BigDecimal.
    // TODO: Get rid of magic numbers.
    private float getCalculatedBaseRate() {
        return 15 + (getFirstPlacePrize() - 750) * 0.01;
    }

    private float getCalculatedReviewCost() {
        return 26 * getCalculatedBaseRate();
    }

    private float getActualBaseRate() {
        return getCalculatedBaseRate(); // No override or cap.
    }

    private float getPrimaryExtraCost() {
        return 2 * getActualBaseRate() + getActualBaseRate() * 0.5 * getSubmissionCount();
    }

    public float getScreeningCost() {
        return getPrimaryExtraCost() - getAggregationCost() - getFinalReviewCost();
    }

    public float getReviewCost() {
        return (Math.max(0, 4 - getPassedScreeningCount()) * 1.5 + 2 * getPassedScreeningCount()) * getActualBaseRate();
    }

    public float getAggregationCost() {
        return 10;
    }

    public float getFinalReviewCost() {
        return 30;
    }
}
