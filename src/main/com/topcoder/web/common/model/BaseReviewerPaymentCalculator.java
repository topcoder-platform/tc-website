/*
 * Copyright (C) 2009 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

public abstract class BaseReviewerPaymentCalculator implements ReviewerPaymentCalculator {
    private float firstPlacePrize;
    private int submissionCount;
    private int passedScreeningCount;

    // TODO: Documentation.
    public BaseReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        if (firstPlacePrize < 0f) {
            throw new IllegalArgumentException("firstPlacePrize (" + firstPlacePrize + ") must be non-negative");
        }
        if (submissionCount < 0) {
            throw new IllegalArgumentException("submissionCount (" + submissionCount + ") must be non-negative");
        }
        if (passedScreeningCount < 0 || passedScreeningCount > submissionCount) {
            throw new IllegalArgumentException("passedScreeningCount (" + passedScreeningCount
            		+ ") must be non-negative and no greater than submissionCount (" + submissionCount + ")");
        }

        this.firstPlacePrize = firstPlacePrize;
        this.submissionCount = submissionCount;
        this.passedScreeningCount = passedScreeningCount;
    }

    public float getFirstPlacePrize() {
        return this.firstPlacePrize;
    }

    public int getSubmissionCount() {
        return this.submissionCount;
    }

    public int getPassedScreeningCount() {
        return this.passedScreeningCount;
    }

    public String toString() {
        return ("[FP:" + getFirstPlacePrize() + " SC:" + getSubmissionCount() + " PSC:" + getPassedScreeningCount()
                + "] -> (S:" + getScreeningCost() + " R:" + getReviewCost() + " A:" + getAggregationCost()
                + " FR:" + getFinalReviewCost() + ")");
    }

    /**
     * Calculate the payment cost for milestone screener.
     * 
     * @return the payment cost for milestone screener.
     */
    public float getMilestoneScreeningCost() {
        return getScreeningCost();
    }
}
