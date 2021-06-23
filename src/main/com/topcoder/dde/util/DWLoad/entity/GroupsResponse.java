package com.topcoder.dde.util.DWLoad.entity;


public class GroupsResponse {
    private String id;
    private GroupsResult result;
    private String version;

    public GroupsResponse(){

    }

    public GroupsResponse(String id, GroupsResult result, String version) {
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

    public GroupsResult getResult() {
        return this.result;
    }

    public void setResult(GroupsResult result) {
        this.result = result;
    }

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public GroupsResponse id(String id) {
        this.id = id;
        return this;
    }

    public GroupsResponse result(GroupsResult result) {
        this.result = result;
        return this;
    }

    public GroupsResponse version(String version) {
        this.version = version;
        return this;
    }
}