package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.security.login.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GeneralSecurityException;

import java.util.*;

import javax.ejb.*;
import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the LoginRemote.<p>
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class LoginLocalTester implements LoginLocal, LoginRemote {

    private Map users = new HashMap();

    public TCSubject addUser(String name, String pass) {
        users.put(name, pass);
        return new TCSubject(System.identityHashCode(name.intern()));
    }

    public TCSubject login(String name, String pass) throws GeneralSecurityException {
        String p = (String) users.get(name);
        if (p == null || !p.equals(pass)) throw new GeneralSecurityException("Invalid user name=" + name + " pass=" + pass);
        return new TCSubject(System.identityHashCode(name.intern()));
    }

    public EJBLocalHome getEJBLocalHome() {
        return null;
    }

    public EJBHome getEJBHome() {
        return null;
    }

    public Object getPrimaryKey() {
        return null;
    }

    public void remove() throws RemoveException {
    }

    public Handle getHandle() throws RemoteException {
        return null;
    }

    public boolean isIdentical(EJBLocalObject ejbObject) {
        return false;
    }

    public boolean isIdentical(EJBObject ejbObject) {
        return false;
    }
}
