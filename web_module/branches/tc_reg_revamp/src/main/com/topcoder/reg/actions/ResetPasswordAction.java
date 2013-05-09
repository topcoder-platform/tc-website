/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import java.util.Date;

import javax.annotation.PostConstruct;
import javax.naming.Context;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.Constants;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.PasswordRecoveryService;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.model.PasswordRecovery;

/**
 * This action will be used to reset user's password per request.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class ResetPasswordAction extends BaseAction {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -7762416527448399814L;

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = ResetPasswordAction.class.getName();

    /**
     * Password recovery ID.
     */
    private Long passwordRecoveryId;

    /**
     * New password.
     */
    private String password;

    /**
     * Confirm new password.
     */
    private String confirmPassword;

    /**
     * Instance of {@link PasswordRecoveryService}, it'll be injected by Spring.
     */
    private PasswordRecoveryService passwordRecoveryService;

    /**
     * This method resets user's password.
     * 
     * @throws Exception
     *             If there is any error.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        LoggingWrapperUtility.logEntrance(logger, signature, null, null);

        PasswordRecovery passwordRecovery = passwordRecoveryService.find(passwordRecoveryId);

        if (null == passwordRecovery) {
            addActionError("Invalid password reset request");
            LoggingWrapperUtility.logExit(logger, signature, new String[] { ERROR });
            return ERROR;
        }

        // validate password.
        if (RegistrationHelper.isNullOrEmptyString(password)) {
            addFieldError("password", "Password is required");
        } else {
            final int passwordLen = password.length();
            if (passwordLen < Constants.MIN_PASSWORD_LENGTH || passwordLen > Constants.MAX_PASSWORD_LENGTH) {
                addFieldError("password", "Length of password should be between " + Constants.MIN_PASSWORD_LENGTH
                        + " and " + Constants.MAX_PASSWORD_LENGTH);
            } else {
                int strength = RegistrationHelper.calculatePasswordStrength(password);
                switch (strength) {
                case -1:
                    addFieldError("password", "Password cannot end with a number");
                    break;
                case 1:
                case 2:
                    addFieldError("password", "Password is too weak");
                    break;
                default:
                    break;
                }
            }
        }

        // validate confirm password.
        if (RegistrationHelper.isNullOrEmptyString(confirmPassword)) {
            addFieldError("confirmPassword", "Confirm password is required");
        } else {
            if (!confirmPassword.equals(password)) {
                addFieldError("confirmPassword", "Password and confirm password should be exactly same");
            }
        }

        if (!getFieldErrors().isEmpty()) {
            LoggingWrapperUtility.logExit(logger, signature, new String[] { ERROR });
            return ERROR;
        }

        if (passwordRecovery.isUsed()) {
            addActionError("Password is already changed");
            LoggingWrapperUtility.logExit(logger, signature, new String[] { ERROR });
            return ERROR;
        }

        if (passwordRecovery.getExpireDate().before(new Date())) {
            addActionError("Time expired for password reset");
        }
        passwordRecoveryService.use(passwordRecoveryId);

        // save the new password in user and security.
        Context ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);

        // update the LDAP
        TCSubject tcs = new TCSubject(dumpUserId);
        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr = pmrh.create();
        UserPrincipal myPrincipal = new UserPrincipal("", passwordRecovery.getUser().getId());
        pmr.editPassword(myPrincipal, password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
        LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
        return SUCCESS;
    }

    /**
     * This method checks success of IoC.
     * 
     * @throws ConfigurationException
     *             there is any configuration error.
     */
    @PostConstruct
    public void checkConfiguration() throws ConfigurationException {
        super.checkConfiguration();
        RegistrationHelper.checkNotNull("passwordRecoveryService", passwordRecoveryService,
                ConfigurationException.class);
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public Long getPasswordRecoveryId() {
        return passwordRecoveryId;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param passwordRecoveryId
     *            the name-sake field to set
     */
    public void setPasswordRecoveryId(Long passwordRecoveryId) {
        this.passwordRecoveryId = passwordRecoveryId;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getPassword() {
        return password;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param password
     *            the name-sake field to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param confirmPassword
     *            the name-sake field to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public PasswordRecoveryService getPasswordRecoveryService() {
        return passwordRecoveryService;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param passwordRecoveryService
     *            the name-sake field to set
     */
    public void setPasswordRecoveryService(PasswordRecoveryService passwordRecoveryService) {
        this.passwordRecoveryService = passwordRecoveryService;
    }

}
