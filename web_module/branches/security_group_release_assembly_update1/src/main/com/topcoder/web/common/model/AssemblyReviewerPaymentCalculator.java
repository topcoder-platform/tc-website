/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * This class simply pays out the standard application amounts plus 80%.
 *  
 * @author ivern
 */
public class AssemblyReviewerPaymentCalculator extends ApplicationReviewerPaymentCalculator {
    private static final float MULTIPLIER = 1.8f;
    
    public AssemblyReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
    }

    public float getScreeningCost() {
        return super.getScreeningCost() * MULTIPLIER;
    }

    public float getReviewCost() {
        return super.getReviewCost() * MULTIPLIER;
    }

    public float getAggregationCost() {
       return super.getAggregationCost() * MULTIPLIER;
    }

    public float getFinalReviewCost() {
        return super.getFinalReviewCost() * MULTIPLIER;
    }
}
