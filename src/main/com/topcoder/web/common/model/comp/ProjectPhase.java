package com.topcoder.web.common.model.comp;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;


/**
 * @author cucu
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

    private Long id;
    private Project project;
    private Integer type;
    private Timestamp fixedStartTime;
    private Timestamp scheduledStartTime;
    private Timestamp scheduledEndTime;
    private Timestamp actualStartTime;
    private Timestamp actualEndTime;
    private Long duration;


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



}
