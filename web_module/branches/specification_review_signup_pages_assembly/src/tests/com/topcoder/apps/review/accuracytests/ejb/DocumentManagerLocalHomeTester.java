package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.document.DocumentManagerLocal;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the DocumentManagerHome.<p>
 * This is the class that is returned by a lookup for the DocumentManagerHome
 * in a {@link TestingContext}
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class DocumentManagerLocalHomeTester implements DocumentManagerLocalHome {

    /**
     * Stores the DocumentManagerHome for this Thread
     * (necessary because of the set/get paradigm...multiple threads
     * would yield unexpected results)
     */
    private static ThreadLocal instance = new ThreadLocal();

    /**
     * Gets the Instance of the DocumentManagerHomeTester
     *
     * @return the instance
     */
    public static DocumentManagerLocalHomeTester getInstance() {

        if (instance.get() == null) instance.set(new DocumentManagerLocalHomeTester());
        return (DocumentManagerLocalHomeTester) instance.get();
    }

    DocumentManagerLocal remote = new DocumentManagerTester();

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

    public DocumentManagerLocal create() throws CreateException, EJBException {
        return remote;
    }
}
