package com.topcoder.security.policy;

import com.topcoder.security.*;
import com.topcoder.util.config.ConfigManagerException;
import java.sql.*;
import java.util.*;

import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.*;
import com.topcoder.util.idgenerator.bean.*;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/** 
 * The policy object is intended for use by the components within the
 * security component directly. This will remove the overhead of obtaining 
 * an EJB reference and marshalling of data.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class Policy {

    private DataSource dataSource;
    
    protected Policy(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * Check to see if the user has the specified permission.  More specifically,
     * check to see if one of the roles the user has has this permission.
     *
     * @param subject The user
     * @param permission 
     * @return Return true if the user has the permission, false otherwise
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public boolean checkPermission (TCSubject subject, 
                                    TCPermission permission) 
        throws GeneralSecurityException {
        
        long id = subject.getUserId();
        String roleIds = getRoleIds(subject.getPrincipals());
        if (roleIds.length() == 0) {
            return false;
        }
        
        //If the user has the permission, this query will return a count of >=1
        String query = "SELECT count (*) FROM security_roles, security_perms "
	    + "WHERE security_roles.role_id IN ( " + roleIds + " ) "
	    + "AND security_roles.role_id = security_perms.role_id "
	    + "AND security_perms.permission = ?";
        
        try {
            Connection con = dataSource.getConnection();
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, permission.getName());
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int numMatch = rs.getInt(1);
            rs.close();
            pstmt.close();
            con.close();
            return numMatch > 0 ? true : false;
        } catch (SQLException e) {
            throw new GeneralSecurityException("SQLException in com.topcoder.security.policy.checkPermission: " + e.getMessage());
        }
    } 
    
    /**
     * Checks to see if the user has all of the given permissions
     *
     * @param subject The user
     * @param permissions The collection of permissions
     * @return Returns true if the user as all of the permissions, false otherwise.
     * @throws GeneralSecurityException Thrown when SLQExcpetion occurs.
     */
    public boolean checkPermissions (TCSubject subject, 
                                     PermissionCollection permissions)  
        throws GeneralSecurityException {
        
        Collection c = permissions.getPermissions();
        Iterator i = c.iterator();
        boolean b = true;
        
        //check whether the user has each of the permissions.  stop if the user doesn't have one.
        while (i.hasNext() && b) {
            b = checkPermission(subject, (TCPermission)i.next());
        }
        return b;
    }
	
    /**
     * Get the user's principals and return in the form of a String to be
     * plugged into a query
     *
     * @param principals
     * @return String of principal names/descriptions
     */
    private String getRoleIds(Collection principals) {
        String roleIds = "";
        Iterator i = principals.iterator();
        while (i.hasNext()) { 
            roleIds += ((TCPrincipal)i.next()).getId();
            roleIds += ", ";
        }
        roleIds = roleIds.length() == 0 ? roleIds : roleIds.substring(0, roleIds.length() - 2);
	return roleIds;
    }
}
