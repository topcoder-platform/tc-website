/*
 * Copyright (C) 2009-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;


/**
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #statusId} property with respective accessor/mutator methods.</li>
 *     <li>Added {@link #MILESTONE_SUBMISSION} constant.</li>
 *     <li>Added {@link #STATUS_SCHEDULED} constant.</li>
 *     <li>Added {@link #STATUS_OPEN} constant.</li>
 *     <li>Added {@link #STATUS_CLOSED} constant.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #MILESTONE_REVIEW} constant.</li>
 *   </ol>
 * </p>
 * 
 * @author cucu, isv, pvmagacho
 * @version 1.2
 */
public class ProjectPhase extends Base {

    public static final Integer REGISTRATION = 1;
    public static final Integer SUBMISSION = 2;
    public static final Integer SCREENING = 3;
    public static final Integer REVIEW = 4;
    public static final Integer APPEALS = 5;
    public static final Integer APPEALS_RESPONSE = 6;
    public static final Integer AGGREGATION = 7;
    public static final Integer AGGREGATION_REVIEW = 8;
    public static final Integer FINAL_FIX = 9;
    public static final Integer FINAL_REVIEW = 10;
    public static final Integer APPROVAL = 11;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Milestone Submission</code> phase type.</p>
     * 
     * @since 1.1
     */
    public static final Integer MILESTONE_SUBMISSION = 15;

    /**
     * <p>An <code>Integer</code> providing the ID for <code>Milestone Review</code> phase type.</p>
     * 
     * @since 1.1
     */
    public static final Integer MILESTONE_REVIEW = 17;
    
    /**
     * <p>An <code>Integer</code> providing the ID for <code>Specification Submission</code> phase type.</p>
     * 
     * @since 1.1
     */
    public static final Integer SPECIFICATION_SUBMISSION = 13;

    /**
     * <p>A <code>long</code> providing the ID for <code>Scheduled</code> phase status.</p>
     * 
     * @since 1.1
     */
    public static final long STATUS_SCHEDULED = 1; 

    /**
     * <p>A <code>long</code> providing the ID for <code>Open</code> phase status.</p>
     * 
     * @since 1.1
     */
    public static final long STATUS_OPEN = 2; 

    /**
     * <p>A <code>long</code> providing the ID for <code>Closed</code> phase status.</p>
     * 
     * @since 1.1
     */
    public static final long STATUS_CLOSED = 3; 

    private Long id;
    private Project project;
    private Integer type;
    private Timestamp fixedStartTime;
    private Timestamp scheduledStartTime;
    private Timestamp scheduledEndTime;
    private Timestamp actualStartTime;
    private Timestamp actualEndTime;
    private Long duration;

    /**
     * <p>A <code>Long</code> providing the ID of the status of this phase.</p>
     * 
     * @since 1.1
     */
    private Long statusId;

    /**
     * <p>Constructs new <code>ProjectPhase</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public ProjectPhase() {
    }

    public Timestamp getActualEndTime() {
        return actualEndTime;
    }
    public void setActualEndTime(Timestamp actualEndTime) {
        this.actualEndTime = actualEndTime;
    }
    public Timestamp getActualStartTime() {
        return actualStartTime;
    }
    public void setActualStartTime(Timestamp actualStartTime) {
        this.actualStartTime = actualStartTime;
    }
    public Long getDuration() {
        return duration;
    }
    public void setDuration(Long duration) {
        this.duration = duration;
    }
    public Timestamp getFixedStartTime() {
        return fixedStartTime;
    }
    public void setFixedStartTime(Timestamp fixedStartTime) {
        this.fixedStartTime = fixedStartTime;
    }
    public Timestamp getScheduledEndTime() {
        return scheduledEndTime;
    }
    public void setScheduledEndTime(Timestamp scheduledEndTime) {
        this.scheduledEndTime = scheduledEndTime;
    }
    public Timestamp getScheduledStartTime() {
        return scheduledStartTime;
    }
    public void setScheduledStartTime(Timestamp scheduledStartTime) {
        this.scheduledStartTime = scheduledStartTime;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Project getProject() {
        return project;
    }
    public void setProject(Project project) {
        this.project = project;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * <p>Gets the ID of the status of this phase.</p>
     *
     * @return a <code>Long</code> providing the ID of the status of this phase.
     * @since 1.1
     */
    public Long getStatusId() {
        return this.statusId;
    }

    /**
     * <p>Sets the ID of the status of this phase.</p>
     *
     * @param statusId a <code>Long</code> providing the ID of the status of this phase.
     * @since 1.1
     */
    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }
}
