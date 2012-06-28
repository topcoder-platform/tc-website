/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * This class simply pays out the standard application amounts plus 50%.
 *  
 * @author VolodymyrK
 */
public class ConceptualizationReviewerPaymentCalculator extends ApplicationReviewerPaymentCalculator {
    private static final float MULTIPLIER = 1.5f;
    
    public ConceptualizationReviewerPaymentCalculator(float firstPlacePrize, int submissionCount, int passedScreeningCount) {
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
