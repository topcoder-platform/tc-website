package com.topcoder.security.policy;

import com.topcoder.security.*;
import java.rmi.RemoteException;
import javax.ejb.EJBException;
import com.topcoder.util.idgenerator.sql.SimpleDataSource;
import com.topcoder.util.config.*;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * The Session EJB is a proxy to the Policy object. This should be used by EJB clients.
 *
 * @author Heather Van Aelst
 * @version 1.0
 */
public class PolicyBean implements javax.ejb.SessionBean {
 
    private DataSource dataSource;

    public void ejbCreate() throws EJBException {
        try {
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
        
        Policy p = new Policy(dataSource);
        return p.checkPermission(subject, permission);
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
        
        Policy p = new Policy(dataSource);
        return p.checkPermissions(subject, permissions);
    }

}

