/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.Collection;

import javax.naming.Context;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Performs the registration action.
 * </p>
 * 
 * @author live_world
 */
public class RegisterAction extends BaseAction implements PostAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -3262433961862940959L;

    /**
     * First name of the user.
     */
    private String firstName;
    /**
     * Last name of the user.
     */
    private String lastName;

    /**
     * Handle of the user.
     */
    private String handle;
    /**
     * email of the user.
     */
    private String email;
    /**
     * password of the user.
     */
    private String password;
    /**
     * passwordConfirm of the user.
     */
    private String passwordConfirm;
    /**
     * captcha word of the user.
     */
    private String captchaWord;

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
     * Validates the user.
     */
    @Override
    public void validate() {
        if ((!RegHelper.isEmptyString(handle)) && getUserDAO().find(handle, true) != null) {
            addActionError("The handle - " + handle + " is not available, please use another one.");
            return;
        }

        if ((!RegHelper.isEmptyString(email)) && getUserDAO().find(null, null, null, email).size() > 0) {
            addActionError("The email - " + email + " is not available, please use another one.");
            return;
        }

        if ((!RegHelper.isEmptyString(handle)) && !StringUtils.containsOnly(handle, Constants.HANDLE_ALPHABET, false)) {
        	addActionError("Your user name may contain only letters, numbers and " + Constants.HANDLE_PUNCTUATION);
        	return;
        }

        if ((!RegHelper.isEmptyString(handle)) && StringUtils.containsOnly(handle, Constants.HANDLE_PUNCTUATION, false)) {
        	addActionError("Your user name may not contain only punctuation.");
        	return;
        }

        if ((!RegHelper.isEmptyString(handle)) && handle.toLowerCase().trim().startsWith("admin")) {
        	addActionError("Please choose another user name.");
        	return;
        }
    }

    /**
     * Registers a new user.
     * 
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        User user = populateUser();
        try {
            UserDAO userDao = getUserDAO();
            userDao.saveOrUpdate(user);
            String activationCode = StringUtils.getActivationCode(user.getId().longValue());
            addSecurityStuff(user);
            // send activation mail
            if (email != null) {
              RegHelper.sendActivationEmail(activationEmailSubject, activationCode, activationEmailBodyTemplateFile,
                  email, activationEmailFromAddress);
            }
            user.setActivationCode(activationCode);
            userDao.saveOrUpdate(user);
        } catch (Exception e) {
            revertSecurityStuff(user, e);
            throw e;
        }
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
     * Populates the User instance.
     * 
     * @return User instance
     */
    private User populateUser() {
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setHandle(handle);
        if (email != null) {
          Email emailAdd = new Email();
          emailAdd.setAddress(email);
          emailAdd.setPrimary(Boolean.TRUE);
          emailAdd.setEmailTypeId(Email.TYPE_ID_PRIMARY);
          emailAdd.setStatusId(Email.STATUS_ID_UNACTIVE);
          emailAdd.setUser(user);
          user.addEmailAddress(emailAdd);
        }
        user.setPassword(password);
        return user;
    }

    /**
     * Reverts the security stuff.
     * 
     * @param user the User to revert
     * @param exception the occurred exception
     */
    private static void revertSecurityStuff(User user, Exception exception) {
        if (user != null && user.getId() != null) {
            Context ctx = null;
            try {
                ctx =
                    TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome pmrh =
                    (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemote pmr = pmrh.create();
                pmr.removeUser(new UserPrincipal("", user.getId().longValue()), new TCSubject(132456));

            } catch (Throwable ex) {
                LOGGER
                    .error("problem in exception callback for user: " + user.getId() + " " + exception.getMessage());
            } finally {
                RegHelper.closeContext(LOGGER, ctx);
            }
        }
    }

    /**
     * Adds the user to security groups.
     * 
     * @param user the user to be created
     * @throws Exception any exception while creation
     */
    @SuppressWarnings("unchecked")
    private static void addSecurityStuff(User user) throws Exception {
        Context ctx = null;
        try {
            ctx =
                TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            // 132456 is a dump user id for creating user.this is from existing code.
            TCSubject tcs = new TCSubject(132456);

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            // create the security user entry
            UserPrincipal myPrincipal =
                pmr
                    .createUser(user.getId(), user.getHandle(), user.getPassword(), tcs,
                        DBMS.JTS_OLTP_DATASOURCE_NAME);

            // add them to these two as well. eventually i'm guessing we'll rearrange security and this'll change
            Collection<GroupPrincipal> groups = pmr.getGroups(tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            GroupPrincipal anonGroup = RegHelper.findGroupPrincipal(groups, "Anonymous");
            if (anonGroup != null) {
                pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }
            GroupPrincipal userGroup = RegHelper.findGroupPrincipal(groups, "Users");
            if (userGroup != null) {
                pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            // refresh the cached object
            SecurityHelper.getUserSubject(user.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } finally {
            RegHelper.closeContext(LOGGER, ctx);
        }

    }

    /**
     * The getter for the firstName instance variable.
     * 
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * The setter for the firstName instance variable.
     * 
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * The getter for the lastName instance variable.
     * 
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * The setter for the lastName instance variable.
     * 
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
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
     * The getter for the passwordConfirm instance variable.
     * 
     * @return the passwordConfirm
     */
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    /**
     * The setter for the passwordConfirm instance variable.
     * 
     * @param passwordConfirm the passwordConfirm to set
     */
    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    /**
     * The getter for the captchaWord instance variable.
     * 
     * @return the captchaWord
     */
    public String getCaptchaWord() {
        return captchaWord;
    }

    /**
     * The setter for the captchaWord instance variable.
     * 
     * @param captchaWord the captchaWord to set
     */
    public void setCaptchaWord(String captchaWord) {
        this.captchaWord = captchaWord;
    }

}
