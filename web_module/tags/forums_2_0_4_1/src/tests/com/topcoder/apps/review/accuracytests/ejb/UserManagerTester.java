package com.topcoder.apps.review.accuracytests.ejb;

import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;

/**
 * Assists in UnitTesting by serving as the UserManager.<p>
 *
 * @author TCDEVELOPER
 * @version 1.0
 * @version Copyright � 2003, TopCoder Software, Inc. All rights reserved
 */
public class UserManagerTester implements UserManagerLocal, UserManager {

    public SecurityEnabledUser getUser(TCSubject tcSubject) {
        long id = tcSubject.getUserId();
        SecurityEnabledUser user = new SecurityEnabledUser(id, "h" + id, "f" + id, "l" + id, "e" + id, null, tcSubject);
        return user;
    }

    public javax.ejb.EJBLocalHome getEJBLocalHome() throws javax.ejb.EJBException {
        return null;
    }

    public javax.ejb.EJBHome getEJBHome() throws javax.ejb.EJBException {
        return null;
    }

    public Object getPrimaryKey() throws javax.ejb.EJBException {
        return null;
    }

    public boolean isIdentical(javax.ejb.EJBLocalObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public boolean isIdentical(javax.ejb.EJBObject eJBLocalObject) throws javax.ejb.EJBException {
        return false;
    }

    public void remove() throws javax.ejb.RemoveException, javax.ejb.EJBException {
    }

    public javax.ejb.Handle getHandle() {
        return null;
    }

    public User getUser(String handle) {
        return new User(0, handle, "f", "l", "e");
    }

    public User getUser(long userId) {
        return new User(userId, "h", "f", "l", "e");
    }

}
