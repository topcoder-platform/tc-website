/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table 'contest_eligibility', so that this table can be used
 * in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ContestEligibility implements Serializable {
    /**
     * <p>
     * The contest eligibility id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setContestEligibilityId(),
     * getContestEligibilityId().
     * </p>
     */
    private long contestEligibilityId;

    /**
     * <p>
     * The contest id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setContestId(), getContestId().
     * </p>
     */
    private long contestId;

    /**
     * <p>
     * The flag that if is true means the contest is a studio contest. It has both getter and setter. It can
     * be any value. It does not need to be initialized when the instance is created. It is used in
     * setStudio(), isStudio().
     * </p>
     */
    private boolean studio;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ContestEligibility() {
        // Empty
    }

    /**
     * <p>
     * Getter method for contestEligibilityId, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestEligibilityId
     */
    public long getContestEligibilityId() {
        return contestEligibilityId;
    }

    /**
     * <p>
     * Setter method for the contestEligibilityId, simply set the value to the namesake field.
     * </p>
     *
     * @param contestEligibilityId
     *            the contestEligibilityId to set
     */
    public void setContestEligibilityId(long contestEligibilityId) {
        this.contestEligibilityId = contestEligibilityId;
    }

    /**
     * <p>
     * Getter method for contestId, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestId
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * <p>
     * Setter method for the contestId, simply set the value to the namesake field.
     * </p>
     *
     * @param contestId
     *            the contestId to set
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }

    /**
     * <p>
     * Getter method for studio, simply return the value of the namesake field.
     * </p>
     *
     * @return the studio
     */
    public boolean isStudio() {
        return studio;
    }

    /**
     * <p>
     * Setter method for the studio, simply set the value to the namesake field.
     * </p>
     *
     * @param studio
     *            the studio to set
     */
    public void setStudio(boolean studio) {
        this.studio = studio;
    }
}
