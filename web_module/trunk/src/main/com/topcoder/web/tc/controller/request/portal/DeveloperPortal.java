/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.portal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * <p>
 * This is a request controller for developer portal.
 * </p>
 *
 * <p>
 * Class is immutable and thread-safe.
 * </p>
 *
 * @author gevak
 * @version 1.0
 */
public class DeveloperPortal extends Base {

    /**
     * The path of configuration file. 
     */
    private static String CONFIGURATION_FILE = "com/topcoder/util/config/ConfigManager.properties";

    /**
     * The configuration namespace. 
     */
    private static String CONFIGURATION_NAMESPACE = DeveloperPortal.class.getCanonicalName();

    /**
     * <p>
     * List of accessors for managed 3scale accounts.
     * </p>
     *
     * <p>
     * Initialized in constructor (using configuration) and never changed afterwards.
     * Not null.
     * </p>
     */
    private final List<Access3scale> access3scales;

    /**
     * Constructor. It configures the object.
     * 
     * @throws Exception if any error occurs with configuration.
     */
    public DeveloperPortal() throws Exception {
        ConfigurationObject config = new ConfigurationFileManager(CONFIGURATION_FILE).
                getConfiguration(CONFIGURATION_NAMESPACE).getChild(CONFIGURATION_NAMESPACE);
        access3scales = new ArrayList<Access3scale>();
        for (ConfigurationObject access3scaleConfig : config.getChild("access3scales").getAllChildren()) {
            access3scales.add(new Access3scale(access3scaleConfig));
        }
    }

