package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class Project implements Serializable, Cloneable {

    private int project_id = 0;
    private String name = "";
    private String project_desc = "";
    private Date start_date;
    private Date deadline_date;
    private int status_id = 0;
    private Date creation_date;
    private Date modify_date;
    private Date completion_date;
    private int tech_lead = 0;

    public Project() {
    }

    public Project Clone() {
        Project result = new Project();
        result.setProject_id(getProject_id());
        result.setName(getName());
        result.setProject_desc(getProject_desc());
        result.setStart_date(getStart_date());
        result.setDeadline_date(getDeadline_date());
        result.setStatus_id(getStatus_id());
        result.setCreation_date(getCreation_date());
        result.setModify_date(getModify_date());
        result.setCompletion_date(getCompletion_date());
        result.setTech_lead(getTech_lead());
        return result;
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

    public String getProject_desc() {
        return this.project_desc;
    }

    public void setProject_desc(String strIn) {
        this.project_desc = strIn;
    }

    public Date getStart_date() {
        return this.start_date;
    }

    public void setStart_date(Date datIn) {
        this.start_date = datIn;
    }

    public Date getDeadline_date() {
        return this.deadline_date;
    }

    public void setDeadline_date(Date datIn) {
        this.deadline_date = datIn;
    }

    public int getStatus_id() {
        return this.status_id;
    }

    public void setStatus_id(int intIn) {
        this.status_id = intIn;
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

    public int getTech_lead() {
        return this.tech_lead;
    }

    public void setTech_lead(int intIn) {
        this.tech_lead = intIn;
    }
}