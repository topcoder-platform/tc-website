package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.policy.*;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the PolicyRemoteHome.<p>
 * This is the class that is returned by a lookup for the PolicyRemoteHome
 * in a {@link TestingContext}
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class PolicyLocalHomeTester implements PolicyLocalHome {

    /**
     * Stores the PolicyRemoteHome for this Thread
     * (necessary because of the set/get paradigm...multiple threads
     * would yield unexpected results)
     */
    private static ThreadLocal instance = new ThreadLocal();

    /**
     * Gets the Instance of the LoginRemoteHomeTester
     *
     * @return the instance
     */
    public static PolicyLocalHomeTester getInstance() {
        if (instance.get() == null) instance.set(new PolicyLocalHomeTester());
        return (PolicyLocalHomeTester) instance.get();
    }

    PolicyLocal remote = new PolicyLocalTester();

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

    public com.topcoder.security.policy.PolicyLocal create() throws CreateException, EJBException {
        return remote;
    }
}
