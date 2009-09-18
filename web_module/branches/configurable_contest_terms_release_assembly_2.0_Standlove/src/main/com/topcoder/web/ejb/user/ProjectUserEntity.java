package com.topcoder.web.ejb.user;

import java.io.Serializable;
import java.util.Date;

public class ProjectUserEntity implements Serializable {
	
	private long projectId;
	private long resourceUserId;
	private long resourceRoleId;
	private long auditActionTypeId;
	private long actionUserId;
	private Date actionDate;
	
	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	public long getResourceUserId() {
		return resourceUserId;
	}

	public void setResourceUserId(long resourceUserId) {
		this.resourceUserId = resourceUserId;
	}

	public long getResourceRoleId() {
		return resourceRoleId;
	}

	public void setResourceRoleId(long resourceRoleId) {
		this.resourceRoleId = resourceRoleId;
	}

	public long getAuditActionTypeId() {
		return auditActionTypeId;
	}

	public void setAuditActionTypeId(long auditActionTypeId) {
		this.auditActionTypeId = auditActionTypeId;
	}

	public long getActionUserId() {
		return actionUserId;
	}

	public void setActionUserId(long actionUserId) {
		this.actionUserId = actionUserId;
	}

	public Date getActionDate() {
		return actionDate;
	}

	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}

	public ProjectUserEntity() {}
	
}
