/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import com.topcoder.web.common.model.User;

/**
 * <p>
 * It is used to show my profile page.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class DisplayProfileAction extends BaseAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -3410720781070042520L;
    /**
     * Represents the user.
     */
    private User user;

    /**
     * Shows my profile.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        user = getUserDAO().find(getCurrentUser().getId());
        // eager fetch the values to be shown,otherwise exception thrown in front end page
        user.getPrimaryEmailAddress();
        return SUCCESS;
    }

    /**
     * The getter for the user instance variable.
     * 
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * The setter for the user instance variable.
     * 
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }
}
