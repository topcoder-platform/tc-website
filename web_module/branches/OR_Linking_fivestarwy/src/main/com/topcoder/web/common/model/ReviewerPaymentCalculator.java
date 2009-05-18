/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * Provides a common interface for the reviewer payment calculators.
 * 
 * @author ivern
 */
public interface ReviewerPaymentCalculator {
	/**
	 * Returns the payment for the Primary Screener.
	 * @return
	 */
    public float getScreeningCost();
    
    /**
     * Returns the payment for each Reviewer. 
     * @return
     */
    public float getReviewCost();
    
    /**
     * Returns the payment for the Aggregator.
     * @return
     */
    public float getAggregationCost();
    
    /**
     * Returns the payment for the Final Reviewer.
     * @return
     */
    public float getFinalReviewCost();
}
