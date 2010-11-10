/*
 * StartDateCalculator.java
 *
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review;

import java.util.Calendar;
import java.util.Date;

/**
 * This interface must be implemented by classes in charge of calculating when a project must start, depending on
 * its type and after a specific date.
 *
 *
 * @author cucu
 */
public interface StartDateCalculator {

    /**
     * Calculate when a project should start, after startingFrom date.
     *
     * @param projectType type of project (design/dev constants)
     * @return the Date to start
     */
    Date calculateNextStart(long projectType);

    /**
     * Calculate when a project should start, after startingFrom date.
     *
     * @param startingFrom start after that date
     * @param projectType type of project (design/dev constants)
     * @return the Date to start
     */
    Date calculateNextStart(Calendar startingFrom, long projectType);
}
