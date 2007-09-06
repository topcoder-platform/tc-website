/*
 * MyUserManagerHome.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;
import javax.ejb.CreateException;

import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.apps.review.projecttracker.UserManagerLocalHome;

/**
 * <p>A mockup implementation of UserManagerHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyUserManagerHome extends EJBHomeBase
        implements UserManagerLocalHome {
    /**
     * <p>Returns a new instance of MyUserManager.</p>
     */
    public UserManagerLocal create() throws CreateException {
        return (new MyUserManager());
    }
}