    /**
     * Perform business processing.
     *
     * @throws TCWebException if any error occcurs.
     */
    protected void businessProcessing() throws TCWebException {
        if (!userIdentified()) {
            // User not logged in. Thus redirect to login page.
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User user = getUser();
        String action = getRequest().getParameter("action");

        if ("createUser".equals(action)) {
            // This is a request to create user in 3scale. Thus create user in each 3scale portal.
            for (Access3scale access3scale : access3scales) {
                try {
                    access3scale.createUser(user.getUserName(), "password",
                            "e" + Math.abs(new Random().nextInt())
                            + "@email" + Math.abs(new Random().nextInt()) +".net");
                } catch (Exception ex) {
                    throw new TCWebException(ex);
                }
            }
        }

        if ("goToPortal".equals(action)) {
            // This is a request to go to portal. Thus obtain SSO token and redirect user to SSO URL.
            // Find Access3scale corresponding to request portal.
            Access3scale access3scale = null;
            for (Access3scale a3s : access3scales) {
                if (a3s.getPortalName().equals(getRequest().getParameter("portalName"))) {
                    access3scale = a3s;
                    break;
                }
            }
            // Obtain SSO token.
            SSOToken ssoToken = null;
            try {
                // Try to load from persistence.
                ssoToken = loadSSOTokenFromPeristence(access3scale.getPortalName(), user.getUserName());
            } catch (Exception ex) {
                throw new TCWebException(ex);
            }
            if (ssoToken == null || new Date().compareTo(ssoToken.getExpiresAt()) >= 0) {
                // No old token of old token expired. Thus, regenerate it.
                try {
                    ssoToken = access3scale.generateToken(user.getUserName());
                    // Persist obtained SSO token.
                    saveSSOTokenToPersistence(access3scale.getPortalName(), user.getUserName(), ssoToken);
                } catch (UserNotFoundException ex) {
                    // User not found in 3scale. Thus redirect to the page, which offers account creation.
                    log.info("User " + user.getUserName() + " not found in 3scale portal "
                            + access3scale.getPortalName());
                    setNextPage(Constants.DEVELOPER_PORTAL_WELCOME);
                    return;
                } catch (Exception ex) {
                    throw new TCWebException(ex);
                }
            }
            // Redirect user to SSO URL.
            setNextPage(ssoToken.getUrl());
            return;
        }

        // This is a request for portals list. Thus, detect if user exists in 3scale portals.
        SSOToken ssoToken = null;
        for (Access3scale access3scale : access3scales) {
            try {
                // Try to load from persistence.
                ssoToken = loadSSOTokenFromPeristence(access3scale.getPortalName(), user.getUserName());
            } catch (Exception ex) {
                throw new TCWebException(ex);
            }
            if (ssoToken == null) {
                // No token found. Check, if user exists in 3scale portal.
                try {
                    ssoToken = access3scale.generateToken(user.getUserName());
                    // Persist obtained SSO token.
                    saveSSOTokenToPersistence(access3scale.getPortalName(), user.getUserName(), ssoToken);
                } catch (UserNotFoundException ex) {
                    // User not found in 3scale. Thus redirect to the page, which offers account creation.
                    log.info("User " + user.getUserName() + " not found in 3scale portal "
                            + access3scale.getPortalName());
                    setNextPage(Constants.DEVELOPER_PORTAL_WELCOME);
                    return;
                } catch (Exception ex) {
                    throw new TCWebException(ex);
                }
            }
        }
        // User found in 3scale portals. So, show the portals list.
        List<String> portalNames = new ArrayList<String>();
        for (Access3scale access3scale : access3scales) {
            portalNames.add(access3scale.getPortalName());
        }
        getRequest().setAttribute("portalNames", portalNames);
        setNextPage(Constants.DEVELOPER_PORTAL);
        setIsNextPageInContext(true);
    }

    /**
     * Loads SSO token from persistence.
     *
     * @param portalName Portal name.
     * @param userName User name.
     * @return SSO token. Null if none found.
     * @throws Exception if any error occurs.
     */
    private SSOToken loadSSOTokenFromPeristence(String portalName, String userName) throws Exception {
        log.info("Enter loadSSOTokenFromPeristence(" + portalName + "," + userName + ")");

        // Obtain DB connection.
        DataAccess dataAccess = (DataAccess) getDataAccess(DBMS.COMMON_OLTP_DATASOURCE_NAME, false);
        Connection conn = (Connection) DBMS.getConnection(dataAccess.getDataSource());

        // Run SQL query.
        PreparedStatement ps = null;
        ResultSet rs = null;
        SSOToken ssoToken = null;
        try {
            ps = conn.prepareStatement("SELECT expires_at, url FROM sso_token"
                    + " WHERE portal_name=? AND user_name=?");
            ps.setString(1, portalName);
            ps.setString(2, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                ssoToken = new SSOToken();
                ssoToken.setExpiresAt(new Date(rs.getLong(1)));
                ssoToken.setUrl(rs.getString(2));
            }
        } finally {
            try {
                rs.close();
            } catch (Exception ex) { }
            try {
                ps.close();
            } catch (Exception ex) { }
            try {
                conn.close();
            } catch (Exception ex) { }
        }

        log.info("Exit loadSSOTokenFromPeristence(" + portalName + "," + userName + ")");
        return ssoToken;
    }

    /**
     * Saves SSO token to persistence.
     *
     * @param portalName Portal name.
     * @param userName User name.
     * @param ssoToken SSO token.
     * @throws Exception if any error occurs.
     */
    private void saveSSOTokenToPersistence(String portalName, String userName, SSOToken ssoToken) throws Exception {
        log.info("Enter saveSSOTokenToPersistence(" + portalName + ", ...)");

        // Obtain DB connection.
        DataAccess dataAccess = (DataAccess) getDataAccess(DBMS.COMMON_OLTP_DATASOURCE_NAME, false);
        Connection conn = (Connection) DBMS.getConnection(dataAccess.getDataSource());

        // Run SQL query.
        PreparedStatement ps = null;
        try {
            conn.setAutoCommit(false);

            // Delete old record.
            ps = conn.prepareStatement("DELETE sso_token"
                    + " WHERE portal_name=? AND user_name=?");
            ps.setString(1, portalName);
            ps.setString(2, userName);
            ps.executeUpdate();

            // Insert new record.
            ps = conn.prepareStatement("INSERT INTO sso_token"
                + " (portal_name,user_name,expires_at,url) VALUES (?,?,?,?)");
            ps.setString(1, portalName);
            ps.setString(2, userName);
            ps.setLong(3, ssoToken.getExpiresAt().getTime());
            ps.setString(4, ssoToken.getUrl());
            if (ps.executeUpdate() == 0) {
                throw new Exception("Insert query affected 0 rows.");
            }

            conn.commit();
        } finally {
            try {
                conn.rollback();
            } catch (Exception ex) { }
            try {
                ps.close();
            } catch (Exception ex) { }
            try {
                conn.close();
            } catch (Exception ex) { }
        }

        log.info("Exit saveSSOTokenToPersistence(" + portalName + ", ...)");
    }

}
