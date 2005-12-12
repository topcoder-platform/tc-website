/*
 * NotificationLocal.java
 *
 * Copyright © 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;


import javax.ejb.EJBLocalObject;
import java.util.Properties;
import java.util.Set;
import java.sql.SQLException;

/**
 * The ProjectTrackerLocal provides access to the project data stored within the system.
 *
 * @author TCSDeveloper, isv
 * @version 1.1 04/25/2005
 */
public interface NotificationLocal extends EJBLocalObject {

    /**
     * <p>Stores a new event in the database.</p>
     *
     * @param event a <code>String</code> providing the the event name.
     * @param description a <code>String</code> providing the description of new notification event.
     * @param typeId a <code>long</code> providing the type of event, as defined in table notification_mail_type_lu.
     * @return a <code>long</code> providing the primary key for the inserted event.
     */
    public long createEvent(String event, String description, long typeId);

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will be created with the specified type
     * and description. If the user is already notified for that event, nothing happens.</p>
     *
     * @param event the name of the event
     * @param userId the id of the user that be notified for the event
     * @param typeId it will be used in the case that the event must be created.
     * @param description a <code>String</code> providing the description of an event in the case that the event must be
     *        created.
     */
    public void createNotification(String event, long userId, long typeId, String description);

    /**
     * <p>Sends mail for notifying that an event has happened. The properties are used to store additional data
     * for the mail template.</p>
     *
     * @param event the event name.
     * @param prop the additional name-values to be used for the mail template.
     */
    public void notifyEvent(String event, Properties prop);

    /**
     * <p>Gets the notification events which are assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events assigned
     *         to requested user. May return an empty set if there are no notification events assigned to requested user
     *         but never returns <code>null</code>.
     */
    public Set getAssignedEvents(long userId);

    /**
     * <p>Gets the notification events which are not assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the non-assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events which are
     *         not assigned to requested user. May return an empty set if all existing notification events are already
     *         assigned to requested user but never returns <code>null</code>.
     */
    public Set getUnassignedEvents(long userId);

    /**
     * <p>Unassigns specified notification event from specified user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to unassign the requested notification event from.
     * @param eventId a <code>long</code> providing the ID of a notification event to unassign from the requested user.
     */
    public void unassignEvent(long userId, long eventId);

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will not be created and the operation
     * will fail with exception. If the user is already notified for that event, nothing happens.</p>
     *
     * @param eventId a <code>long</code> providing the ID of a notification event to assign to the requested user.
     * @param userId a <code>long</code> providing the ID of a user to assign the requested notification event to.
     * @throws SQLException if the specified event does not exist.
     */
    public void assignEvent(long eventId, long userId) throws SQLException;

}
