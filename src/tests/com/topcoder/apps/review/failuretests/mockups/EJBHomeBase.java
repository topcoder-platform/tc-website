/*
 * EJBHomeBase.java 1.0 9/21/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;
import javax.ejb.Handle;
import javax.ejb.HomeHandle;
import javax.ejb.EJBMetaData;
import javax.ejb.RemoveException;
import javax.ejb.CreateException;

public class EJBHomeBase {
    // EJB methods

    public void remove(Handle handle) throws RemoveException {
    }

    public void remove(Object o) throws RemoveException {
    }

    public EJBMetaData getEJBMetaData() {
        return null;
    }

    public HomeHandle getHomeHandle() {
        return null;
    }
}
