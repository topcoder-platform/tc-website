/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This is an entity class that contains information of review opportunities.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * 
 * <p>
 * Changes in Version 1.1: Add {@link #projectCategoryId} field.
 * </p>
 *
 * @author flytoj2ee, duxiaoyang
 * @version 1.1
 */
public class ReviewOpportunityDTO extends AbstractContestDTO {
    /**
     * Represents the primary reviewer payment. It can be any double value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private double primaryReviewerPayment;

    /**
     * Represents the secondary reviewer payment. It can be any double value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private double secondaryReviewerPayment;

    /**
     * Represents the number of submissions. It can be any integer value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private int submissionsNumber;

    /**
     * Represents the open date of review opportunity. It can be any date value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private Date opensOn;

    /**
     * Represents the review start date. It can be any date value. It can be accessed through corresponding getter and
     * setter methods.
     */
    private Date reviewStart;

    /**
     * Represents the review end date. It can be any date value. It can be accessed through corresponding getter and
     * setter methods.
     */
    private Date reviewEnd;

    /**
     * Represents the number of available review positions. It can be any integer value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private int numberOfReviewPositionsAvailable;

    /**
     * Represents the category id of the contest.
     */
    private int projectCategoryId;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public ReviewOpportunityDTO() {
    }

    /**
     * <p>
     * Gets the primary reviewer payment.
     * </p>
     * @return the primary reviewer payment.
     */
    public double getPrimaryReviewerPayment() {
        return primaryReviewerPayment;
    }

    /**
     * <p>
     * Sets the primary reviewer payment.
     * </p>
     * @param primaryReviewerPayment
     *            the primary reviewer payment to set.
     */
    public void setPrimaryReviewerPayment(double primaryReviewerPayment) {
        this.primaryReviewerPayment = primaryReviewerPayment;
    }

    /**
     * <p>
     * Gets the secondary reviewer payment.
     * </p>
     * @return the secondary reviewer payment.
     */
    public double getSecondaryReviewerPayment() {
        return secondaryReviewerPayment;
    }

    /**
     * <p>
     * Sets the secondary reviewer payment.
     * </p>
     * @param secondaryReviewerPayment
     *            the secondary reviewer payment to set.
     */
    public void setSecondaryReviewerPayment(double secondaryReviewerPayment) {
        this.secondaryReviewerPayment = secondaryReviewerPayment;
    }

    /**
     * <p>
     * Gets the number of submissions.
     * </p>
     * @return the number of submissions.
     */
    public int getSubmissionsNumber() {
        return submissionsNumber;
    }

    /**
     * <p>
     * Sets the number of submissions.
     * </p>
     * @param submissionsNumber
     *            the number of submissions to set.
     */
    public void setSubmissionsNumber(int submissionsNumber) {
        this.submissionsNumber = submissionsNumber;
    }

    /**
     * <p>
     * Gets the open date of review opportunity.
     * </p>
     * @return the open date of review opportunity.
     */
    public Date getOpensOn() {
        return opensOn;
    }

    /**
     * <p>
     * Sets the open date of review opportunity.
     * </p>
     * @param opensOn
     *            the review opportunity open date to set.
     */
    public void setOpensOn(Date opensOn) {
        this.opensOn = opensOn;
    }

    /**
     * <p>
     * Gets the review start date.
     * </p>
     * @return the review start date.
     */
    public Date getReviewStart() {
        return reviewStart;
    }

    /**
     * <p>
     * Sets the review start date.
     * </p>
     * @param reviewStart
     *            the review start date to set.
     */
    public void setReviewStart(Date reviewStart) {
        this.reviewStart = reviewStart;
    }

    /**
     * <p>
     * Gets the review end date.
     * </p>
     * @return the review end date.
     */
    public Date getReviewEnd() {
        return reviewEnd;
    }

    /**
     * <p>
     * Sets the review end date.
     * </p>
     * @param reviewEnd
     *            the review end date to set.
     */
    public void setReviewEnd(Date reviewEnd) {
        this.reviewEnd = reviewEnd;
    }

    /**
     * <p>
     * Gets the number of available review positions.
     * </p>
     * @return the number of available review positions.
     */
    public int getNumberOfReviewPositionsAvailable() {
        return numberOfReviewPositionsAvailable;
    }

    /**
     * <p>
     * Sets the number of available review positions.
     * </p>
     * @param numberOfReviewPositionsAvailable
     *            the number of available review positions to set.
     */
    public void setNumberOfReviewPositionsAvailable(int numberOfReviewPositionsAvailable) {
        this.numberOfReviewPositionsAvailable = numberOfReviewPositionsAvailable;
    }

    /**
     * <p>
     * Gets the category id of the contest.
     * </p>
     *
     * @return the category id of the contest.
     */
    public int getProjectCategoryId() {
        return projectCategoryId;
    }

    /**
     * <p>
     * Sets the category id of the contest.
     * </p>
     *
     * @param projectCategoryId the category id of the contest.
     */
    public void setProjectCategoryId(int projectCategoryId) {
        this.projectCategoryId = projectCategoryId;
    }
}
