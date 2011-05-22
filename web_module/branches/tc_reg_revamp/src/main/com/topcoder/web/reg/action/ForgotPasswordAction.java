/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.GregorianCalendar;
import java.util.List;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegHelper;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * Forgot password action.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class ForgotPasswordAction extends BaseAction {
    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 1151871221211796562L;
    /**
     * User handle.
     */
    private String handle;
    /**
     * User email.
     */
    private String email;

    /**
     * Represents activation email body template file.
     */
    private String emailBodyTemplateFile;

    /**
     * Represents activation email subject.
     */
    private String emailSubject;

    /**
     * Represents activation email from address.
     */
    private String emailFromAddress;

    /**
     * Sends an email to user with the link to reset the passsword.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @SuppressWarnings("unchecked")
    @Override
    public String execute() throws Exception {
        if (!RegHelper.isEmptyString(handle)) {
            User user = getUserDAO().find(handle, true);
            if (user == null) {
                addActionError("handle - " + handle + " is not found.");
                return "input";
            }
            sendPasswordEmail(user);
            return SUCCESS;
        }

        // email must be not empty here.
        List<User> users = getUserDAO().find(null, null, null, email);
        if (users == null || users.size() == 0) {
            addActionError("email - " + email + " is not found.");
            return "input";
        }
        sendPasswordEmail(users.get(0));
        return SUCCESS;
    }

    /**
     * Creates a password recovery entry in DB and send the the password email to the user.
     * 
     * @param user the user instance
     * @throws Exception if any exception occurs while sending the mail.
     */
    private void sendPasswordEmail(User user) throws Exception {
        GregorianCalendar expire = new GregorianCalendar();
        expire.add(GregorianCalendar.MINUTE, Constants.PASSWORD_RECOVERY_EXPIRE);
        PasswordRecovery pr = new PasswordRecovery();
        pr.setUser(user);
        pr.setRecoveryAddress(user.getPrimaryEmailAddress().getAddress());
        pr.setExpireDate(expire.getTime());
        DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(pr);
        // build the reset password URL.
        String url = ApplicationServer.SERVER_NAME + "/reg/password_reset.jsp?pr=" + pr.getId() + "&hc=" + pr.hash();
        String msg =
            RegHelper.readFileAsString(emailBodyTemplateFile).replace("%URL%", url).replace("%HANDLE%",
                user.getHandle());
        // send the email
        RegHelper.sendEmail(emailSubject, msg, pr.getRecoveryAddress(), emailFromAddress);
    }

    /**
     * The setter for the emailBodyTemplateFile instance variable.
     * 
     * @param emailBodyTemplateFile the emailBodyTemplateFile to set
     */
    public void setEmailBodyTemplateFile(String emailBodyTemplateFile) {
        this.emailBodyTemplateFile = emailBodyTemplateFile;
    }

    /**
     * The setter for the emailSubject instance variable.
     * 
     * @param emailSubject the emailSubject to set
     */
    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    /**
     * The setter for the emailFromAddress instance variable.
     * 
     * @param emailFromAddress the emailFromAddress to set
     */
    public void setEmailFromAddress(String emailFromAddress) {
        this.emailFromAddress = emailFromAddress;
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

    /**
     * The getter for the email instance variable.
     * 
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * The setter for the email instance variable.
     * 
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
}
