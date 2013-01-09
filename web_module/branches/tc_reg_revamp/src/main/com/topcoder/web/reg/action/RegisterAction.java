/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
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
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Performs the registration action.
 * </p>
 * <p>
 * Version 1.1(Release Assembly - TC Registration Site 2 Handle Validation
 * Upgrade v1.0) Change notes:
 * <ol>
 * <li>{@link #validate()} method has been re-factored.</li>
 * </ol>
 * </p>
 * 
 * @version 1.1
 * @author live_world, leo_lol
 */
public class RegisterAction extends BaseAjaxAction implements PostAction {

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
     * Represents register source.
     */
    private static final String REGISTER_SOURCE_NAME = "reg2";
    
    /**
     * Registers a new user.
     * 
     * @throws Exception
     *             if an unexpected error occurs while processing the request
     */
    public void executeAction() throws Exception {
        // check the parameters
        checkRequired("firstName", "first name", firstName);
        checkRequired("lastName", "last name", lastName);
        checkRequired("email", "email", email);
        checkRequired("loginPassword", "login password", password);
        checkRequired("confirmPassword", "confirm password", passwordConfirm);
        
        if (password != null && passwordConfirm != null && !password.equals(passwordConfirm)) {
            addFieldError("confirmPassword", "Passwords do not match");
        }
        
        String randomString = getSessionData().getCaptchaWord();
        if (randomString == null || randomString.compareToIgnoreCase(captchaWord) != 0) {
            addFieldError("captchaWord", "Verification code doesn't match");
        }
    
        //Validate invalid handle
        if(!RegHelper.validateHandle(handle, this)) {
            return;
        }
        
        if (hasFieldErrors()) {
            return;
        }
                
        //Validate availability of the handle.
        if ((!RegHelper.isEmptyString(handle)) && getUserDAO().find(handle, true) != null) {
            addFieldError("handle", "The handle - '" + handle + "' is already registered, please use another one.");
            return;
        }

        //Validate availability of email.
        if ((!RegHelper.isEmptyString(email)) && getUserDAO().find(null, null, null, email).size() > 0) {
            addFieldError("email", "The email - '" + email + "' is already registered, please use another one.");
            return;
        }
        
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
            user.setRegSource(REGISTER_SOURCE_NAME);
            userDao.saveOrUpdate(user);
            
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("success", true);
            setResult(result);
        } catch (Exception e) {
            revertSecurityStuff(user, e);
            throw e;
        }
    }

    /**
     * The setter for the activationEmailBodyTemplateFile instance variable.
     * 
     * @param activationEmailBodyTemplateFile
     *            the activationEmailBodyTemplateFile to set
     */
    public void setActivationEmailBodyTemplateFile(String activationEmailBodyTemplateFile) {
        this.activationEmailBodyTemplateFile = activationEmailBodyTemplateFile;
    }

    /**
     * The setter for the activationEmailSubject instance variable.
     * 
     * @param activationEmailSubject
     *            the activationEmailSubject to set
     */
    public void setActivationEmailSubject(String activationEmailSubject) {
        this.activationEmailSubject = activationEmailSubject;
    }

    /**
     * The setter for the activationEmailFromAddress instance variable.
     * 
     * @param activationEmailFromAddress
     *            the activationEmailFromAddress to set
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
        // not save password to user table.
        user.setPassword(password);
        // create a new coder record
        Coder coder = new Coder();
        //coder.setCompCountry(DAOUtil.getFactory().getCountryDAO().find("840"));
        //coder.setCoderType(DAOUtil.getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL));
        user.setCoder(coder);
        return user;
    }

    /**
     * Reverts the security stuff.
     * 
     * @param user
     *            the User to revert
     * @param exception
     *            the occurred exception
     */
    private static void revertSecurityStuff(User user, Exception exception) {
        if (user != null && user.getId() != null) {
            Context ctx = null;
            try {
                ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemote pmr = pmrh.create();
                pmr.removeUser(new UserPrincipal("", user.getId().longValue()), new TCSubject(132456));

            } catch (Throwable ex) {
                LOGGER.error("problem in exception callback for user: " + user.getId() + " " + exception.getMessage());
            } finally {
                RegHelper.closeContext(LOGGER, ctx);
            }
        }
    }

    /**
     * Adds the user to security groups.
     * 
     * @param user
     *            the user to be created
     * @throws Exception
     *             any exception while creation
     */
    @SuppressWarnings("unchecked")
    private static void addSecurityStuff(User user) throws Exception {
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            // 132456 is a dump user id for creating user.this is from existing
            // code.
            TCSubject tcs = new TCSubject(132456);

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            // create the security user entry
            UserPrincipal myPrincipal = pmr.createUser(user.getId(), user.getHandle(), user.getPassword(), tcs,
                    DBMS.JTS_OLTP_DATASOURCE_NAME);

            // add them to these two as well. eventually i'm guessing we'll
            // rearrange security and this'll change
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
     * @param firstName
     *            the firstName to set
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
     * @param lastName
     *            the lastName to set
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
     * @param handle
     *            the handle to set
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
     * @param email
     *            the email to set
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
     * @param password
     *            the password to set
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
     * @param passwordConfirm
     *            the passwordConfirm to set
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
     * @param captchaWord
     *            the captchaWord to set
     */
    public void setCaptchaWord(String captchaWord) {
        this.captchaWord = captchaWord;
    }
    
    /**
     * Checks the parameter value is presented. If not, a field error message will be added.
     * 
     * @param fieldName the filed name of the parameter value
     * @param message the message to be displayed for end user
     * @param value the parameter value
     */
    private void checkRequired(String fieldName, String message, String value) {
        if (value == null || value.trim().length() == 0) {
            addFieldError(fieldName, "Please fill your " + message);
        }
    }
}
