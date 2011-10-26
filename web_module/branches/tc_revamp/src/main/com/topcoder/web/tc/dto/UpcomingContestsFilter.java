/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

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
public class UpcomingContestsFilter extends AbstractContestsFilter {

    /**
     * Represents the start value of first prize. It can be any integer value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private Integer prizeStart;

    /**
     * Represents the end value of first prize. It can be any integer value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private Integer prizeEnd;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public UpcomingContestsFilter() {
    }

    /**
     * <p>
     * Gets the start value of first prize.
     * </p>
     * @return the start value of first prize.
     */
    public Integer getPrizeStart() {
        return prizeStart;
    }

    /**
     * <p>
     * Sets the start value of first prize.
     * </p>
     * @param prizeStart
     *            the start value of first prize to set.
     */
    public void setPrizeStart(Integer prizeStart) {
        this.prizeStart = prizeStart;
    }

    /**
     * <p>
     * Gets the end value of first prize.
     * </p>
     * @return the end value of first prize.
     */
    public Integer getPrizeEnd() {
        return prizeEnd;
    }

    /**
     * <p>
     * Sets the end value of first prize.
     * </p>
     * @param prizeEnd
     *            the end value of first prize to set.
     */
    public void setPrizeEnd(Integer prizeEnd) {
        this.prizeEnd = prizeEnd;
    }
}
