/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.Arrays;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegHelper;

/**
 * Login action.
 *
 * Change Log:
 * Version 1.1: Skip the preference page after login.
 * 
 * @author live_world, murphydog
 * @version 1.1
 */
public class LoginAction extends BaseAction implements PostAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -1747791224977073245L;

    /**
     * Represents the login error result.
     */
    private static final String LOGIN_ERROR_RESULT = "loginError";

    /**
     * User name(handle).
     */
    private String username;

    /**
     * User password.
     */
    private String password;

    /**
     * Remember me indicator.
     */
    private boolean rememberMe;

    /**
     * Performs login.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {

        TCSubject sub = null;
        // we need to check if they got the right user name and password before we check anything else
        try {
            LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
            sub = login.login(username, password, DBMS.JTS_OLTP_DATASOURCE_NAME);
            RegHelper.logDebug(LOGGER, "correct user name and password");
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            addActionError("user name or password incorrect");
            return LOGIN_ERROR_RESULT;
        }

        User user = getUserDAO().find(new Long(sub.getUserId()));
        char status = user.getStatus().charValue();
        RegHelper.logDebug(LOGGER, "user status: " + status);

        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, status) >= 0) {
            Integer emailStatus = user.getPrimaryEmailAddress().getStatusId();
            RegHelper.logDebug(LOGGER, "email status: " + emailStatus);
            // check if they have an active email address
            if (emailStatus != WebConstants.ACTIVE_EMAIL_STATUS) {
                getAuthentication().logout();
                RegHelper.logDebug(LOGGER, "inactive email");
                addActionError("Your email is inactive");
                return LOGIN_ERROR_RESULT;
            }

            RegHelper.logDebug(LOGGER, "user active");
            getAuthentication().login(new SimpleUser(0, username, password), rememberMe);
            getSessionData().setCurrentUser(getAuthentication().getUser());
            return SUCCESS;
        }
        getAuthentication().logout();
        if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, status) >= 0) {
            RegHelper.logDebug(LOGGER, "user inactive");
            addActionError("user inactive");
            return LOGIN_ERROR_RESULT;
        }
        if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, status) >= 0) {
            RegHelper.logDebug(LOGGER, "user unactive");
            addActionError("Your account is not active. "
                + "Please review the activation email that was sent to you after registration.");
            return LOGIN_ERROR_RESULT;
        }
        // go to general error page
        return ERROR;
    }

    /**
     * The getter for the username instance variable.
     * 
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * The setter for the username instance variable.
     * 
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * The getter for the password instance variable.
     * 
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * The setter for the password instance variable.
     * 
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * The getter for the rememberMe instance variable.
     * 
     * @return the rememberMe
     */
    public boolean isRememberMe() {
        return rememberMe;
    }

    /**
     * The setter for the rememberMe instance variable.
     * 
     * @param rememberMe the rememberMe to set
     */
    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

}
