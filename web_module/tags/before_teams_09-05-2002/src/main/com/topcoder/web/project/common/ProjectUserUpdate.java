package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class ProjectUserUpdate implements Serializable, Cloneable {

    private int project_user_update_id = 0;
    private int project_user_id = 0;
    private int project_task_id = 0;
    private String update_notes = "";
    private Date creation_date;
    private Date modify_date;

    public ProjectUserUpdate() {
    }

    public ProjectUserUpdate Clone() {
        ProjectUserUpdate result = new ProjectUserUpdate();
        result.setProject_user_update_id(getProject_user_update_id());
        result.setProject_user_id(getProject_user_id());
        result.setProject_task_id(getProject_task_id());
        result.setUpdate_notes(getUpdate_notes());
        result.setCreation_date(getCreation_date());
        result.setModify_date(getModify_date());
        return result;
    }

    public int getProject_user_update_id() {
        return this.project_user_update_id;
    }

    public void setProject_user_update_id(int intIn) {
        this.project_user_update_id = intIn;
    }

    public int getProject_user_id() {
        return this.project_user_id;
    }

    public void setProject_user_id(int intIn) {
        this.project_user_id = intIn;
    }

    public int getProject_task_id() {
        return this.project_task_id;
    }

    public void setProject_task_id(int intIn) {
        this.project_task_id = intIn;
    }

    public String getUpdate_notes() {
        return this.update_notes;
    }

    public void setUpdate_notes(String strIn) {
        this.update_notes = strIn;
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
}