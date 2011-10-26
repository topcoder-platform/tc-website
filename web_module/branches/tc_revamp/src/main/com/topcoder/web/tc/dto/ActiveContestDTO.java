/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This is a simple container class that has information of an active contest.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ActiveContestDTO extends BaseContestDTO {
    /**
     * <p>
     * The contest registration end date. It has both getter and setter. It can be any value. It does not need
     * to be initialized when the instance is created. It is used in setRegistrationEndDate(),
     * getRegistrationEndDate().
     * </p>
     */
    private Date registrationEndDate;

    /**
     * <p>
     * The contest submission end date. It has both getter and setter. It can be any value. It does not need
     * to be initialized when the instance is created. It is used in setSubmissionEndDate(),
     * getSubmissionEndDate().
     * </p>
     */
    private Date submissionEndDate;

    /**
     * <p>
     * The prize of the 1st place winner. It has both getter and setter. It can be any value. It does not need
     * to be initialized when the instance is created. It is used in setFirstPrize(), getFirstPrize().
     * </p>
     */
    private double firstPrize;

    /**
     * <p>
     * The reliability bonus. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setReliabilityBonus(), getReliabilityBonus().
     * </p>
     */
    private double reliabilityBonus;

    /**
     * <p>
     * The amount of digital run of this contest. It has both getter and setter. It can be any value. It does
     * not need to be initialized when the instance is created. It is used in getDigitalRunPoints(),
     * setDigitalRunPoints().
     * </p>
     */
    private Double digitalRunPoints;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ActiveContestDTO() {
        // Empty
    }

    /**
     * <p>
     * Getter method for registrationEndDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the registrationEndDate
     */
    public Date getRegistrationEndDate() {
        return registrationEndDate;
    }

    /**
     * <p>
     * Setter method for the registrationEndDate, simply set the value to the namesake field.
     * </p>
     *
     * @param registrationEndDate
     *            The contest registration end date to set
     */
    public void setRegistrationEndDate(Date registrationEndDate) {
        this.registrationEndDate = registrationEndDate;
    }

    /**
     * <p>
     * Getter method for submissionEndDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionEndDate
     */
    public Date getSubmissionEndDate() {
        return submissionEndDate;
    }

    /**
     * <p>
     * Setter method for the submissionEndDate, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionEndDate
     *            The contest submission end date to set
     */
    public void setSubmissionEndDate(Date submissionEndDate) {
        this.submissionEndDate = submissionEndDate;
    }

    /**
     * <p>
     * Getter method for firstPrize, simply return the value of the namesake field.
     * </p>
     *
     * @return the firstPrize
     */
    public double getFirstPrize() {
        return firstPrize;
    }

    /**
     * <p>
     * Setter method for the firstPrize, simply set the value to the namesake field.
     * </p>
     *
     * @param firstPrize
     *            The prize of the 1st place winner to set
     */
    public void setFirstPrize(double firstPrize) {
        this.firstPrize = firstPrize;
    }

    /**
     * <p>
     * Getter method for reliabilityBonus, simply return the value of the namesake field.
     * </p>
     *
     * @return the reliabilityBonus
     */
    public double getReliabilityBonus() {
        return reliabilityBonus;
    }

    /**
     * <p>
     * Setter method for the reliabilityBonus, simply set the value to the namesake field.
     * </p>
     *
     * @param reliabilityBonus
     *            The reliability bonus to set
     */
    public void setReliabilityBonus(double reliabilityBonus) {
        this.reliabilityBonus = reliabilityBonus;
    }

    /**
     * <p>
     * Getter method for digitalRunPoints, simply return the value of the namesake field.
     * </p>
     *
     * @return the digitalRunPoints
     */
    public Double getDigitalRunPoints() {
        return digitalRunPoints;
    }

    /**
     * <p>
     * Setter method for the digitalRunPoints, simply set the value to the namesake field.
     * </p>
     *
     * @param digitalRunPoints
     *            The amount of digital run of this contest to set
     */
    public void setDigitalRunPoints(Double digitalRunPoints) {
        this.digitalRunPoints = digitalRunPoints;
    }
}
