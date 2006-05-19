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

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Properties;
import java.util.Set;
import java.rmi.RemoteException;
import java.sql.SQLException;
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

    /**
     * <p>Storea a new event in the database.</p>
     *
     * @param event a <code>String</code> providing the the event name.
     * @param description a <code>String</code> providing the description of new notification event.
     * @param typeId a <code>long</code> providing the type of event, as defined in table notification_mail_type_lu.
     * @return a <code>long</code> providing the primary key for the inserted event.
     */
    public long createEvent(String event, String description, long typeId) throws RemoteException;

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will be created with the specified type
     * and description. If the user is already notified for that event, nothing happens.</p>
     *
     * @param event the name of the event
     * @param userId the id of the user that be notified for the event
     * @param typeId it will be used in the case that the event must be created.
     * @param description a <code>String</code> providing the description of an event in the case that the event must be
     *        created.
     * @throws RemoteException
     */
    public void createNotification(String event, long userId, long typeId, String description) throws RemoteException;

    /**
     * <p>Sends mail for notifying that an event has happened. The properties are used to store additional data
     * for the mail template.</p>
     *
     * @param event the event name.
     * @param prop the additional name-values to be used for the mail template.
     * @throws RemoteException
     */
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

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will not be created and the operation
     * will fail with exception. If the user is already notified for that event, nothing happens.</p>
     *
     * @param eventId a <code>long</code> providing the ID of a notification event to assign to the requested user.
     * @param userId a <code>long</code> providing the ID of a user to assign the requested notification event to.
     * @throws SQLException if the specified event does not exist.
     */
    public void assignEvent(long eventId, long userId) throws RemoteException, SQLException;

}
