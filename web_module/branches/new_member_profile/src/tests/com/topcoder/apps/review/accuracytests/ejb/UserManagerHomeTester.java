package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.projecttracker.UserManagerHome;
import com.topcoder.apps.review.projecttracker.UserManager;

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
public class UserManagerHomeTester implements UserManagerHome {

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
    public static UserManagerHomeTester getInstance() {
        if (instance.get() == null) instance.set(new UserManagerHomeTester());
        return (UserManagerHomeTester) instance.get();
    }

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

    public UserManager create() throws CreateException, EJBException {
        return (UserManager) UserManagerLocalHomeTester.getInstance().create();
    }
}
