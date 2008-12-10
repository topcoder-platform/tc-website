/*
 * MyLoginLocal.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;

import javax.ejb.Handle;
import javax.ejb.EJBLocalHome;
import javax.ejb.EJBLocalObject;
import javax.ejb.RemoveException;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.security.GeneralSecurityException;

/**
 * <p>A mockup implementation of LoginLocal used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyLoginLocal implements LoginLocal {
    public TCSubject login(String username, String password)
            throws GeneralSecurityException {
        return (MyLoginImpl.login(username, password));
    }

    //EJB methods

    public EJBLocalHome getEJBLocalHome() {
        return null;
    }

    public Object getPrimaryKey() {
        return null;
    }

    public void remove() {
    }

    public boolean isIdentical(EJBLocalObject ejbLocalObject) {
        return false;
    }
}
