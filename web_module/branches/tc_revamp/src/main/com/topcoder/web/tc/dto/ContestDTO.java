/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is an entity class that contains information of contests.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * <p>
 * Changes in Version 1.1: Added {@link #status} field.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.1
 */
public class ContestDTO extends AbstractContestDTO {

    /**
     * Represents the catalog of contest. It can be any string value. It can be accessed through corresponding getter
     * and setter methods.
     */
    private String catalog;

    /**
     * Represents the number of registrants of Contest. It can be any integer value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private int numberOfRegistrants;

    /**
     * Represents the number of submissions of contest. It can be any integer value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private int numberOfSubmissions;

    /**
     * Represents the number of passed screening submissions of contest. It can be any integer value. It can be accessed
     * through corresponding getter and setter methods.
     */
    private int passedScreeningCount;

    /**
     * Represents the winner profile link of contest. It can be any string value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private String winnerProfileLink;

    /**
     * Represents the winner score of contest. It can be any double value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private double winnerScore;

    /**
     * Represents the status of upcoming Contest. It could be any value. It has setter and getter.
     */
    private String status;
    
    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public ContestDTO() {
    }

    /**
     * <p>
     * Gets the catalog of contest.
     * </p>
     * @return the catalog of contest.
     */
    public String getCatalog() {
        return catalog;
    }

    /**
     * <p>
     * Sets the catalog of contest.
     * </p>
     * @param catalog
     *            the contest catalog to set.
     */
    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    /**
     * <p>
     * Gets the number of registrants of contest.
     * </p>
     * @return the number of registrants of contest.
     */
    public int getNumberOfRegistrants() {
        return numberOfRegistrants;
    }

    /**
     * <p>
     * Sets the number of registrants of contest.
     * </p>
     * @param numberOfRegistrants
     *            the number of contest registrants to set.
     */
    public void setNumberOfRegistrants(int numberOfRegistrants) {
        this.numberOfRegistrants = numberOfRegistrants;
    }

    /**
     * <p>
     * Gets the number of submissions of contest.
     * </p>
     * @return the number of submissions of contest.
     */
    public int getNumberOfSubmissions() {
        return numberOfSubmissions;
    }

    /**
     * <p>
     * Sets the number of submissions of contest.
     * </p>
     * @param numberOfSubmissions
     *            the number of contest submissions to set.
     */
    public void setNumberOfSubmissions(int numberOfSubmissions) {
        this.numberOfSubmissions = numberOfSubmissions;
    }

    /**
     * <p>
     * Gets the number of passed screening submissions of contest.
     * </p>
     * @return the number of passed screening submissions of contest.
     */
    public int getPassedScreeningCount() {
        return passedScreeningCount;
    }

    /**
     * <p>
     * Sets the number of passed screening submissions of contest.
     * </p>
     * @param passedScreeningCount
     *            the number of passed screening contest submissions to set.
     */
    public void setPassedScreeningCount(int passedScreeningCount) {
        this.passedScreeningCount = passedScreeningCount;
    }

    /**
     * <p>
     * Gets the winner profile link of contest.
     * </p>
     * @return the winner profile link of contest.
     */
    public String getWinnerProfileLink() {
        return winnerProfileLink;
    }

    /**
     * <p>
     * Sets the winner profile link of contest.
     * </p>
     * @param winnerProfileLink
     *            the contest winner profile link to set.
     */
    public void setWinnerProfileLink(String winnerProfileLink) {
        this.winnerProfileLink = winnerProfileLink;
    }

    /**
     * <p>
     * Gets the winner score of contest.
     * </p>
     * @return the winner score of contest.
     */
    public double getWinnerScore() {
        return winnerScore;
    }

    /**
     * <p>
     * Sets the winner score of contest.
     * </p>
     * @param winnerScore
     *            the contest winner score to set.
     */
    public void setWinnerScore(double winnerScore) {
        this.winnerScore = winnerScore;
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
}
