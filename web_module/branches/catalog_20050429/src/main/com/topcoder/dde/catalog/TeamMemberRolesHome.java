package com.topcoder.dde.catalog;

import javax.ejb.CreateException;
import javax.ejb.EJBHome;
import java.rmi.RemoteException;


/**
 * <p>The home interface of the <code>Team Member Roles EJB</code>.</p>
 *
 * @version 1.0 04/30/2005
 * @author  isv
 * @see     Catalog
 * @see     ComponentManager
 */
public interface TeamMemberRolesHome extends EJBHome {

    /**
     * <p>A <code>String</code> representing a convenience constant that a client can pass to the <code>lookup</code>
     * method of <code>Context</code> to obtain an instance of this home interface, provided that <code>Team Member
     * Roles EJB</code> has not been remapped or referenced to a different location.</p>
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/TeamMemberRolesEJB";

    /**
     * <p>Creates a new instance of <code>TeamMemberRoles</code> the remote interface of <code>TeamMeberRolesEJB</code>.
     * </p>
     *
     * @return a <code>TeamMemberRoles</code> object that exposes the business methods of <code>TeamMemberRolesEJB
     *         </code>.
     * @throws CreateException if the session cannot be created
     */
    public TeamMemberRoles create() throws RemoteException, CreateException;


}
