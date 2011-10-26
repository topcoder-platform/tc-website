/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a filter class for searching contests.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public class ContestsFilter extends AbstractContestsFilter {

    /**
     * Represents the finalization date of contest. It can be any value. It can be accessed through corresponding getter
     * and setter methods.
     */
    private DateIntervalSpecification contestFinalization;

    /**
     * Represents the winner handle of contest. It can be any string value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private String winnerHandle;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public ContestsFilter() {
    }

    /**
     * <p>
     * Gets the finalization date of contest.
     * </p>
     * @return the finalization date of contest.
     */
    public DateIntervalSpecification getContestFinalization() {
        return contestFinalization;
    }

    /**
     * <p>
     * Sets the finalization date of contest.
     * </p>
     * @param contestFinalization
     *            the contest finalization date to set.
     */
    public void setContestFinalization(DateIntervalSpecification contestFinalization) {
        this.contestFinalization = contestFinalization;
    }

    /**
     * <p>
     * Gets the winner handle of contest.
     * </p>
     * @return the winner handle of contest.
     */
    public String getWinnerHandle() {
        return winnerHandle;
    }

    /**
     * <p>
     * Sets the winner handle of contest.
     * </p>
     * @param winnerHandle
     *            the contest winner handle to set.
     */
    public void setWinnerHandle(String winnerHandle) {
        this.winnerHandle = winnerHandle;
    }
}
