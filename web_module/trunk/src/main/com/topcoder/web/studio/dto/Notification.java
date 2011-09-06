/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;
import java.util.Date;

/**
 * <p>An entity class mapped to <code>tcs_catalog.notification</code> table.</p>
 * 
 * @author lmmortal
 * @version 1.0 (TCCC-3529)
 */
public class Notification extends Base {

    /**
     * <p>A <code>Integer</code> providing the ID for <code>Timeline Notification</code> notification.</p>
     */
    public static final Integer TIMELINE_NOTIFICATION_ID = 1; 

    /**
     * <p>A <code>Integer</code> providing the ID of a project.</p>
     */
    protected Integer projectId;

    /**
     * <p>A <code>Long</code> providing external reference id of notification.</p>
     */
    protected Long externalRefId;

    /**
     * <p>A <code>Integer</code> providing notification type id.</p>
     */
    protected Integer notificationTypeId;

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
     * <p>Constructs new <code>Notification</code> instance. This implementation does nothing.</p>
     */
    public Notification() {
    }

    /**
     * <p>Gets the ID of a project.</p>
     *
     * @return a <code>Long</code> providing the ID of a project.
     */
    public Integer getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project.</p>
     *
     * @param projectId a <code>Integer</code> providing the ID of a project.
     */
    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the external reference id of the notification.</p>
     *
     * @return a <code>Long</code> providing the external reference id of the notification.
     */
    public Long getExternalRefId() {
        return this.externalRefId;
    }

    /**
     * <p>Sets the external reference id of a notification.</p>
     *
     * @param externalRefId a <code>Long</code> providing the external reference id of a notification.
     */
    public void setExternalRefId(Long externalRefId) {
        this.externalRefId = externalRefId;
    }

    /**
     * <p>Gets the notification type id.</p>
     *
     * @return a <code>Integer</code> providing the notification type id.
     */
    public Integer getNotificationTypeId() {
        return this.notificationTypeId;
    }

    /**
     * <p>Sets the notification type id.</p>
     *
     * @param notificationTypeId a <code>Integer</code> providing the notification type id.
     */
    public void setNotificationTypeId(Integer notificationTypeId) {
        this.notificationTypeId = notificationTypeId;
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
