package com.topcoder.dde.util.DWLoad.entity;

import java.util.List;

public class GroupsResult {
    private boolean success;
    private int status;
    private String metadata;
    private List<GroupDetail> content;

    public GroupsResult(){

    }

    public GroupsResult(boolean success, int status, String metadata, List<GroupDetail> content) {
        this.success = success;
        this.status = status;
        this.metadata = metadata;
        this.content = content;
    }

    public boolean isSuccess() {
        return this.success;
    }

    public boolean getSuccess() {
        return this.success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getStatus() {
        return this.status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMetadata() {
        return this.metadata;
    }

    public void setMetadata(String metadata) {
        this.metadata = metadata;
    }

    public List<GroupDetail> getContent() {
        return this.content;
    }

    public void setContent(List<GroupDetail> content) {
        this.content = content;
    }

    public GroupsResult success(boolean success) {
        this.success = success;
        return this;
    }

    public GroupsResult status(int status) {
        this.status = status;
        return this;
    }

    public GroupsResult metadata(String metadata) {
        this.metadata = metadata;
        return this;
    }

    public GroupsResult content(List<GroupDetail> content) {
        this.content = content;
        return this;
    }
}