package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.login.*;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the LoginRemoteHome.<p>
 * This is the class that is returned by a lookup for the LoginRemoteHome
 * in a {@link TestingContext}
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class LoginRemoteHomeTester implements LoginRemoteHome {

    /**
     * Stores the LoginRemoteHome for this Thread
     * (necessary because of the set/get paradigm...multiple threads
     * would yield unexpected results)
     */
    private static ThreadLocal instance = new ThreadLocal();

    /**
     * Gets the Instance of the LoginRemoteHomeTester
     *
     * @return the instance
     */
    public static LoginRemoteHomeTester getInstance() {
        if (instance.get() == null) instance.set(new LoginRemoteHomeTester());
        return (LoginRemoteHomeTester) instance.get();
    }

    public void remove(Handle handle) throws RemoteException, RemoveException {
    }

    public void remove(Object o) throws RemoveException {
    }

    public EJBMetaData getEJBMetaData() throws RemoteException {
        return null;
    }

    public HomeHandle getHomeHandle() throws RemoteException {
        return null;
    }

    public com.topcoder.security.login.LoginRemote create() throws CreateException, EJBException {
        return (LoginRemote) LoginLocalHomeTester.getInstance().create();
    }
}
