/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;

/**
 * <p>
 * This class is simply the Java mapped class for table project_result, so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ProjectResult implements Serializable {
    /**
     * <p>
     * The project id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setProjectId(), getProjectId().
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * The placement of the contestant. It has both getter and setter. It can be any value. It does not need
     * to be initialized when the instance is created. It is used in getPlaced(), setPlaced().
     * </p>
     */
    private long placed;

    /**
     * <p>
     * The final score. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setFinalScore(), getFinalScore().
     * </p>
     */
    private double finalScore;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ProjectResult() {
        // Empty
    }

    /**
     * <p>
     * Getter method for projectId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectId
     */
    public long getProjectId() {
        return projectId;
    }

    /**
     * <p>
     * Setter method for the projectId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectId
     *            the projectId to set
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>
     * Getter method for placed, simply return the value of the namesake field.
     * </p>
     *
     * @return the placed
     */
    public long getPlaced() {
        return placed;
    }

    /**
     * <p>
     * Setter method for the placed, simply set the value to the namesake field.
     * </p>
     *
     * @param placed
     *            the placed to set
     */
    public void setPlaced(long placed) {
        this.placed = placed;
    }

    /**
     * <p>
     * Getter method for finalScore, simply return the value of the namesake field.
     * </p>
     *
     * @return the finalScore
     */
    public double getFinalScore() {
        return finalScore;
    }

    /**
     * <p>
     * Setter method for the finalScore, simply set the value to the namesake field.
     * </p>
     *
     * @param finalScore
     *            the finalScore to set
     */
    public void setFinalScore(double finalScore) {
        this.finalScore = finalScore;
    }

}
