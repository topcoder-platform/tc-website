/*
 * ProjectTracker.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;

/*
import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.security.TCSubject;
import com.topcoder.util.TCException;
import java.sql.Date;
*/

import java.util.Properties;
import java.util.Set;

import java.rmi.RemoteException;

import javax.ejb.EJBObject;


/**
 *
 *
 * @author cucu, isv
 * @version 1.1 04/22/2005
 */
public interface Notification extends EJBObject {

    public static final int FORUM_POST_TYPE_ID = 1;
    public static final int COMPONENT_REQUESTED_TYPE_ID = 2;
    public static final String WRITER_NAME = "WRITER_NAME";
    public static final String IS_NEW_THREAD = "IS_NEW_THREAD";
    public static final String THREAD_NAME = "THREAD_NAME";
    public static final String LINK = "LINK";
    public static final String COMPONENT_NAME  = "COMPONENT_NAME";
    public static final String REQUESTOR_NAME = "REQUESTOR_NAME";


    public long createEvent(String event, long typeId) throws RemoteException;

    public void createNotification(String event, long userId, long typeId) throws RemoteException;

    public void notifyEvent(String event, Properties prop) throws RemoteException;

    /**
     * <p>Gets the notification events which are assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events assigned
     *         to requested user. May return an empty set if there are no notification events assigned to requested user
     *         but never returns <code>null</code>.
     * @throws RemoteException
     */
    public Set getAssignedEvents(long userId) throws RemoteException;

    /**
     * <p>Gets the notification events which are not assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the non-assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events which are
     *         not assigned to requested user. May return an empty set if all existing notification events are already
     *         assigned to requested user but never returns <code>null</code>.
     * @throws RemoteException
     */
    public Set getUnassignedEvents(long userId) throws RemoteException;

    /**
     * <p>Unassigns specified notification event from specified user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to unassign the requested notification event from.
     * @param eventId a <code>long</code> providing the ID of a notification event to unassign from the requested user.
     * @throws RemoteException
     */
    public void unassignEvent(long userId, long eventId) throws RemoteException;
}
