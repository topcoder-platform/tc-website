/*
 * NotificationLocal.java
 *
 * Copyright © 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;


import javax.ejb.EJBLocalObject;
import java.util.Properties;

/**
 * The ProjectTrackerLocal provides access to the project data stored within the system.
 *
 * @author TCSDeveloper
 */
public interface NotificationLocal extends EJBLocalObject {

    public long createEvent(String event, long typeId);

    public void createNotification(String event, long userId, long typeId);

    public void notifyEvent(String event, Properties prop);

}
