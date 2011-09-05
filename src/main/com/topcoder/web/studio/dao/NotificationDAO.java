/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

/**
 * <p>Notification DAO.</p>
 * 
 * @author lmmortal
 * @version 1.0
 * @since TCCC-3529
 */
public interface NotificationDAO {
    /**
     * <p>Sets timeline notification for given user in given</p>
     *
     * @param projectId a <code>projectId</code> to set timeline notification.
     * @param userId a <code>userId</code> to set timeline notification.
     */
    public void setTimelineNotification(Integer projectId, Integer userId);
}
