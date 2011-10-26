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
 * <p>
 * Version 1.1 (Replatforming Studio Release 5) change notes:
 * <ol>
 *   <li>Added {@link #projectCategory} field and getter/setter for it.</li>
 *   <li>Updated {@link #getScreeningCost()} method to return the screening cost based on the project category.</li>
 *   <li>Updated {@link #getMilestoneScreeningCost()} method to always return 0.</li>
 *   <li>Added {@link #getSpecReviewCost()} method to return the Specification Review Cost.</li>
 * </ol>
 * </p>
 * 
 * @author flexme
 * @version 1.1 (Online Review Replatforming Release 2)
 */
public class StudioConstantReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {

    /**
     * Represents the payment for the screener payment.
     */
    private static final float SCREENER_PAYMENT = 100.0f;
    
    /**
     * Represents the payment for screener of the Logo contest.
     * 
     * @since 1.1
     */
    private static final float LOGO_CONTEST_SCREENER_PAYMENT = 150.0f;
    
    /**
     * Represents the payment for the specification review payment.
     * 
     * @since 1.1
     */
    private static final float SPEC_REVIEW_PAYMENT = 75.0f;
    
    /**
     * Represents the project category id of Logo contest.
     * 
     * @since 1.1
     */
    private static final int LOGO_CONTEST_CATEGORY_ID = 20;

    /**
     * Represents the id of the project category.
     */
    private int projectCategory;
    
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
        projectCategory = 0;
    }

    /**
     * Constructor using project category id.
     * 
     * @param projectCategory the id of the project category.
     * @since 1.1
     */
    public StudioConstantReviewerPaymentCalculator(int projectCategory) {
        super(0, 1, 1);
        this.projectCategory = projectCategory;
    }
    
    /**
     * Gets the payment for the screener.
     * 
     * @return the payment for the screener.
     */
    public float getScreeningCost() {
        if (projectCategory == LOGO_CONTEST_CATEGORY_ID) {
            return LOGO_CONTEST_SCREENER_PAYMENT;
        }
        return SCREENER_PAYMENT;
    }

    /**
     * Gets the payment for the milestone screener.
     * 
     * @return the payment for the milestone screener.
     */
    public float getMilestoneScreeningCost() {
        return 0.0f;
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
    
    /**
     * Gets the payment for the specification reviewer.
     * 
     * @return the payment for the specification reviewer.
     * @since 1.1
     */
    public float getSpecReviewCost() {
        return SPEC_REVIEW_PAYMENT;
    }
}
