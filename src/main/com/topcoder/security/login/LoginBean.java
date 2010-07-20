/*
 * Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.login;

import com.topcoder.security.BaseEJB;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.SecurityDB;
import com.topcoder.security.TCSubject;
import com.topcoder.security.Util;
import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import org.apache.log4j.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

/**
 * <p>A stateless EJB to be used for authenticating users to application.</p>
 *
 * <p>Version 2.0 (LDAP Authentication Release Assembly v1.0) change notes:
 *   <ul>
 *     <li>Re-written the whole logic for user authentication to authenticate users against <code>LDAP</code> server
 *     instead of database.</li>
 *   </ul>
 * </p>
 *
 * <p>
 * Version 2.1 (Impersonation Login Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #login(String, String, String)} method to support impersonated logins.</li>
 *   </ol>
 * </p>
 *
 * @author Heather Van Aelst, isv
 * @version 2.1
 */
public class LoginBean extends BaseEJB {

    /**
     * <p>A <code>Logger</code> to be used for logging the events encountered during user authentication.</p>
     */
    private static final Logger logger = Logger.getLogger(LoginBean.class);

    /**
     * <p>A <code>String</code> providing the default JNDI name for the data source to be used for establishing
     * connection to target database.</p>
     */
    private static final String DATA_SOURCE = "java:comp/env/jdbc/DefaultDS";

    /**
     * <p>Constructs new <code>LoginBean</code> instance. This implementation does nothing.</p>
     *
     * @since 2.0
     */
    public LoginBean() {
    }

    /**
     * <p>Logs the user to application using specified credentials for authentication.</p>
     *
     * @param username a <code>String</code> providing the username for user authentication.
     * @param password a <code>String</code> providing the plain text password for user authentication.
     * @return a <code>TCSubject</code> providing the identity for the user successfully authenticated to application.
     * @throws AuthenticationException if provided credentials are invalid.
     * @throws GeneralSecurityException if an unexpected error occurs while authenticating user to application.
     */
    public TCSubject login(String username, String password) throws GeneralSecurityException {
        return login(username, password, DATA_SOURCE);
    }

    /**
     * <p>Logs the user to application using the specified credentials. Checks username and password, returns a
     * TCSubject representation of the user that includes the user's roles.</p>
     *
     * @param username a <code>String</code> providing the username for user authentication.
     * @param password a <code>String</code> providing the plain text password for user authentication.
     * @param dataSource a <code>String</code> referencing the data source to be used for establishing connection to
     *        target database.
     * @return a <code>TCSubject</code> providing the identity for the user successfully authenticated to application.
     * @throws AuthenticationException if provided credentials are invalid.
     * @throws GeneralSecurityException if an unexpected error occurs while authenticating user to application.
     */
    public TCSubject login(String username, String password, String dataSource) throws GeneralSecurityException {

        if (logger.isDebugEnabled()) {
            logger.debug("LoginBean.login: " + username);
        }

        boolean impersonationUsed = false;
        String impersonatedUsername = null;
        if (username != null) {
            int slashPos = username.indexOf("/");
            if (slashPos >= 0) {
                impersonationUsed = true;
                impersonatedUsername = username.substring(slashPos + 1);
                username = username.substring(0, slashPos);
            }
        }

        checkLength(username, SecurityDB.maxUsernameLength);
        checkLength(password, SecurityDB.maxPasswordLength);
        if (impersonationUsed) {
            checkLength(impersonatedUsername, SecurityDB.maxUsernameLength);
        }

        // Authenticate user against LDAP server and map user to user ID
        long userId = loginToLDAPDirectory(username, password);
        Set<RolePrincipal> userRoles = getUserRoles(dataSource, userId);
        if (impersonationUsed) {
            boolean canPerformImpersonatedLogins = false;

            try {
                InitialContext context = new InitialContext();
                Long impersonationRoleId = (Long) context.lookup("java:comp/env/impersonationRoleId");

                // Check if current user is granted a permission to perform impersonated logins. If so then perform
                // impersonated login; otherwise raise a security exception
                for (RolePrincipal userRole : userRoles) {
                    if (userRole.getId() == impersonationRoleId) {
                        canPerformImpersonatedLogins = true;
                        break;
                    }
                }
            } catch (NamingException e) {
                throw new GeneralSecurityException("Failed to retrieve the value of java:comp/env/impersonationRoleId "
                        + "environment entry from JNDI context", e);
            }

            if (canPerformImpersonatedLogins) {
                long impersonatedUserId = loginToLDAPDirectory(impersonatedUsername);
                Set<RolePrincipal> impersonatedUserRoles = getUserRoles(dataSource, impersonatedUserId);
                TCSubject impersonatedTCSubject = new TCSubject(impersonatedUserRoles, impersonatedUserId);
                impersonatedTCSubject.setImpersonatedByUserId(userId);
                impersonatedTCSubject.setImpersonatedByUsername(username);
                if (logger.isDebugEnabled()) {
                    logger.debug("Logged as user " + impersonatedUsername + "(ID: " + impersonatedUserId
                            + ") impersonated by user " + username + " (ID: " + userId + ")");
                }
                return impersonatedTCSubject;
            } else {
                logger.error("Denied to perform impersonated login on behalf of user " + impersonatedUsername
                        + " by user " + username + "(ID: " + userId + ")");
                throw new AuthenticationException("You can not perform requested operation");
            }
        } else {
            if (logger.isDebugEnabled()) {
                logger.debug("Logging in login_id: " + userId);
            }
            return new TCSubject(userRoles, userId);
        }
    }

