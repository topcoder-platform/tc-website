/*
 * CatalogHome.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * The remote home interface of the Catalog Enterprise Java Bean (EJB).
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     Catalog
 * @see     ComponentManager
 */
public interface CatalogHome extends EJBHome {

    /**
     * A convenience constant that a client can pass to the <code>lookup</code>
     * method of <code>Context</code> to obtain an instance of this home
     * interface, provided that CatalogEJB has not been remapped or referenced
     * to a different location.
     */
    public static final String EJB_REF_NAME = "CatalogEJB";

    /**
     * Returns an instance of <code>Catalog</code>, the remote interface of
     * CatalogEJB.
     *
     * @return a <code>Catalog</code> object that exposes the business methods
     *         of CatalogEJB
     * @throws RemoteException if a system-level failure causes the remote
     *         method call to fail
     * @throws CreateException if the session cannot be created
     */
    public Catalog create() throws RemoteException, CreateException;


}
