/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This class defines the common properties of all DTO classes in this component.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * 
 * <p>
 * Changes in Version 1.1 : Added {@link #contestId} field.
 * </p>
 *
 * <p>
 * Changes in Version 1.2 : Removed subType property and corresponding getter/setter methods.
 * </p>
 *
 * @author flytoj2ee, duxiaoyang, pinoydream
 * @version 1.2
 */
public abstract class AbstractContestDTO extends ContestNameEntity {
    /**
     * Represents the contest id.
     */
    private long contestId;
    
    /**
     * Represents the type of contest. It can be any string value. It can be accessed through corresponding getter and
     * setter methods.
     */
    private String type;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    protected AbstractContestDTO() {
    }

    /**
     * <p>
     * Gets the type of contest.
     * </p>
     * @return the type of contest.
     */
    public String getType() {
        return type;
    }

    /**
     * <p>
     * Sets the type of contest.
     * </p>
     * @param type
     *            the contest type to set.
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * <p>
     * Gets the contest id.
     * </p>
     *
     * @return the contest id.
     */
    public long getContestId() {
        return contestId;
    }

    /**
     * <p>
     * Sets the contest id.
     * </p>
     *
     * @param contestId the contest id.
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }
}
