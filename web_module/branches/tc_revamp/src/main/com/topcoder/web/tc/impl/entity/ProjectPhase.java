/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * This class is simply the Java mapped class for table project_phase, so that this table can be used in HQL.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * <p>
 * Changes in Version 1.1: Added {@link #actualStartTime} field.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.1
 */
public class ProjectPhase implements Serializable {
    /**
     * <p>
     * The project phase id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setProjectPhaseId(), getProjectPhaseId().
     * </p>
     */
    private long projectPhaseId;

    /**
     * <p>
     * The project id. It has both getter and setter. It can be any value. It does not need to be initialized
     * when the instance is created. It is used in setProjectId(), getProjectId().
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * The phase type id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setPhaseTypeId(), getPhaseTypeId().
     * </p>
     */
    private long phaseTypeId;

    /**
     * <p>
     * The phase status id. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setPhaseStatusId(), getPhaseStatusId().
     * </p>
     */
    private long phaseStatusId;

    /**
     * <p>
     * The scheduled start time. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setScheduledStartTime(),
     * getScheduledStartTime().
     * </p>
     */
    private Date scheduledStartTime;

    /**
     * <p>
     * The scheduled end time. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setScheduledEndTime(), getScheduledEndTime().
     * </p>
     */
    private Date scheduledEndTime;

    /**
     * <p>
     * The actual start time. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setActualEndTime(), getActualEndTime().
     * </p>
     */
    private Date actualStartTime;
    
    /**
     * <p>
     * The actual end time. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setActualEndTime(), getActualEndTime().
     * </p>
     */
    private Date actualEndTime;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ProjectPhase() {
        // Empty
    }

    /**
     * <p>
     * Getter method for projectPhaseId, simply return the value of the namesake field.
     * </p>
     *
     * @return the projectPhaseId
     */
    public long getProjectPhaseId() {
        return projectPhaseId;
    }

    /**
     * <p>
     * Setter method for the projectPhaseId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectPhaseId
     *            the projectPhaseId to set
     */
    public void setProjectPhaseId(long projectPhaseId) {
        this.projectPhaseId = projectPhaseId;
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
     * Getter method for phaseTypeId, simply return the value of the namesake field.
     * </p>
     *
     * @return the phaseTypeId
     */
    public long getPhaseTypeId() {
        return phaseTypeId;
    }

    /**
     * <p>
     * Setter method for the phaseTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param phaseTypeId
     *            the phaseTypeId to set
     */
    public void setPhaseTypeId(long phaseTypeId) {
        this.phaseTypeId = phaseTypeId;
    }

    /**
     * <p>
     * Getter method for phaseStatusId, simply return the value of the namesake field.
     * </p>
     *
     * @return the phaseStatusId
     */
    public long getPhaseStatusId() {
        return phaseStatusId;
    }

    /**
     * <p>
     * Setter method for the phaseStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param phaseStatusId
     *            the phaseStatusId to set
     */
    public void setPhaseStatusId(long phaseStatusId) {
        this.phaseStatusId = phaseStatusId;
    }

    /**
     * <p>
     * Getter method for scheduledStartTime, simply return the value of the namesake field.
     * </p>
     *
     * @return the scheduledStartTime
     */
    public Date getScheduledStartTime() {
        return scheduledStartTime;
    }

    /**
     * <p>
     * Setter method for the scheduledStartTime, simply set the value to the namesake field.
     * </p>
     *
     * @param scheduledStartTime
     *            the scheduledStartTime to set
     */
    public void setScheduledStartTime(Date scheduledStartTime) {
        this.scheduledStartTime = scheduledStartTime;
    }

    /**
     * <p>
     * Getter method for scheduledEndTime, simply return the value of the namesake field.
     * </p>
     *
     * @return the scheduledEndTime
     */
    public Date getScheduledEndTime() {
        return scheduledEndTime;
    }

    /**
     * <p>
     * Setter method for the scheduledEndTime, simply set the value to the namesake field.
     * </p>
     *
     * @param scheduledEndTime
     *            the scheduledEndTime to set
     */
    public void setScheduledEndTime(Date scheduledEndTime) {
        this.scheduledEndTime = scheduledEndTime;
    }

    /**
     * <p>
     * Getter method for actualEndTime, simply return the value of the namesake field.
     * </p>
     *
     * @return the actualEndTime
     */
    public Date getActualEndTime() {
        return actualEndTime;
    }

    /**
     * <p>
     * Setter method for the actualEndTime, simply set the value to the namesake field.
     * </p>
     *
     * @param actualEndTime
     *            the actualEndTime to set
     */
    public void setActualEndTime(Date actualEndTime) {
        this.actualEndTime = actualEndTime;
    }

    /**
     * <p>
     * Getter method for actualStartTime, simply return the value of the namesake field.
     * </p>
     *
     * @return the actualStartTime
     */
    public Date getActualStartTime() {
        return actualStartTime;
    }

    /**
     * <p>
     * Setter method for the actualStartTime, simply set the value to the namesake field.
     * </p>
     *
     * @param actualStartTime
     *            the actualStartTime to set
     */
    public void setActualStartTime(Date actualStartTime) {
        this.actualStartTime = actualStartTime;
    }
}
