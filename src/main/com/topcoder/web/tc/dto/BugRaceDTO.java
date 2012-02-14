/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This class is a DTO for bug race information.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public class BugRaceDTO {

    /**
     * Represents the key of the bug race contest.
     */
    private String key;

    /**
     * Represents the summary of the bug race contest.
     */
    private String summary;

    /**
     * Represents the payment of the bug race contest.
     */
    private double payment;

    /**
     * Represents the TCO points of the bug race contest.
     */
    private int tcoPoints;

    /**
     * Represents the number of registrants of this bug race contest.
     */
    private int registrants;

    /**
     * Represents the active date of this bug race contest.
     */
    private Date activeSince;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public BugRaceDTO() {
    }

    /**
     * <p>
     * Gets the key of the bug race contest.
     * </p>
     * @return the key of the bug race contest.
     */
    public String getKey() {
        return key;
    }

    /**
     * <p>
     * Sets the key of the bug race contest.
     * </p>
     * @param key
     *            the key of the bug race contest.
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * <p>
     * Gets the summary of the bug race contest.
     * </p>
     * @return the summary of the bug race contest.
     */
    public String getSummary() {
        return summary;
    }

    /**
     * <p>
     * Sets the summary of the bug race contest.
     * </p>
     * @param summary
     *            the summary of the bug race contest.
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }

    /**
     * <p>
     * Gets the payment of the bug race contest.
     * </p>
     * @return the payment of the bug race contest.
     */
    public double getPayment() {
        return payment;
    }

    /**
     * <p>
     * Sets the payment of the bug race contest.
     * </p>
     * @param payment
     *            the payment of the bug race contest.
     */
    public void setPayment(double payment) {
        this.payment = payment;
    }

    /**
     * <p>
     * Gets the TCO points of the bug race contest.
     * </p>
     * @return the TCO points of the bug race contest.
     */
    public int getTcoPoints() {
        return tcoPoints;
    }

    /**
     * <p>
     * Sets the TCO points of the bug race contest.
     * </p>
     * @param tcoPoints
     *            the TCO points of the bug race contest.
     */
    public void setTcoPoints(int tcoPoints) {
        this.tcoPoints = tcoPoints;
    }

    /**
     * <p>
     * Gets the number of registrants of the bug race contest.
     * </p>
     * @return the number of registrants of the bug race contest.
     */
    public int getRegistrants() {
        return registrants;
    }

    /**
     * <p>
     * Sets the number of registrants of the bug race contest.
     * </p>
     * @param registrants
     *            the number of registrants of the bug race contest.
     */
    public void setRegistrants(int registrants) {
        this.registrants = registrants;
    }

    /**
     * <p>
     * Gets the active date of the bug race contest.
     * </p>
     * @return the active date of the bug race contest.
     */
    public Date getActiveSince() {
        return activeSince;
    }

    /**
     * <p>
     * Sets the active date of the bug race contest.
     * </p>
     * @param activeSince
     *            the active date of the bug race contest.
     */
    public void setActiveSince(Date activeSince) {
        this.activeSince = activeSince;
    }
}
