/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This enum defines the options of filtering on dates, such as filtering before/after/on a certain date,
 * between some dates, etc.
 * </p>
 * <p>
 * Thread Safety: This class is thread-safe because it's immutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public enum DateIntervalType {
    /**
     * This means the filtering condition is before certain date.
     */
    BEFORE,

    /**
     * This means the filtering condition is after certain date.
     */
    AFTER,

    /**
     * This means the filtering condition is on certain date.
     */
    ON,

    /**
     * This means the filtering condition is between 2 dates.
     */
    BETWEEN_DATES,

    /**
     * This means the filtering condition is before the current date.
     */
    BEFORE_CURRENT_DATE,

    /**
     * This means the filtering condition is after the current date.
     */
    AFTER_CURRENT_DATE
}
