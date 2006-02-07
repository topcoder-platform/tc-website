/*
 * UserManagerBean.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.TCPermission;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;


/**
 * This is the concrete implementation of the UserManager interface.
 *
 * @author TCSDeveloper
 */
public class UserManagerBean implements SessionBean {
    Log log;
    private DataSource dataSource;

    private void info(String msg) {
        try {
            log.log(Level.INFO, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void debug(String msg) {
        try {
            log.log(Level.DEBUG, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void error(String msg) {
        try {
            log.log(Level.ERROR, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    /**
     * DOCUMENT ME!
     *
     * @param tcSubject
     *
     * @return User
     */
    public SecurityEnabledUser getUser(TCSubject tcSubject) {
        return (SecurityEnabledUser) getUser(tcSubject.getUserId(), null, tcSubject);
    }

    /**
     * DOCUMENT ME!
     *
     * @param userId
     *
     * @return User
     *
     * @throws RuntimeException DOCUMENT ME!
     */
    public User getUser(long userId) {
        return getUser(userId, null, null);
    }

    /**
     * DOCUMENT ME!
     *
     * @param handle
     *
     * @return User
     */
    public User getUser(String handle) {
        info("UserManagerBean.getUser(" + handle + ")");
        User user = getUser(-1, handle, null);
        if (user == null) {
            info("UserManagerBean.getUser(), user not found");
        } else {
            info("UserManagerBean.getUser(), user found, id: " + user.getId());
        }
        return user;
    }

    private User getUser(long userId, String reqHandle, TCSubject tcSubject) {
        User user = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();

            // TODO Integration: Handle is taken from security_user...
            if (reqHandle != null) {
                ps = conn.prepareStatement(
                        "SELECT su.login_id, su.user_id, " +
                        "u.first_name, u.last_name, e.address " +
                        "FROM security_user su, user u, email e " +
                        "WHERE su.user_id = ? AND " +
                        "su.login_id = u.user_id AND " +
                        "su.login_id = e.user_id AND " +
                        "e.primary_ind = 1");
                ps.setString(1, reqHandle);
            } else {
                //info("getUser sql-query!");
                ps = conn.prepareStatement(
                        "SELECT su.login_id, su.user_id, " +
                        "u.first_name, u.last_name, e.address " +
                        "FROM security_user su, user u, email e " +
                        "WHERE su.login_id = ? AND " +
                        "su.login_id = u.user_id AND " +
                        "su.login_id = e.user_id AND " +
                        "e.primary_ind = 1");
                ps.setLong(1, userId);
            }
            rs = ps.executeQuery();

            //info("Done getUser sql-query!");
            if (rs.next()) {
                long loginId = rs.getLong(1);
                String handle = rs.getString(2);
                String firstName = rs.getString(3);
                String lastName = rs.getString(4);
                String email = rs.getString(5);

                if (tcSubject == null) {
                    user = new User(loginId, handle, firstName, lastName, email);
                } else {
                    Set principals = tcSubject.getPrincipals();
                    PermissionCollection perm = new PermissionCollection();

                    PolicyMgrRemote policyMgr = null;
                    try {
                        Context ctx = new InitialContext();
                        PolicyMgrRemoteHome home = (PolicyMgrRemoteHome) PortableRemoteObject.narrow(ctx.lookup(
                                PolicyMgrRemoteHome.EJB_REF_NAME), PolicyMgrRemoteHome.class);
                        policyMgr = home.create();
                    } catch (Exception e1) {
                        error("UsermanagerBean.getUser(): Exception when looking up PolicyManager! " + e1.toString());
                        throw new RuntimeException(e1);
                    }

                    for (Iterator iter = principals.iterator(); iter.hasNext();) {
                        RolePrincipal rolePrincipal = (RolePrincipal) iter.next();
                        if (rolePrincipal.getName().startsWith("com.topcoder.apps.review.security") ||
                                rolePrincipal.getName().equals("Administrator")) {
                            try {
                                Collection permColl = policyMgr.getPermissions(rolePrincipal, tcSubject).getPermissions();
                                for (Iterator i = permColl.iterator(); i.hasNext();) {
                                    TCPermission tcPermission = (TCPermission) i.next();
                                    if (tcPermission.getName().startsWith("com.topcoder.apps.review.security")) {
                                        perm.addPermission(tcPermission);
                                    }
                                }
                            } catch (RemoteException e2) {
                                error("UserManagerBean.getUser(), exception when looking up permissions: " +
                                        e2.toString());
                                throw new RuntimeException(e2);
                            } catch (GeneralSecurityException e2) {
                                error("UserManagerBean.getUser(), secuity-exception when looking up permissions: " +
                                        e2.toString());
                                throw new RuntimeException(e2);
                            }
                        }
                    }
                    user = new SecurityEnabledUser(loginId, handle, firstName, lastName, email, perm, tcSubject);
                }
            }
        } catch (SQLException e) {
            error("UserManagerBean.getUser(), SQL Error: " + e.toString());
            throw new RuntimeException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        return user;
    }

    /**
     * This method is required by the EJB Specification. Used to get the context ... for dynamic connection pools.
     *
     * @throws CreateException DOCUMENT ME!
     */
    public void ejbCreate() throws CreateException {
        dataSource = Common.getDataSource();

        try {
            log = LogFactory.getInstance().getLog("com.topcoder.apps.review.document.UserManagerBean");
        } catch (LogException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        info("UserManagerBean created");
    }

    /* (non-Javadoc)
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() throws EJBException, RemoteException {
    }

    /* (non-Javadoc)
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() throws EJBException, RemoteException {
    }

    /* (non-Javadoc)
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() throws EJBException, RemoteException {
    }

    /* (non-Javadoc)
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext arg0)
            throws EJBException, RemoteException {
    }
}
