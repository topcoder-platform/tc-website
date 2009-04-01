/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

public class ComponentReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
    public ComponentReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    public float getScreeningCost() {
        return (0.86f * getInitialPurse() + getIncrementPurse() * (getSubmissionCount() - 1)) * 0.10f;
    }

    public float getReviewCost() {
        return (0.86f * getInitialPurse() + getIncrementPurse() * (getPassedScreeningCount() - 1)) * 0.9f / 3.0f;
    }

    public float getAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    public float getFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }
    
    protected float getPrizePurse() {
        return 1.5f * getFirstPlacePrize();
    }

    protected float getInitialPurse() {
        return 0.40f * getPrizePurse();
    }

    protected float getIncrementPurse() {
        return 0.15f * getPrizePurse();
    }
}
