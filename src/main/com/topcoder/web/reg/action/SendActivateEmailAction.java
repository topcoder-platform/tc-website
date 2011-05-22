/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Sends activate email to user.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class SendActivateEmailAction extends BaseAction implements GetAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 3698318824302674905L;

    /**
     * User handle.
     */
    private String handle;

    /**
     * Represents activation email body template file.
     */
    private String activationEmailBodyTemplateFile;

    /**
     * Represents activation email subject.
     */
    private String activationEmailSubject;

    /**
     * Represents activation email from address.
     */
    private String activationEmailFromAddress;

    /**
     * Sends activate email to user.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        if (RegHelper.isEmptyString(handle)) {
            addActionError("please append your handle name to the URL.");
            return ERROR;
        }

        UserDAO userDAO = getUserDAO();
        User user = userDAO.find(handle, true);
        if (user == null) {
            addActionError("user with the handle name " + handle + " is not found.");
            return ERROR;
        }

        if (RegHelper.isEmptyString(user.getActivationCode())) {
            user.setActivationCode(StringUtils.getActivationCode(user.getId().longValue()));
            userDAO.saveOrUpdate(user);
        }
        RegHelper.sendActivationEmail(activationEmailSubject, user.getActivationCode(),
            activationEmailBodyTemplateFile, user.getPrimaryEmailAddress().getAddress(), activationEmailFromAddress);
        return SUCCESS;
    }

    /**
     * The setter for the activationEmailBodyTemplateFile instance variable.
     * 
     * @param activationEmailBodyTemplateFile the activationEmailBodyTemplateFile to set
     */
    public void setActivationEmailBodyTemplateFile(String activationEmailBodyTemplateFile) {
        this.activationEmailBodyTemplateFile = activationEmailBodyTemplateFile;
    }

    /**
     * The setter for the activationEmailSubject instance variable.
     * 
     * @param activationEmailSubject the activationEmailSubject to set
     */
    public void setActivationEmailSubject(String activationEmailSubject) {
        this.activationEmailSubject = activationEmailSubject;
    }

    /**
     * The setter for the activationEmailFromAddress instance variable.
     * 
     * @param activationEmailFromAddress the activationEmailFromAddress to set
     */
    public void setActivationEmailFromAddress(String activationEmailFromAddress) {
        this.activationEmailFromAddress = activationEmailFromAddress;
    }

    /**
     * The getter for the handle instance variable.
     * 
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * The setter for the handle instance variable.
     * 
     * @param handle the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }
}