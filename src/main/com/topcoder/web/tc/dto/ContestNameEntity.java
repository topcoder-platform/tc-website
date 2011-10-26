/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a common entity for all DTO and filter classes which contains only the contest name field.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public abstract class ContestNameEntity {

    /**
     * Represents the name of contest. It can be any string value. It can be accessed through corresponding getter and
     * setter methods.
     */
    private String contestName;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    protected ContestNameEntity() {
    }

    /**
     * <p>
     * Gets the name of contest.
     * </p>
     * @return the name of contest.
     */
    public String getContestName() {
        return contestName;
    }

    /**
     * <p>
     * Sets the name of contest.
     * </p>
     * @param contestName
     *            the contest name to set.
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }
}
