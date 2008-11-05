/*
 * NotificationLocalHome.java
 *
 * Copyright © 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a Notification implementation.
 *
 * @author cucu
 */
public interface NotificationLocalHome extends EJBLocalHome {
    public static final String EJB_REF_NAME = "com.topcoder.dde.notification.NotificationLocalHome";
    /**
     * get a NotificationLocal object.
     *
     * @return a NotificationLocal object
     *
     * @throws CreateException if something fails
     */
    public NotificationLocal create() throws CreateException;
}
