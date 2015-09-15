/*
 * MyLoginRemote.java 1.0 6/30/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import java.util.HashMap;
import java.rmi.RemoteException;

import javax.ejb.Handle;
import javax.ejb.EJBHome;
import javax.ejb.EJBObject;
import javax.ejb.RemoveException;

import com.topcoder.apps.review.mockup.EJBBase;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.security.GeneralSecurityException;

/**
 * <p>A mockup implementation of LoginRemote used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyLoginRemote extends EJBBase implements LoginRemote {
    public TCSubject login(String username, String password)
            throws RemoteException, GeneralSecurityException {
        return (MyLoginImpl.login(username, password));
    }
}
