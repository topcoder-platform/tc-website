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

import java.rmi.RemoteException;

import javax.ejb.EJBObject;


/**
 *
 *
 * @author cucu
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

}
