/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a filter class for searching review opportunities.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public class ReviewOpportunitiesFilter extends AbstractContestsFilter {
    
    /**
     * Represents the start value of review payment. It can be any integer value. It can be accessed through corresponding getter
     * and setter methods.
     */
    private Integer paymentStart;

    /**
     * Represents the end value of review payment. It can be any integer value. It can be accessed through corresponding getter
     * and setter methods.
     */
    private Integer paymentEnd;

    /**
     * Represents the review end date. It can be any value. It can be accessed through corresponding getter
     * and setter methods.
     */
    private DateIntervalSpecification reviewEndDate;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public ReviewOpportunitiesFilter() {
    }

    /**
     * <p>
     * Gets the start value of review payment.
     * </p>
     * @return the start value of review payment.
     */
    public Integer getPaymentStart() {
        return paymentStart;
    }

    /**
     * <p>
     * Sets the start value of review payment.
     * </p>
     * @param paymentStart
     *            the start value of review payment to set.
     */
    public void setPaymentStart(Integer paymentStart) {
        this.paymentStart = paymentStart;
    }

    /**
     * <p>
     * Gets the end value of review payment.
     * </p>
     * @return the end value of review payment.
     */
    public Integer getPaymentEnd() {
        return paymentEnd;
    }

    /**
     * <p>
     * Sets the end value of review payment.
     * </p>
     * @param paymentEnd
     *            the end value of review payment to set.
     */
    public void setPaymentEnd(Integer paymentEnd) {
        this.paymentEnd = paymentEnd;
    }

    /**
     * <p>
     * Gets the review end date.
     * </p>
     * @return the review end date.
     */
    public DateIntervalSpecification getReviewEndDate() {
        return reviewEndDate;
    }

    /**
     * <p>
     * Sets the review end date.
     * </p>
     * @param reviewEndDate
     *            the review end date to set.
     */
    public void setReviewEndDate(DateIntervalSpecification reviewEndDate) {
        this.reviewEndDate = reviewEndDate;
    }
}

