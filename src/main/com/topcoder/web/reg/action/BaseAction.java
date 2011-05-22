/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.reg.SessionData;

/**
 * <p>
 * Base action for registration module.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public abstract class BaseAction extends ActionSupport {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -7868971262016467074L;

    /**
     * Logger instance for logging in the action.
     */
    protected static final Logger LOGGER = Logger.getLogger(BaseAction.class);

    /**
     * <p>
     * A SessionData providing access to current session context for this action.
     * </p>
     */
    private SessionData sessionData;

    /**
     * Current web authentication information of the user.
     */
    private WebAuthentication authentication;

    /**
     * Retrieves the user DAO.
     * 
     * @return the user DAO instance.
     */
    protected static UserDAO getUserDAO() {
        return DAOUtil.getFactory().getUserDAO();
    }

    /**
     * Gets the authentication instance variable.
     * 
     * @return the WebAuthentication instance
     */
    public WebAuthentication getAuthentication() {
        return authentication;
    }

    /**
     * Gets the sessionData instance variable.
     * 
     * @return the SessionData instance
     */
    public SessionData getSessionData() {
        return sessionData;
    }

    /**
     * Sets the SessionData instance. It is called by <code>RegBasicInterceptor</code>.
     * 
     * @param sessionData the sessionData to set
     */
    public void setSessionData(SessionData sessionData) {
        this.sessionData = sessionData;
    }

    /**
     * Sets the WebAuthentication instance. It is called by <code>RegBasicInterceptor</code>.
     * 
     * @param authentication the authentication to set
     */
    public void setAuthentication(WebAuthentication authentication) {
        this.authentication = authentication;
    }

    /**
     * Retrieve the user that authenticated to application.
     * 
     * @return the user User instance
     */
    public User getCurrentUser() {
        User user = getSessionData().getCurrentUser();
        if (user != null) {
            return user;
        }
        user = getAuthentication().getUser();
        if (!user.isAnonymous()) {
            getSessionData().setCurrentUser(user);
            return user;
        }
        return null;
    }
}
