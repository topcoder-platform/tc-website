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
        return 15f + (getFirstPlacePrize() - 750) * 0.01f;
    }

    private float getCalculatedReviewCost() {
        return 26f * getCalculatedBaseRate();
    }

    private float getActualBaseRate() {
        return getCalculatedBaseRate(); // No override or cap.
    }

    private float getPrimaryExtraCost() {
        return 2f * getActualBaseRate() + getActualBaseRate() * 0.5f * getSubmissionCount();
    }

    public float getScreeningCost() {
        return getPrimaryExtraCost() - getAggregationCost() - getFinalReviewCost();
    }

    public float getReviewCost() {
        return (Math.max(0f, 4f - getPassedScreeningCount()) * 1.5f + 2f * getPassedScreeningCount()) * getActualBaseRate();
    }

    public float getAggregationCost() {
        return 10f;
    }

    public float getFinalReviewCost() {
        return 30f;
    }
}
