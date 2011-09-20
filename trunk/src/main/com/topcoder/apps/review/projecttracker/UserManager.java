/*
 * UserManager.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.security.TCSubject;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;


/**
 * The UserManager provides access to users.
 *
 * @author TCSDeveloper
 */
public interface UserManager extends EJBObject {
    /**
     * DOCUMENT ME!
     *
     * @param tcSubject
     *
     * @return User
     *
     * @throws RemoteException
     */
    public SecurityEnabledUser getUser(TCSubject tcSubject) throws RemoteException;

    /**
     * DOCUMENT ME!
     *
     * @param userId
     *
     * @return User
     *
     * @throws RemoteException
     */
    public User getUser(long userId) throws RemoteException;

    /**
     * DOCUMENT ME!
     *
     * @param handle
     *
     * @return User
     *
     * @throws RemoteException
     */
    public User getUser(String handle) throws RemoteException;
}
