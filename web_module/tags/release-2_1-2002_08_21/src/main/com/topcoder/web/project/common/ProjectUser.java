package com.topcoder.web.project.common;

import java.io.Serializable;

public class ProjectUser implements Serializable, Cloneable {

    private int project_user_id = 0;
    private int project_id = 0;
    private int user_id = 0;
    private int role_id = 0;
    private int status_id = 0;

    public ProjectUser() {
    }

    public ProjectUser Clone() {
        ProjectUser result = new ProjectUser();
        result.setProject_user_id(getProject_user_id());
        result.setProject_id(getProject_id());
        result.setUser_id(getUser_id());
        result.setRole_id(getRole_id());
        result.setStatus_id(getStatus_id());
        return result;
    }

    public int getProject_user_id() {
        return this.project_user_id;
    }

    public void setProject_user_id(int intIn) {
        this.project_user_id = intIn;
    }

    public int getProject_id() {
        return this.project_id;
    }

    public void setProject_id(int intIn) {
        this.project_id = intIn;
    }

    public int getUser_id() {
        return this.user_id;
    }

    public void setUser_id(int intIn) {
        this.user_id = intIn;
    }

    public int getRole_id() {
        return this.role_id;
    }

    public void setRole_id(int intIn) {
        this.role_id = intIn;
    }

    public int getStatus_id() {
        return this.status_id;
    }

    public void setStatus_id(int intIn) {
        this.status_id = intIn;
    }

}