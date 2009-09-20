/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.projectuser;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * Represents the entity containing the project resource to audit.
 * 
 * @author ASSEMBLER
 * @version 1.0
 */
public class ProjectUserEntity implements Serializable {
	
	/**
	 * The project id.
	 */
	private long projectId;
	
	/**
	 * The resource user id.
	 */
	private long resourceUserId;
	
	/**
	 * The resource role id.
	 */
	private long resourceRoleId;
	
	/**
	 * The audit action type id.
	 */
	private long auditActionTypeId;
	
	/**
	 * The action user id.
	 */
	private long actionUserId;
	
	/**
	 * The audit action date. 
	 */
	private Date actionDate;
	
	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return project id.
	 */
	public long getProjectId() {
		return projectId;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param projectId project id.
	 */
	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return resource user id.
	 */
	public long getResourceUserId() {
		return resourceUserId;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param resourceUserId resource user id.
	 */
	public void setResourceUserId(long resourceUserId) {
		this.resourceUserId = resourceUserId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return resource role id.
	 */
	public long getResourceRoleId() {
		return resourceRoleId;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param resourceRoleId resource role id.
	 */
	public void setResourceRoleId(long resourceRoleId) {
		this.resourceRoleId = resourceRoleId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return audit action type id.
	 */
	public long getAuditActionTypeId() {
		return auditActionTypeId;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param auditActionTypeId audit action type id.
	 */
	public void setAuditActionTypeId(long auditActionTypeId) {
		this.auditActionTypeId = auditActionTypeId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return action user id.
	 */
	public long getActionUserId() {
		return actionUserId;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param actionUserId action user id.
	 */
	public void setActionUserId(long actionUserId) {
		this.actionUserId = actionUserId;
	}

	/**
	 * Getter for the namesake instance variable. 
	 * 
	 * @return audit action date. 
	 */
	public Date getActionDate() {
		return actionDate;
	}

	/**
	 * Setter for the namesake instance variable. 
	 * 
	 * @param actionDate audit action date. 
	 */
	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}

	/**
	 * Empty constructor.
	 */
	public ProjectUserEntity() {}
	
}
