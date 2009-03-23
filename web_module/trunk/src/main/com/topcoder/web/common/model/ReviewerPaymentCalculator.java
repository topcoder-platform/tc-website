/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

public interface ReviewerPaymentCalculator {
    public float getScreeningCost();
    public float getReviewCost();
    public float getAggregationCost();
    public float getFinalReviewCost();
}
