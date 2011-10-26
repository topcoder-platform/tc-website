/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This is a simple container class that has information of a past contest.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 * <p>
 * Version 1.1 change notes:
 * <ul>
 * <li>Adds the <code>winnerHandle</code> field.</li>
 * </ul>
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER, TCSASSEMBLIER
 * @version 1.1
 */
public class PastContestDTO extends BaseContestDTO {
    /**
     * <p>
     * The completion date of the contest. It has both getter and setter. It can
     * be any value. It does not need to be initialized when the instance is
     * created. It is used in getCompletionDate(), setCompletionDate().
     * </p>
     */
    private Date completionDate;

    /**
     * <p>
     * The number of submissions that passed screening. It has both getter and
     * setter. It can be any value. It does not need to be initialized when the
     * instance is created. It is used in getPassedScreeningCount(),
     * setPassedScreeningCount().
     * </p>
     */
    private int passedScreeningCount;

    /**
     * <p>
     * The link to the winner profile. It has both getter and setter. It can be
     * any value. It does not need to be initialized when the instance is
     * created. It is used in getWinnerProfileLink(), setWinnerProfileLink().
     * </p>
     */
    private String winnerProfileLink;

    /**
     * <p>
     * The winner score. It has both getter and setter. It can be any value. It
     * does not need to be initialized when the instance is created. It is used
     * in getWinnerScore(), setWinnerScore().
     * </p>
     */
    private double winnerScore;

    /**
     * <p>
     * The winner handle.
     * </p>
     */
    private String winnerHandle;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public PastContestDTO() {
        // Empty
    }

    /**
     * <p>
     * Getter method for completionDate, simply return the value of the namesake
     * field.
     * </p>
     * 
     * @return the completionDate
     */
    public Date getCompletionDate() {
        return completionDate;
    }

    /**
     * <p>
     * Setter method for the completionDate, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param completionDate
     *            The completion date of the contest
     */
    public void setCompletionDate(Date completionDate) {
        this.completionDate = completionDate;
    }

    /**
     * <p>
     * Getter method for passedScreeningCount, simply return the value of the
     * namesake field.
     * </p>
     * 
     * @return the passedScreeningCount
     */
    public int getPassedScreeningCount() {
        return passedScreeningCount;
    }

    /**
     * <p>
     * Setter method for the passedScreeningCount, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param passedScreeningCount
     *            The number of submissions that passed screening
     */
    public void setPassedScreeningCount(int passedScreeningCount) {
        this.passedScreeningCount = passedScreeningCount;
    }

    /**
     * <p>
     * Getter method for winnerProfileLink, simply return the value of the
     * namesake field.
     * </p>
     * 
     * @return the winnerProfileLink
     */
    public String getWinnerProfileLink() {
        return winnerProfileLink;
    }

    /**
     * <p>
     * Setter method for the winnerProfileLink, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param winnerProfileLink
     *            The link to the winner profile
     */
    public void setWinnerProfileLink(String winnerProfileLink) {
        this.winnerProfileLink = winnerProfileLink;
    }

    /**
     * <p>
     * Getter method for winnerScore, simply return the value of the namesake
     * field.
     * </p>
     * 
     * @return the winnerScore
     */
    public double getWinnerScore() {
        return winnerScore;
    }

    /**
     * <p>
     * Setter method for the winnerScore, simply set the value to the namesake
     * field.
     * </p>
     * 
     * @param winnerScore
     *            The winner score
     */
    public void setWinnerScore(double winnerScore) {
        this.winnerScore = winnerScore;
    }

    /**
     * <p>
     * Sets the winner handle.
     * </p>
     *
     * @param winnerHandle
     *            the winnerHandle to set
     */
    public void setWinnerHandle(String winnerHandle) {
        this.winnerHandle = winnerHandle;
    }

    /**
     * <p>
     * Gets the winner handle.
     * </p>
     *
     * @return the winnerHandle
     */
    public String getWinnerHandle() {
        return winnerHandle;
    }
}