    /**
     * <p>Use this to check the length of a parameter against a defined maximum. For example, compare a submitted
     * username to the length of the username column in the db.  Throws GeneralSecurityException if param is too long or
     * is empty.<p>
     *
     * @param param a <code>String</code> providing the value to be checked.
     * @param maxLength an <code>int</code> providing the maximum allowed length.
     * @since 2.1
     */
    protected void checkLength(String param, int maxLength) throws GeneralSecurityException {
        if (param.trim().length() == 0) {
            throw new GeneralSecurityException("Parameter <" + param + "> is empty.");
        }
        super.checkLength(param, maxLength);
    }

    /**
     * <p>Gets the roles assigned to user mapped to specified user ID.</p>
     *
     * @param dataSource a <code>String</code> providing the name for the data source in JNDI context.
     * @param userId a <code>long</code> providing the ID of a user to gather roles for.
     * @return a <code>Set</code> of roles assigned to specified user.
     * @throws GeneralSecurityException if an unexpected error occurs while getting user roles from persistent data
     *         store.
     * @since 2.1
     */
    private Set<RolePrincipal> getUserRoles(String dataSource, long userId) throws GeneralSecurityException {
        // Collect user's roles from database
        Set<RolePrincipal> userRoles = new HashSet<RolePrincipal>();

        InitialContext ctx = null;
        ResultSet rs2 = null;
        PreparedStatement ps2 = null;
        Connection conn = null;
        try {
            ctx = new InitialContext();
            conn = Util.getConnection(ctx, dataSource);

            String query = "SELECT security_roles.role_id, description " +
                           "FROM   user_role_xref, security_roles " +
                           "WHERE  user_role_xref.login_id = ? " +
                           "AND    user_role_xref.role_id = security_roles.role_id " +
                           "AND    user_role_xref.security_status_id = ? "+
                           "UNION " +
                           "SELECT security_roles.role_id, description " +
                           "FROM   security_roles, user_group_xref, group_role_xref " +
                           "WHERE  user_group_xref.login_id = ? " +
                           "AND    user_group_xref.group_id = group_role_xref.group_id " +
                           "AND    user_group_xref.security_status_id = ? " +
                           "AND    group_role_xref.security_status_id = ? " +
                           "AND    group_role_xref.role_id = security_roles.role_id";
            ps2 = conn.prepareStatement(query);
            ps2.setLong(1, userId);
            ps2.setInt(2, SecurityDB.STATUS_ACTIVE);
            ps2.setLong(3, userId);
            ps2.setInt(4, SecurityDB.STATUS_ACTIVE);
            ps2.setInt(5, SecurityDB.STATUS_ACTIVE);
            rs2 = ps2.executeQuery();

            // Build list of RolePrincipals associated with user
            RolePrincipal userRole = null;
            while (rs2.next()) {
                userRole = new RolePrincipal(rs2.getString(2), rs2.getLong(1));
                userRoles.add(userRole);
            }
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        } finally {
            close(rs2);
            close(ps2);
            close(conn);
            close(ctx);
        }
        return userRoles;
    }

    /**
     * <p>Authenticates user against <code>LDAP</code> directory based on provided credentials. Verifies that there is
     * an <code>LDAP</code> entry with DN matching the specified username and that it has associated password equal to
     * specified one.</p>
     *
     * @param username a <code>String</code> providing the username for user authentication.
     * @param password a <code>String</code> providing the encrypted text password for user authentication.
     * @return a <code>long</code> providing the ID for the user authenticated based on provided credentials.
     * @throws AuthenticationException if provided credentials are invalid or user account is not active.
     * @throws GeneralSecurityException if an unexpected error occurs while authenticating user to application.
     * @since 2.0
     */
    private long loginToLDAPDirectory(String username, String password) throws GeneralSecurityException {
        try {
            return LDAPClient.authenticateTopCoderMember(username, password);
        } catch (LDAPClientException e) {
            if (e.isUserStatusNotActive()) {
                throw new AuthenticationException("User account is not active");
            } else if (e.isInvalidCredentialProvided()) {
                throw new AuthenticationException("Username and/or password are incorrect");
            } else if (e.isUnknownUserHandle()) {
                throw new AuthenticationException("Username and/or password are incorrect");
            } else {
                throw new GeneralSecurityException("Could not authenticate user due to unexpected error", e);
            }
        }
    }

    /**
     * <p>Authenticates user against <code>LDAP</code> directory based on provided username only. Verifies that there is
     * an <code>LDAP</code> entry with DN matching the specified username.</p>
     *
     * @param username a <code>String</code> providing the username for user authentication.
     * @return a <code>long</code> providing the ID for the user authenticated based on provided username.
     * @throws AuthenticationException if provided username is invalid or user account is not active.
     * @throws GeneralSecurityException if an unexpected error occurs while authenticating user to application.
     * @since 2.1
     */
    private long loginToLDAPDirectory(String username) throws GeneralSecurityException {
        try {
            return LDAPClient.authenticateTopCoderMember(username);
        } catch (LDAPClientException e) {
            if (e.isUserStatusNotActive()) {
                throw new AuthenticationException("User account is not active");
            } else if (e.isInvalidCredentialProvided()) {
                throw new AuthenticationException("Username is incorrect");
            } else if (e.isUnknownUserHandle()) {
                throw new AuthenticationException("Username is incorrect");
            } else {
                throw new GeneralSecurityException("Could not authenticate user just by username due to "
                                                   + "unexpected error", e);
            }
        }
    }
}
