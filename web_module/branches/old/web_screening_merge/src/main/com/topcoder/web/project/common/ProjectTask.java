package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class ProjectTask implements Serializable, Cloneable {

    private int project_task_id = 0;
    private int project_id = 0;
    private String name = "";
    private String project_task_desc = "";
    private Date start_date;
    private Date end_date;
    private int status_id = 0;
    private int milestone = 0;
    private Date creation_date;
    private Date modify_date;
    private Date completion_date;

    public ProjectTask() {
    }

    public ProjectTask Clone() {
        ProjectTask result = new ProjectTask();
        result.setProject_task_id(getProject_task_id());
        result.setProject_id(getProject_id());
        result.setName(getName());
        result.setProject_task_desc(getProject_task_desc());
        result.setStart_date(getStart_date());
        result.setEnd_date(getEnd_date());
        result.setStatus_id(getStatus_id());
        result.setMilestone(getMilestone());
        result.setCreation_date(getCreation_date());
        result.setModify_date(getModify_date());
        result.setCompletion_date(getCompletion_date());
        return result;
    }

    public int getProject_task_id() {
        return this.project_task_id;
    }

    public void setProject_task_id(int intIn) {
        this.project_task_id = intIn;
    }

    public int getProject_id() {
        return this.project_id;
    }

    public void setProject_id(int intIn) {
        this.project_id = intIn;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String strIn) {
        this.name = strIn;
    }

    public String getProject_task_desc() {
        return this.project_task_desc;
    }

    public void setProject_task_desc(String strIn) {
        this.project_task_desc = strIn;
    }

    public Date getStart_date() {
        return this.start_date;
    }

    public void setStart_date(Date datIn) {
        this.start_date = datIn;
    }

    public Date getEnd_date() {
        return this.end_date;
    }

    public void setEnd_date(Date datIn) {
        this.end_date = datIn;
    }

    public int getStatus_id() {
        return this.status_id;
    }

    public void setStatus_id(int intIn) {
        this.status_id = intIn;
    }

    public int getMilestone() {
        return this.milestone;
    }

    public void setMilestone(int intIn) {
        this.milestone = intIn;
    }

    public Date getCreation_date() {
        return this.creation_date;
    }

    public void setCreation_date(Date datIn) {
        this.creation_date = datIn;
    }

    public Date getModify_date() {
        return this.modify_date;
    }

    public void setModify_date(Date datIn) {
        this.modify_date = datIn;
    }

    public Date getCompletion_date() {
        return this.completion_date;
    }

    public void setCompletion_date(Date datIn) {
        this.completion_date = datIn;
    }
}