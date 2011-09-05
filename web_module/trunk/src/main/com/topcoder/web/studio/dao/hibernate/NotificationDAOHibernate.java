/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import org.hibernate.Session;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.studio.dao.NotificationDAO;
import com.topcoder.web.studio.dto.Notification;

/**
 * <p>Notification DAO implementation.</p>
 * 
 * @author lmmortal
 * @version 1.0 (TCCC-3529)
 */
public class NotificationDAOHibernate extends Base implements NotificationDAO {

    /**
     * <p>Constructs new <code>NotificationDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public NotificationDAOHibernate() {
        super();
    }

    /**
     * <p>Constructs new <code>NotificationDAOHibernate</code> instance.</p>
     * 
     * @param session a <code>Session</code> providing current session. 
     */
    public NotificationDAOHibernate(Session session) {
        super(session);
    }

    /**
     * <p>Sets timeline notification for given user in given</p>
     *
     * @param projectId a <code>projectId</code> to set timeline notification.
     * @param userId a <code>userId</code> to set timeline notification.
     */
    public void setTimelineNotification(long projectId, long userId) {
        List<Notification> currentNotifications = session.createQuery(
                "FROM com.topcoder.web.studio.dto.Notification n  " +
                        "WHERE n.projectId = :projectId " +
                        "AND n.externalRefId = :externalRefId" +
                        "AND n.notificationTypeId = :notificationTypeId")
                .setInteger("projectId", projectId)
                .setInteger("externalRefId", userId)
                .setInteger("notificationTypeId", Notification.TIMELINE_NOTIFICATION_ID)
                .list();
        if (!currentNotifications.isEmpty()) {
            return;
        }
        Date now = new Date();
        Notification n = new Notification();
        n.setProjectId(projectId);
        n.setNotificationTypeId(Notification.TIMELINE_NOTIFICATION_ID);
        n.setExternalRefId(userId);
        n.setCreateUser(String.valueOf(userId));
        n.setCreateDate(now);
        n.setModifyUser(String.valueOf(userId));
        n.setModifyDate(now);
        saveOrUpdate(n);
    }
}
