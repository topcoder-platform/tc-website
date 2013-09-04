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
import java.util.UUID;

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
        User user = getUser();
        String action = getRequest().getParameter("action");

        if ("login".equals(action)) {
            if (!userIdentified()) {
              // User not logged in. Thus redirect to login page.
              throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }  
	    // This is a request to go to portal. Thus obtain SSO token and redirect user to SSO URL.
            // Find Access3scale corresponding to request portal.
            Access3scale access3scale = null;
            for (Access3scale a3s : access3scales) {
                if (a3s.getPortalName().equals(getRequest().getParameter("portalName"))) {
                    access3scale = a3s;
                    break;
                }
            }
	    if(access3scale == null) {
		throw new TCWebException("No such portal exists");
	    }
            // Obtain SSO token.
            SSOToken ssoToken = null;
            try {
		if(access3scale.retrieveUser(user.getUserName()) == null) {
			access3scale.createUser(user.getUserName(), generatePassword() , getEmailAddressOfUser(user.getUserName()));
		}
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
                } catch (Exception ex) {
                    throw new TCWebException(ex);
                }
            }
            // Redirect user to SSO URL.
            setNextPage(ssoToken.getUrl());
            return;
        } else if ("checkUser".equals(action)) {
	    getResponse().setContentType("application/json");
	    String response = "{";
	    if (!userIdentified()) {
                // User not logged in.
		response = response + "\"isLogin\":\"false\"}";
            } else {
		response = response + "\"isLogin\":\"true\",\"username\":\"" + user.getUserName() + "\",";
	    // This is a request to check if user is logged in. Thus obtain SSO token and redirect user to SSO URL.
            // Find Access3scale corresponding to request portal.
            Access3scale access3scale = null;
            for (Access3scale a3s : access3scales) {
                if (a3s.getPortalName().equals(getRequest().getParameter("portalName"))) {
                    access3scale = a3s;
                    break;
                }
            }
	    if(access3scale == null) {
		throw new TCWebException("No such portal exists");
	    }
            // Obtain SSO token.
            SSOToken ssoToken = null;
            try {
		if(access3scale.retrieveUser(user.getUserName()) == null) {
			access3scale.createUser(user.getUserName(), generatePassword() , getEmailAddressOfUser(user.getUserName()));
		}
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
                } catch (Exception ex) {
                    throw new TCWebException(ex);
                }
            }
            // Redirect user to SSO URL.
            // setNextPage(ssoToken.getUrl());
	    response = response + "\"ssoURL\":\"" + ssoToken.getUrl() + "\"}";
	    }
            try {
		if(getRequest().getParameter("callback") != null) {
			response = getRequest().getParameter("callback") + "(" + response + ")";
		}
		getResponse().getOutputStream().write(response.getBytes());
	    	getResponse().flushBuffer();
	    } catch (Exception ex) {
		throw new TCWebException(ex);
	    }
            return;
        }
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

    /**
     * Generates a random password.
     *
     * @return generated password
     */
    private String generatePassword() {
	String uuid = UUID.randomUUID().toString();
	uuid = uuid.replaceAll("-","");
	Random random = new Random();
	char[] password = new char[9];
	for(int i = 0 ; i<9; i++) {
 		if(i == 4) {
			password[i] = '_';
			continue;
		}
		password[i] = uuid.charAt(random.nextInt(30));
	}
	return new String(password);
    }

    /**
     * Retrieves email address of user.
     *
     * @return email address of user
     */
    private String getEmailAddressOfUser(String username) throws Exception {
	// Obtain DB connection.
        DataAccess dataAccess = (DataAccess) getDataAccess(DBMS.COMMON_OLTP_DATASOURCE_NAME, false);
        Connection conn = (Connection) DBMS.getConnection(dataAccess.getDataSource());

        // Run SQL query.
        PreparedStatement ps = null;
        ResultSet rs = null;
        SSOToken ssoToken = null;
        try {
            ps = conn.prepareStatement("SELECT e.address FROM email e, user u"
                    + " WHERE u.handle = ? and e.user_id = u.user_id"); 
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
		return rs.getString(1);
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
	throw new Exception("Email of user cannot be found");
    }

}
