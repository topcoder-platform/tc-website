package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class ProjectIssue implements Serializable, Cloneable {

    private int project_issue_id = 0;
    private int project_id = 0;
    private String issue_text = "";
    private Date open_date;
    private Date close_date;

    public ProjectIssue() {
    }

    public ProjectIssue Clone() {
        ProjectIssue result = new ProjectIssue();
        result.setProject_issue_id(getProject_issue_id());
        result.setProject_id(getProject_id());
        result.setIssue_text(getIssue_text());
        result.setOpen_date(getOpen_date());
        result.setClose_date(getClose_date());
        return result;
    }

    public int getProject_issue_id() {
        return this.project_issue_id;
    }

    public void setProject_issue_id(int intIn) {
        this.project_issue_id = intIn;
    }

    public int getProject_id() {
        return this.project_id;
    }

    public void setProject_id(int intIn) {
        this.project_id = intIn;
    }

    public String getIssue_text() {
        return this.issue_text;
    }

    public void setIssue_text(String strIn) {
        this.issue_text = strIn;
    }

    public Date getOpen_date() {
        return this.open_date;
    }

    public void setOpen_date(Date datIn) {
        this.open_date = datIn;
    }

    public Date getClose_date() {
        return this.close_date;
    }

    public void setClose_date(Date datIn) {
        this.close_date = datIn;
    }

}