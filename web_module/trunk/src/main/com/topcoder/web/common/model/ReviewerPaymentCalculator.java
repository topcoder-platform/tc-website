/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * Provides a common interface for the reviewer payment calculators.
 * 
 * <p>
 * Version 1.0.1 (Online Review Replatforming Release 2) Change notes:
 *   <ol>
 *     <li>Added {@link #getMilestoneScreeningCost()} to calculate payment for the milestone screener.</li>
 *   </ol>
 * </p>
 * 
 * @author ivern, flexme
 * @version 1.0.1
 */
public interface ReviewerPaymentCalculator {
	/**
	 * Returns the payment for the Primary Screener.
	 * @return
	 */
    public float getScreeningCost();
    
    /**
     * Returns the payment for the Milestone Screener.
     * 
     * @return the payment for the Milestone Screener.
     * @since 1.0.1
     */
    public float getMilestoneScreeningCost();

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
