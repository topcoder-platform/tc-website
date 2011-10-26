/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This class is a simple container class that defines the filtering condition on dates, such as filtering on
 * data that is between a start date and end date.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class DateIntervalSpecification {
    /**
     * <p>
     * The date interval type. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getIntervalType(), setIntervalType().
     * </p>
     */
    private DateIntervalType intervalType;

    /**
     * <p>
     * The first date used to specify the date interval. It has both getter and setter. It can be any value.
     * It does not need to be initialized when the instance is created. It is used in setFirstDate(),
     * getFirstDate().
     * </p>
     */
    private Date firstDate;

    /**
     * <p>
     * The second date used to specify the date interval. If the DateIntervalType only involves one date, then
     * this value is irrelevant. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSecondDate(), getSecondDate().
     * </p>
     */
    private Date secondDate;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public DateIntervalSpecification() {
        // Empty
    }

    /**
     * <p>
     * Getter method for intervalType, simply return the value of the namesake field.
     * </p>
     *
     * @return the intervalType
     */
    public DateIntervalType getIntervalType() {
        return intervalType;
    }

    /**
     * <p>
     * Setter method for the intervalType, simply set the value to the namesake field.
     * </p>
     *
     * @param intervalType
     *            The date interval type.
     */
    public void setIntervalType(DateIntervalType intervalType) {
        this.intervalType = intervalType;
    }

    /**
     * <p>
     * Getter method for firstDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the firstDate
     */
    public Date getFirstDate() {
        return firstDate;
    }

    /**
     * <p>
     * Setter method for the firstDate, simply set the value to the namesake field.
     * </p>
     *
     * @param firstDate
     *            The first date used to specify the date interval.
     */
    public void setFirstDate(Date firstDate) {
        this.firstDate = firstDate;
    }

    /**
     * <p>
     * Getter method for secondDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the secondDate
     */
    public Date getSecondDate() {
        return secondDate;
    }

    /**
     * <p>
     * Setter method for the secondDate, simply set the value to the namesake field.
     * </p>
     *
     * @param secondDate
     *            The second date used to specify the date interval. If the DateIntervalType only involves one
     *            date, then this value is irrelevant.
     */
    public void setSecondDate(Date secondDate) {
        this.secondDate = secondDate;
    }
}
