package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the UserManagerHome.<p>
 * This is the class that is returned by a lookup for the UserManagerHome
 * in a {@link TestingContext}
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class UserManagerLocalHomeTester implements UserManagerLocalHome {

    /**
     * Stores the UserManagerHome for this Thread
     * (necessary because of the set/get paradigm...multiple threads
     * would yield unexpected results)
     */
    private static ThreadLocal instance = new ThreadLocal();

    /**
     * Gets the Instance of the UserManagerHomeTester
     *
     * @return the instance
     */
    public static UserManagerLocalHomeTester getInstance() {
        if (instance.get() == null) instance.set(new UserManagerLocalHomeTester());
        return (UserManagerLocalHomeTester) instance.get();
    }

    UserManagerLocal remote = new UserManagerTester();

    public void remove(Handle handle) throws RemoveException {
    }

    public void remove(Object o) throws RemoveException {
    }

    public EJBMetaData getEJBMetaData() throws RemoteException {
        return null;
    }

    public HomeHandle getHomeHandle() throws RemoteException {
        return null;
    }

    public UserManagerLocal create() throws CreateException, EJBException {
        return remote;
    }
}
