package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.admin.*;
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
public class PolicyMgrLocalHomeTester implements PolicyMgrLocalHome {

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
    public static PolicyMgrLocalHomeTester getInstance() {
        if (instance.get() == null) instance.set(new PolicyMgrLocalHomeTester());
        return (PolicyMgrLocalHomeTester) instance.get();
    }

    PolicyMgrLocal remote = new PolicyMgrLocalTester();

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

    public com.topcoder.security.admin.PolicyMgrLocal create() throws CreateException, EJBException {
        return remote;
    }
}
