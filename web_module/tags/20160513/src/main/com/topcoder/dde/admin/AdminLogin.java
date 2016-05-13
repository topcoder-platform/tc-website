/*
 * AdminLogin.java
 * 6 September 2002
 * 1.0
 *
 * Copyright(c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.admin;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;


/**
 * The remote interface of the AdminLogin Enterprise Java Bean (EJB). AdminLogin
 * provides authentication for administrators of the Distributed Development
 * Environment.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     AdminLoginHome
 */
public interface AdminLogin extends javax.ejb.EJBObject {


    /**
     * Attempts to authenticate a user with the specified username and password.
     *
     * @param username the username
     * @param password the plaintext password (the password is encrypted in the
     * database)
     * @return a <code>TCSubject</code> object that represents the authenticated
     * user
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws GeneralSecurityException if <code>username</code> or
     * <code>password</code> is <code>null</code>, or if the configuration data
     * cannot be accessed
     */
    public TCSubject login(String username, String password)
            throws RemoteException, GeneralSecurityException;


}
