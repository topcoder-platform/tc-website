/*
 * ComponentManagerHome.java
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
 * The remote home interface of the ComponentManager Enterprise Java Bean (EJB).
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManager
 * @see     Catalog
 */
public interface ComponentManagerHome extends EJBHome {

    /**
     * A convenience constant that a client can pass to the <code>lookup</code>
     * method of <code>Context</code> to obtain an instance of this home
     * interface, provided that CatalogEJB has not been remapped or referenced
     * to a different location.
     */
    public static final String EJB_REF_NAME = "com.topcoder.dde.catalog.ComponentManagerHome";

    /**
     * Creates an instance of <code>ComponentManager</code>, the remote
     * interface of ComponentManagerEJB, for the current version of the
     * specified component.
     *
     * @param componentId the primary key of the component to be managed by the
     * new <code>ComponentManager</code>
     * @return a <code>ComponentManager</code> object that exposes the business
     * methods of ComponentManagerEJB
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CreateException if a component with a primary key of
     * <code>componentId</code> cannot be found, or if the session cannot be
     * created
     */
    public ComponentManager create(long componentId)
            throws CreateException, RemoteException;

    /**
     * Creates an instance of <code>ComponentManager</code>, the remote
     * interface of ComponentManagerEJB, for the specified version of the
     * specified component.
     *
     * @param componentId the primary key of the component to be managed by the
     * new <code>ComponentManager</code>
     * @param version the version number of the version to be managed by the new
     * <code>ComponentManager</code>
     * @return a <code>ComponentManager</code> object that exposes the business
     * methods of ComponentManagerEJB
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws CreateException if a component with a primary key of
     *<code>componentId</code> cannot be found or has not reached
     * <code>version</code>, or if the session cannot be created
     */
    public ComponentManager create(long componentId, long version)
            throws CreateException, RemoteException;

    public ComponentManager create()
            throws CreateException, RemoteException;

}
