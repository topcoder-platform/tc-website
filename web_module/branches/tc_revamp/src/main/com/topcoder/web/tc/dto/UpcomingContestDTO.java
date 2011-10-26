/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This is an entity class that contains information of upcoming contests.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public class UpcomingContestDTO extends AbstractContestDTO {

    /**
     * Represents the register date of upcoming Contest. It could be any value. It has setter and getter.
     */
    private Date registerDate;

    /**
     * Represents the submit date of upcoming Contest. It could be any value. It has setter and getter.
     */
    private Date submitDate;

    /**
     * Represents the duration of upcoming Contest. It could be any value. It has setter and getter. The unit of the
     * duration is day.
     */
    private int duration;

    /**
     * Represents the technologies of upcoming Contest. It could be any value. It has setter and getter.
     */
    private String technologies;

    /**
     * Represents the status of upcoming Contest. It could be any value. It has setter and getter.
     */
    private String status;

    /**
     * Represents the first prize of upcoming Contest. It could be any value. It has setter and getter.
     */
    private double firstPrize;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public UpcomingContestDTO() {
    }

    /**
     * <p>
     * Gets the register date.
     * </p>
     * @return the register date.
     */
    public Date getRegisterDate() {
        return registerDate;
    }

    /**
     * <p>
     * Sets the register date.
     * </p>
     * @param registerDate
     *            the register date to set.
     */
    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    /**
     * <p>
     * Gets the submit date.
     * </p>
     * @return the submit date.
     */
    public Date getSubmitDate() {
        return submitDate;
    }

    /**
     * <p>
     * Sets the submit date.
     * </p>
     * @param submitDate
     *            the submit date to set.
     */
    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }

    /**
     * <p>
     * Gets the duration.
     * </p>
     * @return the duration.
     */
    public int getDuration() {
        return duration;
    }

    /**
     * <p>
     * Sets the duration.
     * </p>
     * @param duration
     *            the duration to set.
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }

    /**
     * <p>
     * Gets the technologies.
     * </p>
     * @return the technologies.
     */
    public String getTechnologies() {
        return technologies;
    }

    /**
     * <p>
     * Sets the technologies.
     * </p>
     * @param technologies
     *            the technologies to set.
     */
    public void setTechnologies(String technologies) {
        this.technologies = technologies;
    }

    /**
     * <p>
     * Gets the status.
     * </p>
     * @return the status.
     */
    public String getStatus() {
        return status;
    }

    /**
     * <p>
     * Sets the status.
     * </p>
     * @param status
     *            the status to set.
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * <p>
     * Gets the first prize.
     * </p>
     * @return the first prize.
     */
    public double getFirstPrize() {
        return firstPrize;
    }

    /**
     * <p>
     * Sets the first prize.
     * </p>
     * @param firstPrize
     *            the first prize to set.
     */
    public void setFirstPrize(double firstPrize) {
        this.firstPrize = firstPrize;
    }
}
