package com.topcoder.dde.util.DWLoad.entity;

public class GroupResult {
    private boolean success;
    private int status;
    private String metadata;
    private GroupDetail content;

    public GroupResult(){

    }

    public GroupResult(boolean success, int status, String metadata, GroupDetail content) {
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

    public GroupDetail getContent() {
        return this.content;
    }

    public void setContent(GroupDetail content) {
        this.content = content;
    }

    public GroupResult success(boolean success) {
        this.success = success;
        return this;
    }

    public GroupResult status(int status) {
        this.status = status;
        return this;
    }

    public GroupResult metadata(String metadata) {
        this.metadata = metadata;
        return this;
    }

    public GroupResult content(GroupDetail content) {
        this.content = content;
        return this;
    }

}
