package com.topcoder.dde.catalog;

import javax.ejb.EJBObject;
import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;
import java.rmi.RemoteException;

/**
 * <p>A remote interface for <code>Team Member Roles EJB</code>.</p>
 *
 * @author  isv
 * @version 1.0 04/30/2005
 */
public interface TeamMemberRoles extends EJBObject {

    public List getTeamMemberRoles(long componentId) throws RemoteException, SQLException, NamingException;

    public List getTeamMemberRoles(long componentId, long compVersionId) throws RemoteException, SQLException, NamingException;

}
