/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import com.topcoder.web.studio.dto.ContestStatistics;

/**
 * <p>An extension of {@link ContestStatistics} class to be used for testing purposes only. This extension defines
 * additional statistics attribute to hold the number of contests which the user has submitted to.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ContestStatisticsExt extends ContestStatistics {

    /**
     * <p>An <code>int</code> providing the number of contests which the user has submitted submissions for.</p>
     */
    private int contestsSubmitted = 0;

    /**
     * <p>Constructs new <code>ContestStatisticsExt</code> instance. This implementation does nothing.</p>
     */
    public ContestStatisticsExt() {
    }

    /**
     * <p>Gets the number of contests the user has submitted for.</p>
     *
     * @return an <code>int</code> providing the number of contests which the user has submitted submissions for.
     */
    public int getContestsSubmitted() {
        return this.contestsSubmitted;
    }

    /**
     * <p>Sets the number of contests the user has submitted for.</p>
     *
     * @param contestsSubmitted an <code>int</code> providing the number of contests which the user has submitted
     *        submissions for.
     */
    public void setContestsSubmitted(int contestsSubmitted) {
        this.contestsSubmitted = contestsSubmitted;
    }
}
