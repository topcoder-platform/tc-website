/*
 * AdminLoginHome.java
 * 6 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.admin;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * The remote home interface of the AdminLogin Enterprise Java Bean (EJB),
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     AdminLogin
 */
public interface AdminLoginHome extends EJBHome {

    /**
     * A convenience constant that a client can pass to the <code>lookup</code>
     * method of <code>Context</code> to obtain an instance of this home
     * interface, provided that AdminLoginEJB has not been remapped or
     * referenced to a different location.
     */
    public static final String EJB_REF_NAME =
            "com.topcoder.dde.admin.AdminLoginHome";

    /**
     * Returns an instance of <code>AdminLogin</code>, the remote interface of
     * AdminLoginEJB.
     *
     * @return an <code>AdminLogin</code> object that exposes the business
     * methods of AdminLoginEJB
     * @throws RemoteException if a system-level failure causes the remote
     *         method call to fail
     * @throws CreateException if the session cannot be created
     */
    public AdminLogin create()
            throws RemoteException, CreateException;


}
