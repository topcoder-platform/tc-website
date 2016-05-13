/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.mockup;

import java.rmi.RemoteException;
import javax.ejb.EJBHome;
import javax.ejb.EJBLocalHome;
import javax.ejb.EJBLocalObject;
import javax.ejb.EJBObject;
import javax.ejb.Handle;

/**
 * Mockup implementation of some common methods used in the EJB implementations.
 *
 * @author adic
 * @version 1.0
 */
public class EJBBase implements EJBLocalObject, EJBObject {

    public boolean isIdentical(EJBLocalObject p1) {
        return false;
    }

    public Object getPrimaryKey() {
        return null;
    }

    public void remove() {
    }

    public EJBLocalHome getEJBLocalHome() {
        return null;
    }

    public boolean isIdentical(EJBObject p1) {
        return false;
    }

    public Handle getHandle() throws RemoteException {
        return null;
    }

    public EJBHome getEJBHome() {
        return null;
    }

}

