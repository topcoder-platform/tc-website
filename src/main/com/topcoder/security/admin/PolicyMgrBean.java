package com.topcoder.security.admin;

import java.rmi.RemoteException;
import javax.ejb.EJBException;
import java.sql.*;
import java.util.*;
import com.topcoder.security.*;
import com.topcoder.security.policy.*;
import com.topcoder.util.idgenerator.sql.SimpleDataSource;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.apache.log4j.Logger;

/**
 * Use this Bean to manage the permissions associated with a particular role
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class PolicyMgrBean implements javax.ejb.SessionBean {

    private static Logger logger = Logger.getLogger(PolicyMgrBean.class);
    private DataSource dataSource;

    //do I need all of the IdGen stuff in here?
    public void ejbCreate() throws EJBException {
        try {
            logger.debug("PolicyMgrBean.ejbCreate");
            Context context=new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/DefaultDS");
        } catch (NamingException e) {
            throw new EJBException("" + e);
        }
    }
    
    public void ejbRemove() throws RemoteException {}
    public void ejbActivate(){}
    public void ejbPassivate(){}
    public void setSessionContext(javax.ejb.SessionContext cntx){}
    
    /**
     * Returns a collection of all of the permissions this role has
     *
     * @param role 
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @return A PermissionCollection
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public PermissionCollection getPermissions (RolePrincipal role, TCSubject requestor)
        throws GeneralSecurityException {
        
        logger.debug("PolicyMgrBean.getPermissions");
        long roleId = role.getId();
        PermissionCollection pc = new PermissionCollection();
        String query = "SELECT permission FROM security_perms WHERE role_id = ?";
        
        try {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setLong(1, roleId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                pc.addPermission(new GenericPermission(rs.getString(1)));
            }
            pstmt.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.admin.PolicyMgrBean: " + e.getMessage());
        }
        return pc;
    }
    
    /**
     * Add these permissions to this role.
     *
     * @param role
     * @param permissions
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */     
    public void addPermissions (RolePrincipal role, PermissionCollection permissions, TCSubject requestor) 
        throws GeneralSecurityException {
        
        logger.debug("PolicyMgrBean.addPermissions");
        long roleId = role.getId();
        Collection c = permissions.getPermissions();
        String query = 
	    "INSERT INTO security_perms (role_id, permission) " +
	    " VALUES ( ?, ? )";
        int i = 0;
        Iterator it = c.iterator();
        
        try {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            while (it.hasNext()) {
                TCPermission p = (TCPermission)it.next();
                String name = p.getName();
                pstmt.setLong(1, roleId);
                pstmt.setString(2, name);
                pstmt.executeUpdate();
            }
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            throw new GeneralSecurityException("" + e);
        }
    }
    
    /**
     * Remove these permissions from this role.
     *
     * @param role
     * @param permissions
     * @param requestor The user who called this method.  Later implentations
     *                  should check to make sure this user has the permissions
     *                  required to call this method.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */     
    public void removePermissions (RolePrincipal role, PermissionCollection permissions, TCSubject requestor) 
        throws GeneralSecurityException {
        
        logger.debug("PolicyMgrBean.removePermissions");
        long roleId = role.getId();
        Collection c = permissions.getPermissions();
        Iterator i = c.iterator();
        String query = "DELETE FROM security_perms WHERE permission = ?";
        
        try {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            while (i.hasNext()) {
                TCPermission p = (TCPermission)i.next();
                pstmt.setString(1, p.getName());
                pstmt.executeUpdate();
            }
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            throw new GeneralSecurityException("" + e);
        }
    }
}
