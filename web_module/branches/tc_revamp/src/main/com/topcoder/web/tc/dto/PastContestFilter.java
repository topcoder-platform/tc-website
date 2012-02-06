/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This class defines the filtering condition for searching past contests.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * <p>
 * Changes in Version 1.1 : Added {@link #rollingYear} field.
 * </p>
 * 
 * <p>
 * Changes in Version 1.2 : Removed {@link #rollingYear} field.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER, bugbuka
 * @version 1.2
 */
public class PastContestFilter extends BaseFilter {
    /**
     * <p>
     * The winner handle. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setWinnerHandle(), getWinnerHandle().
     * </p>
     */
    private String winnerHandle;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public PastContestFilter() {
        // empty
    }

    /**
     * <p>
     * Getter method for winnerHandle, simply return the value of the namesake field.
     * </p>
     *
     * @return the winnerHandle
     */
    public String getWinnerHandle() {
        return winnerHandle;
    }

    /**
     * <p>
     * Setter method for the winnerHandle, simply set the value to the namesake field.
     * </p>
     *
     * @param winnerHandle
     *            The winner handle to set
     */
    public void setWinnerHandle(String winnerHandle) {
        this.winnerHandle = winnerHandle;
    }
}
