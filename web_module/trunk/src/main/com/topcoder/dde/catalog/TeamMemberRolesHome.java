package com.topcoder.dde.catalog;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * The local home interface of the Catalog Enterprise Java Bean (EJB).
 *
 * @version 1.0 04/30/2005
 * @author  isv
 * @see     Catalog
 * @see     ComponentManager
 */
public interface TeamMemberRolesHome extends EJBHome {

    /**
     * A convenience constant that a client can pass to the <code>lookup</code>
     * method of <code>Context</code> to obtain an instance of this home
     * interface, provided that CatalogEJB has not been remapped or referenced
     * to a different location.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/TeamMemberRolesEJB";

    /**
     * Returns an instance of <code>Catalog</code>, the remote interface of
     * CatalogEJB.
     *
     * @return a <code>Catalog</code> object that exposes the business methods
     *         of CatalogEJB
     * @throws CreateException if the session cannot be created
     */
    public TeamMemberRoles create() throws RemoteException, CreateException;


}
