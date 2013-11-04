/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import java.util.Date;

import javax.annotation.PostConstruct;
import javax.naming.Context;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.Constants;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.PasswordResetTokenService;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.dto.PasswordResetTokenDTO;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

/**
 * This action will be used to reset user's password per request.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * <p>
 * Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 *
 * Added {@link #msg},
 *       {@link #passwordResetTokenService},
 *       {@link #resetToken},
 * attributes
 *
 * Updated {@link #execute()} methods to use reset code instead of secret question.
 * </p>
 *
 * @author sampath01, leo_lol, Urmass ,TCSASSEMBLER
 * @version 1.1
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
	
	private static final Logger logger = Logger.getLogger(ResetPasswordAction.class);

    /**
     * Message to serialize.
     * @since 1.1
     */
    private String msg;

    /**
     * reset code.
     * @since 1.1
     */
    private String resetToken;

    /**
     * New password.
     */
    private String password;

    /**
     * Confirm new password.
     */
    private String confirmPassword;


    /**
     * Instance of {@link PasswordResetTokenService}, it'll be injected by Spring.
     * @since 1.1
     */
    private PasswordResetTokenService passwordResetTokenService;

    /**
     * This method resets user's password.
     * 
     * @throws Exception
     *             If there is any error.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);

        HttpSession session = ServletActionContext.getRequest().getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute(Constants.USER_DTO_SESSION_KEY);
        long emailTypeId = (Boolean) session.getAttribute(Constants.USE_PRIMARY_EMAIL_SESSION_KEY) ? 1 : 2;

        msg = null;
        if (null == userDTO) {
            msg = "Internal error";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }
        // find the reset code
        PasswordResetTokenDTO passwordResetToken = passwordResetTokenService.find(userDTO.getUserId(), emailTypeId);
        if (null == passwordResetToken) {
            msg = "Invalid password reset request";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }

        // validate reset code
        if (!passwordResetToken.getToken().equals(resetToken)) {
            msg = "Code is incorrect";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }
        if (passwordResetToken.getExpiredAt().before(new Date())) {
            msg = "Time expired for password reset";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }

        // validate password.
        if (RegistrationHelper.isNullOrEmptyString(password)) {
            addFieldError("password", "Password is required");
            msg = "Password is required";
        } else {
            final int passwordLen = password.length();
            if (passwordLen < Constants.MIN_PASSWORD_LENGTH || passwordLen > Constants.MAX_PASSWORD_LENGTH) {
                msg = "Length of password should be between " + Constants.MIN_PASSWORD_LENGTH
                        + " and " + Constants.MAX_PASSWORD_LENGTH;
            } else {
                int strength = RegistrationHelper.calculatePasswordStrength(password);
                switch (strength) {
                    case -1:
                        msg = "Password cannot end with a number";
                        break;
                    case 1:
                    case 2:
                        msg = "Password is too weak";
                        break;
                    default:
                        break;
                }
            }
        }
        if (msg != null) {
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }

        // validate confirm password.
        if (RegistrationHelper.isNullOrEmptyString(confirmPassword)) {
            msg = "Confirm password is required";
        } else {
            if (!confirmPassword.equals(password)) {
                msg = "Password and confirm password should be exactly same";
            }
        }

        if (msg != null) {
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }

        // expire the token
        passwordResetTokenService.expire(userDTO.getUserId(), emailTypeId);

        // this part wasn't changed in update
        // save the new password in user and security.
        Context ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

        // update the LDAP
        TCSubject tcs = new TCSubject(dumpUserId);
        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr = pmrh.create();
        UserPrincipal myPrincipal = new UserPrincipal("", userDTO.getUserId());
        pmr.editPassword(myPrincipal, password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

        msg = "OK";
        //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
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
        RegistrationHelper.checkNotNull("passwordResetTokenService", passwordResetTokenService,
                ConfigurationException.class);
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public String getResetToken() {
        return resetToken;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param resetToken
     *            the name-sake field to set
     */
    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }
    
    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public PasswordResetTokenService getPasswordResetTokenService() {
        return passwordResetTokenService;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param passwordResetTokenService
     *            the name-sake field to set
     */
    public void setPasswordResetTokenService(PasswordResetTokenService passwordResetTokenService) {
        this.passwordResetTokenService = passwordResetTokenService;
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
    public String getMsg() {
        return msg;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param msg
     *            the name-sake field to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }



}
