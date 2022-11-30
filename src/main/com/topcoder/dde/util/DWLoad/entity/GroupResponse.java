package com.topcoder.dde.util.DWLoad.entity;

public class GroupResponse {
    private String id;
    private GroupResult result;
    private String version;

    public GroupResponse(){

    }

    public GroupResponse(String id, GroupResult result, String version) {
        this.id = id;
        this.result = result;
        this.version = version;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public GroupResult getResult() {
        return this.result;
    }

    public void setResult(GroupResult result) {
        this.result = result;
    }

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public GroupResponse id(String id) {
        this.id = id;
        return this;
    }

    public GroupResponse result(GroupResult result) {
        this.result = result;
        return this;
    }

    public GroupResponse version(String version) {
        this.version = version;
        return this;
    }

}