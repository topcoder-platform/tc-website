/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This class defines the common properties for filters that filter on prize.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public abstract class BasePrizeFilter extends BaseFilter {
    /**
     * <p>
     * The lower bound of the prize (inclusive). It has both getter and setter. It can be any value. It does
     * not need to be initialized when the instance is created. It is used in setPrizeLowerBound(),
     * getPrizeLowerBound().
     * </p>
     */
    private Integer prizeLowerBound;

    /**
     * <p>
     * The upper bound of the prize (inclusive). It has both getter and setter. It can be any value. It does
     * not need to be initialized when the instance is created. It is used in setPrizeUpperBound(),
     * getPrizeUpperBound().
     * </p>
     */
    private Integer prizeUpperBound;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    protected BasePrizeFilter() {
        // Empty
    }

    /**
     * <p>
     * Getter method for prizeLowerBound, simply return the value of the namesake field.
     * </p>
     *
     * @return the prizeLowerBound
     */
    public Integer getPrizeLowerBound() {
        return prizeLowerBound;
    }

    /**
     * <p>
     * Setter method for the prizeLowerBound, simply set the value to the namesake field.
     * </p>
     *
     * @param prizeLowerBound
     *            The lower bound of the prize (inclusive)
     */
    public void setPrizeLowerBound(Integer prizeLowerBound) {
        this.prizeLowerBound = prizeLowerBound;
    }

    /**
     * <p>
     * Getter method for prizeUpperBound, simply return the value of the namesake field.
     * </p>
     *
     * @return the prizeUpperBound
     */
    public Integer getPrizeUpperBound() {
        return prizeUpperBound;
    }

    /**
     * <p>
     * Setter method for the prizeUpperBound, simply set the value to the namesake field.
     * </p>
     *
     * @param prizeUpperBound
     *            The upper bound of the prize (inclusive)
     */
    public void setPrizeUpperBound(Integer prizeUpperBound) {
        this.prizeUpperBound = prizeUpperBound;
    }

}
