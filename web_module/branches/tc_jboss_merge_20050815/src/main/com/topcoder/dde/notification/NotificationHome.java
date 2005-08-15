/*
 * NotificationHome.java
 *
 * Copyright © 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;


/**
 * This class is provided as part of the EJB framework as a utility for obtaining a Notification implementation.
 *
 * @author cucu
 */
public interface NotificationHome extends EJBHome {
    public static final String EJB_REF_NAME = "com.topcoder.dde.notification.NotificationHome";

    /**
     * get a Notification object.
     *
     * @return a Notification object
     *
     * @throws CreateException if something fails
     */
    public Notification create() throws CreateException, RemoteException;
}

