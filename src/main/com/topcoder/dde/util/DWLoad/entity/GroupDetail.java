package com.topcoder.dde.util.DWLoad.entity;

import java.util.List;

public class GroupDetail {
    private String id;
    private String oldId;
    private String ssoId;
    private String createdAt;
    private String createdBy;
    private String updatedBy;
    private String updatedAt;
    private boolean selfRegister;
    private String domain;
    private String name;
    private String description;
    private boolean privateGroup;

    public GroupDetail(String id, String oldId, String ssoId, String createdAt, String createdBy, String updatedBy, String updatedAt, boolean selfRegister, String domain, String name, String description, boolean privateGroup, String status, List<GroupDetail> subGroups, List<GroupDetail> parentGroups) {
        this.id = id;
        this.oldId = oldId;
        this.ssoId = ssoId;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
        this.updatedAt = updatedAt;
        this.selfRegister = selfRegister;
        this.domain = domain;
        this.name = name;
        this.description = description;
        this.privateGroup = privateGroup;
        this.status = status;
        this.subGroups = subGroups;
        this.parentGroups = parentGroups;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOldId() {
        return this.oldId;
    }

    public void setOldId(String oldId) {
        this.oldId = oldId;
    }

    public String getSsoId() {
        return this.ssoId;
    }

    public void setSsoId(String ssoId) {
        this.ssoId = ssoId;
    }

    public String getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedBy() {
        return this.updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdatedAt() {
        return this.updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public boolean isSelfRegister() {
        return this.selfRegister;
    }

    public boolean getSelfRegister() {
        return this.selfRegister;
    }

    public void setSelfRegister(boolean selfRegister) {
        this.selfRegister = selfRegister;
    }

    public String getDomain() {
        return this.domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPrivateGroup() {
        return this.privateGroup;
    }

    public boolean getPrivateGroup() {
        return this.privateGroup;
    }

    public void setPrivateGroup(boolean privateGroup) {
        this.privateGroup = privateGroup;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<GroupDetail> getSubGroups() {
        return this.subGroups;
    }

    public void setSubGroups(List<GroupDetail> subGroups) {
        this.subGroups = subGroups;
    }

    public List<GroupDetail> getParentGroups() {
        return this.parentGroups;
    }

    public void setParentGroups(List<GroupDetail> parentGroups) {
        this.parentGroups = parentGroups;
    }

    public GroupDetail id(String id) {
        this.id = id;
        return this;
    }

    public GroupDetail oldId(String oldId) {
        this.oldId = oldId;
        return this;
    }

    public GroupDetail ssoId(String ssoId) {
        this.ssoId = ssoId;
        return this;
    }

    public GroupDetail createdAt(String createdAt) {
        this.createdAt = createdAt;
        return this;
    }

    public GroupDetail createdBy(String createdBy) {
        this.createdBy = createdBy;
        return this;
    }

    public GroupDetail updatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
        return this;
    }

    public GroupDetail updatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
        return this;
    }

    public GroupDetail selfRegister(boolean selfRegister) {
        this.selfRegister = selfRegister;
        return this;
    }

    public GroupDetail domain(String domain) {
        this.domain = domain;
        return this;
    }

    public GroupDetail name(String name) {
        this.name = name;
        return this;
    }

    public GroupDetail description(String description) {
        this.description = description;
        return this;
    }

    public GroupDetail privateGroup(boolean privateGroup) {
        this.privateGroup = privateGroup;
        return this;
    }

    public GroupDetail status(String status) {
        this.status = status;
        return this;
    }

    public GroupDetail subGroups(List<GroupDetail> subGroups) {
        this.subGroups = subGroups;
        return this;
    }

    public GroupDetail parentGroups(List<GroupDetail> parentGroups) {
        this.parentGroups = parentGroups;
        return this;
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", oldId='" + getOldId() + "'" +
            ", ssoId='" + getSsoId() + "'" +
            ", createdAt='" + getCreatedAt() + "'" +
            ", createdBy='" + getCreatedBy() + "'" +
            ", updatedBy='" + getUpdatedBy() + "'" +
            ", updatedAt='" + getUpdatedAt() + "'" +
            ", selfRegister='" + isSelfRegister() + "'" +
            ", domain='" + getDomain() + "'" +
            ", name='" + getName() + "'" +
            ", description='" + getDescription() + "'" +
            ", privateGroup='" + isPrivateGroup() + "'" +
            ", status='" + getStatus() + "'" +
            ", subGroups='" + getSubGroups() + "'" +
            ", parentGroups='" + getParentGroups() + "'" +
            "}";
    }
    private String status;

    private List<GroupDetail> subGroups;
    private List<GroupDetail> parentGroups;

    public GroupDetail(){

    }


}
