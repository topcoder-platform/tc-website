package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class ProjectUserTask implements Serializable, Cloneable {

    private int project_user_task_id = 0;
    private int project_user_id = 0;
    private int project_task_id = 0;
    private Date assign_date;
    private int status_id = 0;

    public ProjectUserTask() {
    }

    public ProjectUserTask Clone() {
        ProjectUserTask result = new ProjectUserTask();
        result.setProject_user_task_id(getProject_user_task_id());
        result.setProject_user_id(getProject_user_id());
        result.setProject_task_id(getProject_task_id());
        result.setAssign_date(getAssign_date());
        result.setStatus_id(getStatus_id());
        return result;
    }

    public int getProject_user_task_id() {
        return this.project_user_task_id;
    }

    public void setProject_user_task_id(int intIn) {
        this.project_user_task_id = intIn;
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

    public Date getAssign_date() {
        return this.assign_date;
    }

    public void setAssign_date(Date datIn) {
        this.assign_date = datIn;
    }

    public int getStatus_id() {
        return this.status_id;
    }

    public void setStatus_id(int intIn) {
        this.status_id = intIn;
    }

}