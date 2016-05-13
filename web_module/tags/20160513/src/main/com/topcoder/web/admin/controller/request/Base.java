/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;

/**
 * <p>A base class for controllers processing the requests for <code>TopCoder Administration</code> module.</p>
 *
 * <p>
 *   Version 1.2 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Added method {@link #getTermsOfUseDao()} to get the terms of use DAO instance.</li>
 *     <li>Added method {@link #getUserTermsOfUseDao()} to get the user terms of use DAO instance.</li>
 *     <li>Added method {@link #getConfiguration(String)} to get the configuration object by namespace.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, isv, TCSASSEMBER
 * @version $Revision$ $Date$
 *          Create Date: Nov 9, 2005
 * @version 1.2
 * @since 1.0
 */
abstract public class Base extends BaseProcessor {

    /**
     * <p>Represents the instance of terms of use DAO.</p>
     * 
     * @since 1.2
     */
    private TermsOfUseDao termsOfUseDao = null;
    
    /**
     * <p>Represents the instance of user terms of use DAO.</p>
     * 
     * @since 1.2
     */
    private UserTermsOfUseDao userTermsOfUseDao = null;
    
    /**
     * <p>A <code>String</code> providing the location of the configuration file used
     * by configuration manager component.</p>
     * 
     * @since 1.2
     */
    private static final String CONFIGURATION_FILE = "com/topcoder/util/config/ConfigManager.properties";
    
    /**
     * <p>Constructs new <code>Base</code> instance. This implementation does nothing.</p>
     *
     * @since 1.1
     */
    protected Base() {
    }

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

    /**
     * <p>Validates the incoming request for providing the user ID. If such request parameter is missing or if it
     * does not provide valid user ID then an error message is bound to request.</p>
     *
     * @return a <code>Long</code> providing the user ID provided by request or <code>null</code> if there were
     *         validation errors discovered.
     * @throws NavigationException if the specified user can't be retrieved.
     * @since 1.1
     */
    protected Long validateUserId() throws NavigationException {
        String userIdString = StringUtils.checkNull(getRequest().getParameter(Constants.USER_ID));

        if ("".equals(userIdString)) {
            addError(Constants.USER_ID, "User ID is missing");
            return null;
        } else {
            Long userId = new Long(userIdString);
            String handle = null;
            try {
                handle = getUserHandleFromId(userId);
            } catch (Exception e) {
                throw new NavigationException("There was an unexpected error while retrieving specified user.", e);
            }
            if (handle == null) {
                addError(Constants.USER_ID, "The user ID you entered doesn't exist. Please enter a valid user ID.");
            }
            return userId;
        }
    }

    /**
     * <p>Validates the incoming request for providing the user handle. If such request parameter is missing or if it
     * does not provide valid user handle then an error message is bound to request.</p>
     *
     * @return a <code>Long</code> providing the ID for user account matching the handle or <code>null</code> if there
     *         were validation errors discovered.
     * @throws NavigationException if the specified user can't be retrieved.
     * @since 1.1
     */
    protected Long validateHandle() throws NavigationException {
        String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));

        if ("".equals(handle)) {
            addError(Constants.HANDLE, "You must enter a handle.");
            return null;
        } else {
            Long userId = null;
            try {
                userId = getUserIdFromHandle(handle);
            } catch (Exception e) {
                throw new NavigationException("There was an unexpected error while retrieving specified user.", e);
            }
            if (userId == null) {
                addError(Constants.HANDLE, "The handle you entered doesn't exist. Please enter a valid handle.");
            }
            return userId;
        }
    }

    /**
     * <p>Finds the user account matching the specified handle.</p>
     *
     * @param handle a <code>String</code> providing the user handle to find matching user account for.
     * @return a <code>Long</code> providing the ID for user account matching the handle or <code>null</code> if there
     *         was no matching user account found.
     * @throws Exception if any error occurs.
     * @since 1.1
     */
    private Long getUserIdFromHandle(String handle) throws Exception {
        PrincipalMgrRemoteHome principalMgrHome
            = (PrincipalMgrRemoteHome) getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = principalMgrHome.create();
        try {
            UserPrincipal up = principalMgr.getUser(handle);
            return up.getId();
        } catch (NoSuchUserException e) {
            // don't do anything, return null
        }
        return null;
    }

    /**
     * <p>Finds the user account matching the specified handle.</p>
     *
     * @param userId a <code>long</code> providing the user ID to find matching user account for.
     * @return a <code>String</code> providing the handle for user account matching the ID or <code>null</code> if there
     *         was no matching user account found.
     * @throws Exception if any error occurs.
     * @since 1.1
     */
    private String getUserHandleFromId(long userId) throws Exception {
        PrincipalMgrRemoteHome principalMgrHome
            = (PrincipalMgrRemoteHome) getInitialContext().lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = principalMgrHome.create();
        try {
            UserPrincipal up = principalMgr.getUser(userId);
            return up.getName();
        } catch (NoSuchUserException e) {
            // don't do anything, return null
        }
        return null;
    }
    
    /**
     * <p>Gets the instance of the terms of use DAO.</p>
     * 
     * @return the instance of the terms of use DAO
     * @throws Exception if any error occurs
     * @since 1.2
     */
    protected TermsOfUseDao getTermsOfUseDao() throws Exception {
        if (termsOfUseDao == null) {
            termsOfUseDao = new TermsOfUseDaoImpl(getConfiguration(Constants.TERMS_OF_USE_DAO_NS));
        }
        return termsOfUseDao;
    }
    
    /**
     * <p>Gets the instance of the user terms of use DAO.</p>
     * 
     * @return the instance of the user terms of use DAO
     * @throws Exception if any error occurs
     * @since 1.2
     */
    protected UserTermsOfUseDao getUserTermsOfUseDao() throws Exception {
        if (userTermsOfUseDao == null) {
            userTermsOfUseDao = new UserTermsOfUseDaoImpl(getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS));
        }
        return userTermsOfUseDao;
    }
    
    /**
     * <p>Gets the configuration object by the namespace.</p>
     * 
     * @param namespace the namespace of the configuration
     * @return the corresponding configuration object
     * @throws Exception if any error occurs
     * @since 1.2
     */
    private ConfigurationObject getConfiguration(String namespace) throws Exception {
        return new ConfigurationFileManager(CONFIGURATION_FILE).getConfiguration(namespace).getChild(namespace);
    }
}
