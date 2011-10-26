/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a marker interface used by the caller of this component to suggest that all pages should be
 * returned or that the open interval should be used, such as when filtering on the prize money.
 * </p>
 * <p>
 * Thread Safety: This is a marker interface that has no method. So it's thread-safe.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public interface Filterable {
    /**
     * <p>
     * This means open interval should be used. For example, when filtering on prize money and prizeLowerBound
     * is set to this value, then the interval to filter is (-infinite,prizeUpperBound]. It's a constant. So
     * it can only be that constant value It is final and won't change once it is initialized as part of
     * variable declaration to: -1. It's not used within the class
     * </p>
     */
    public static final int OPEN_INTERVAL = -1;

    /**
     * <p>
     * This means no pagination should be performed and all data should be returned. It's a constant. So it
     * can only be that constant value It is final and won't change once it is initialized as part of variable
     * declaration to: -1. It's not used within the class
     * </p>
     */
    public static final int RETURN_ALL_PAGES = -1;
}
