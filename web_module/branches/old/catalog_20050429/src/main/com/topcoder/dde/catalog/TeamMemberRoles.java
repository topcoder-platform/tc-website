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

    /**
     * <p>Gets the roles for members assigned to current version of specified component.</p>
     *
     * @param componentId a <code>long</code> providing the ID of a requested component.
     * @return a <code>List</code> containing the <code>TeamMemberRole</code> objects providing the roles assigned to
     *         team members in context of specified component.
     * @throws RemoteException
     * @throws SQLException
     * @throws NamingException
     */
    public List getTeamMemberRoles(long componentId) throws RemoteException, SQLException, NamingException;

    /**
     * <p>Gets the roles for members assigned to specified version of specified component.</p>
     *
     * @param componentId a <code>long</code> providing the ID of a requested component.
     * @param compVersionId a <code>long</code> providing the ID of a version of specified component. Note, this value
     *        maps to 'comp_versions.version' but not 'comp_versions.comp_vers_id' column.
     * @return a <code>List</code> containing the <code>TeamMemberRole</code> objects providing the roles assigned to
     *         team members in context of specified version of specified component.
     * @throws RemoteException
     * @throws SQLException
     * @throws NamingException
     */
    public List getTeamMemberRoles(long componentId, long compVersionId)
        throws RemoteException, SQLException, NamingException;

}
