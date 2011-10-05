/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * <p>An entity mapped to <code>tcs_catalog:resource</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Replatforming Studio Release 1 Assembly)
 */
public class Resource extends Base {

    /**
     * <p>A <code>Long</code> providing the ID of a resource.</p>
     */
    protected Long id;

    /**
     * <p>A <code>Long</code> providing the ID of a project.</p>
     */
    protected Long projectId;

    /**
     * <p>A <code>ResourceRole</code> providing the role assigned to this resource.</p>
     */
    protected ResourceRole role;

    /**
     * <p>A <code>Long</code> providing the ID of a project phase.</p>
     */
    protected Long phaseId;

    /**
     * <p>A <code>Set</code> mapping the info type IDs to values.</p>
     */
    protected Set<ResourceInfo> info = new HashSet<ResourceInfo>();

    /**
     * <p>A <code>String</code> providing the ID for record creator.</p>
     */
    private String createUser;

    /**
     * <p>A <code>String</code> providing the ID for record updater.</p>
     */
    private String modifyUser;

    /**
     * <p>A <code>Date</code> providing the date of record creation.</p>
     */
    private Date createDate;

    /**
     * <p>A <code>Date</code> providing the date for record modification.</p>
     */
    private Date modifyDate;

    /**
     * <p>Constructs new <code>Resource</code> instance. This implementation does nothing.</p>
     */
    public Resource() {
    }

    /**
     * <p>Gets the ID of a resource.</p>
     *
     * @return a <code>Long</code> providing the ID of a resource.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of a resource.</p>
     *
     * @param id a <code>Long</code> providing the ID of a resource.
     */
    public void setId(Long id) {
        this.id = id;
    }

    public ResourceRole getRole() {
        return role;
    }

    public void setRole(ResourceRole role) {
        this.role = role;
    }

    /**
     * <p>Gets the ID of a project.</p>
     *
     * @return a <code>Long</code> providing the ID of a project.
     */
    public Long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project.</p>
     *
     * @param projectId a <code>Long</code> providing the ID of a project.
     */
    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the resource info.</p>
     * 
     * @return a <code>Set</code> mapping the info type IDs to values.
     */
    public Set<ResourceInfo> getInfo() {
        return info;
    }

    /**
     * <p>Sets the resource info.</p>
     * 
     * @param info a <code>Set</code> mapping the info type IDs to values.
     */
    public void setInfo(Set<ResourceInfo> info) {
        this.info = info;
    }

    /**
     * <p>Gets the ID of a project phase.</p>
     *
     * @return a <code>Long</code> providing the ID of a project phase.
     */
    public Long getPhaseId() {
        return this.phaseId;
    }

    /**
     * <p>Sets the ID of a project phase.</p>
     *
     * @param phaseId a <code>Long</code> providing the ID of a project phase.
     */
    public void setPhaseId(Long phaseId) {
        this.phaseId = phaseId;
    }
    /**
     * <p>Gets the date for record modification.</p>
     *
     * @return a <code>Date</code> providing the date for record modification.
     */
    public Date getModifyDate() {
        return this.modifyDate;
    }

    /**
     * <p>Sets the date for record modification.</p>
     *
     * @param modifyDate a <code>Date</code> providing the date for record modification.
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * <p>Gets the date of record creation.</p>
     *
     * @return a <code>Date</code> providing the date of record creation.
     */
    public Date getCreateDate() {
        return this.createDate;
    }

    /**
     * <p>Sets the date of record creation.</p>
     *
     * @param createDate a <code>Date</code> providing the date of record creation.
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * <p>Gets the ID for record updater.</p>
     *
     * @return a <code>String</code> providing the ID for record updater.
     */
    public String getModifyUser() {
        return this.modifyUser;
    }

    /**
     * <p>Sets the ID for record updater.</p>
     *
     * @param modifyUser a <code>String</code> providing the ID for record updater.
     */
    public void setModifyUser(String modifyUser) {
        this.modifyUser = modifyUser;
    }

    /**
     * <p>Gets the ID for record creator.</p>
     *
     * @return a <code>String</code> providing the ID for record creator.
     */
    public String getCreateUser() {
        return this.createUser;
    }

    /**
     * <p>Sets the ID for record creator.</p>
     *
     * @param createUser a <code>String</code> providing the ID for record creator.
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

}
