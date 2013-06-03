/*
 * MyLoginRemoteHome.java 1.0 6/30/2003
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

import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.login.LoginRemoteHome;

/**
 * <p>A mockup implementation of LoginRemoteHome used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyLoginRemoteHome extends EJBHomeBase implements LoginRemoteHome {
    /**
     * <p>Returns a new instance of MyLoginRemote.</p>
     */
    public LoginRemote create() throws RemoteException, CreateException {
        return (new MyLoginRemote());
    }

}
