/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.EmailSetting;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.Constants;
import com.topcoder.web.common.WebConstants;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.dto.UserInfoDTO;
import com.topcoder.reg.dto.PasswordResetTokenDTO;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.PasswordResetTokenService;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.EntityNotFoundException;
import com.topcoder.reg.util.DataProvider;
import com.topcoder.reg.validation.EmailValidator;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.reg.authentication.strategies.TokenGenerator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.shared.util.logging.Logger;

import java.util.Date;
import java.util.TimeZone;
import java.text.SimpleDateFormat;
import java.text.DateFormat;

/**
 * This action will be used to send reset password email notification given handle, first name, last name , email,
 * secrete question and answer are all provided correctly.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 *
 * <p>
 * Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 * Added {@link #msg},
 *       {@link #passwordResetTokenService},
 *       {@link #userQuery},
 *       {@link #usePrimaryEmail},
 *       {@link #userDTO}
 *       {@link #emailStatus},
 *       {@link #reSendBtnDelay},
 *       {@link #expireTime}
 * attributes
 * 
 * Updated {@link #execute()},
 *         {@link #ajaxFindUser()}
 * methods to use reset code instead of secret question.
 * </p>
 * 
 * @author sampath01, leo_lol, Urmass ,TCSASSEMBLER
 * @version 1.1
 * @since 1.0
 */
public class ForgotPasswordAction extends BaseAction {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 8859241202193100159L;

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = ForgotPasswordAction.class.getName();
	
	private static final Logger logger = Logger.getLogger(ForgotPasswordAction.class);


    
    /**
     * Message to serialize.
     * @since 1.1
     */
    private String msg;

    /**
     * Instance of {@link PasswordResetTokenService}, it'll be injected by Spring.
     * @since 1.1
     */
    private PasswordResetTokenService passwordResetTokenService;

    /**
     * Email settings to send reset-password email notification. It'll be injected by Spring.
     */
    private EmailSetting emailSetting;

    /**
     * Instance of {@link TokenGenerator}
     * @since 1.1
     */
    private static TokenGenerator generator;

    /**
     * user query.
     * @since 1.1
     */
    private String userQuery;

    /**
     * if use primary email
     * @since 1.1
     */
    private Boolean usePrimaryEmail;

    /**
     * user dto.
     * @since 1.1
     */
    private UserDTO userDTO;

    /**
     * the email status for primary/secondary email.
     * 0--> both are not exited
     * 1--> primary email existed
     * 2--> secondary email existed
     * 3--> both are existed
     * @since 1.1
     */
    private int emailStatus;


    /**
     * the delayed time(in seconds) to allow resend the token again.
     * this attribute is used to pass the delay time to client side.
     * @since 1.1
     */
    private int reSendBtnDelay;

    /**
     * The expire time(in seconds) of the token, this attribute is used to pass the expire time to client side.
     * @since 1.1
     */
    private int expireTime;

    
    /**
     * This method would validate input-data and send reset-password email notification.
     * 
     * @return Result code.
     * @throws Exception
     *             If there is any error.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);


        HttpSession session = ServletActionContext.getRequest().getSession();
        // Check if the user use primary email to receive the token 
        if (usePrimaryEmail == null) {
            usePrimaryEmail = (Boolean) session.getAttribute(Constants.USE_PRIMARY_EMAIL_SESSION_KEY);
        } else {
            session.setAttribute(Constants.USE_PRIMARY_EMAIL_SESSION_KEY, usePrimaryEmail);
        }
        long emailTypeId = usePrimaryEmail ? 1 : 2;

        UserDTO userDTO = (UserDTO) session.getAttribute(Constants.USER_DTO_SESSION_KEY);
        if (null == userDTO) {
            msg = "Session error";
        } else {
            Date now = new Date();
            // find the reset code
            PasswordResetTokenDTO passwordResetToken = passwordResetTokenService.find(userDTO.getUserId(), emailTypeId);

            //Token existed and not expired
            if(passwordResetToken != null && now.before(passwordResetToken.getExpiredAt())) {
                //show error page:
                msg = "You have already requested the token and please contact support@topcoder.com for help";
            } else {
                TimeZone tz = TimeZone.getTimeZone("America/New_York");
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z");
                df.setTimeZone(tz);

                // load token generator
                generator = loadGenerator(Constants.RESET_TOKEN_GENERATOR_CLASS);

                String resetEmail = (usePrimaryEmail) ? userDTO.getEmail() : userDTO.getSecondaryEmail();
                // generate token and save it
                String token = generator.generate();
                Date expiredAt = new Date(new Date().getTime() + Constants.RESET_TOKEN_AGE * 1000);
                PasswordResetTokenDTO tokenDTO = new PasswordResetTokenDTO();
                tokenDTO.setUserId(userDTO.getUserId());
                tokenDTO.setToken(token);
                tokenDTO.setExpiredAt(expiredAt);
                tokenDTO.setEmailTypeId(emailTypeId);
                passwordResetTokenService.save(tokenDTO);
                // send the reset password email
                RegistrationHelper.sendResetPasswordEmail(emailSetting, resetEmail, token, userDTO.getHandle(), df.format(expiredAt));
                expireTime = Constants.RESET_TOKEN_AGE;
                msg = "OK";
            }
        }
        //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
        return SUCCESS;
    }

    /**
     * Loads the the user by the email (primary or second) and puts it to the session.
     *
     * @return - logical result of the execution as String, SUCCESS in case of success.
     * @throws Exception
     *             If there is any error.
     */
    public String ajaxFindUser() throws Exception {
        final String signature = CLASS_NAME + "#ajaxFindUser()";
        logger.info(signature);

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        UserInfoDTO info = null;
        reSendBtnDelay = Constants.RESEND_TOKEN_DELAY_SECONDS;
        userDTO = null;
        emailStatus = 0;

        ValidationResult vr = new EmailValidator().validate(new StringInput(userQuery));
        try {
            if (vr.isValid())  {
                if(userService.multipleUsers(userQuery)) {
                    msg = "We found multiple accounts associated with your email. Please contact support@topcoder.com to unify your accounts first";
                } else {
                    userDTO = userService.getUserByEmail(userQuery);
                }
            } else {
                userDTO = userService.getUserByHandle(userQuery);
            }
            if(null != userDTO) {
                info = DataProvider.getUserStatusByHandle(userDTO.getHandle());
            }
        } catch(PersistenceException e) {
            if(vr.isValid()) {
                msg = "No user found with the given email";
            } else {
                msg = "No user found with the given handle";
            }
        } catch(EntityNotFoundException e) {
            //ignore, since the UserInfoDTO can always be found. 
        }

        if (null != userDTO ) {
            //check if the email is active
            if (info.getEmailStatus() != WebConstants.ACTIVE_EMAIL_STATUS) {
                msg = "Your email is inactive";
            } else {
                if(userDTO.getEmail() != null && userDTO.getSecondaryEmail() == null) {
                    emailStatus = 1;
                } else if (userDTO.getEmail() == null && userDTO.getSecondaryEmail() != null) {
                    emailStatus = 2;
                } else if (userDTO.getEmail() != null && userDTO.getSecondaryEmail() != null) {
                    emailStatus = 3;
                }
                msg = "OK";
            }
        }
        
        session.setAttribute(Constants.USER_DTO_SESSION_KEY, userDTO);

        //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
        return SUCCESS;

    }

    /**
     * Helper method to load the TokenGenerator.
     *
     * @className - the full class name of the TokenGenerator implementation.
     * @return - the implementation of TokenGenerator instance.
     *
     * @throws  Exception - If failed to instantiate by reflection.
     */
    private static TokenGenerator loadGenerator(String className) throws Exception {
        Class<?> clazz = Class.forName(className);
        if(generator == null) {
            generator = (TokenGenerator) clazz.newInstance();
        }
        return generator; 
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
        RegistrationHelper.checkNotNull("emailSetting", emailSetting, ConfigurationException.class);
    }

    /**
     * This method checks if the given String is neither null nor empty.
     * 
     * @param s
     *            String to check.
     * @return true if neither null nor empty; false otherwise.
     */
    private boolean isNonEmpty(String s) {
        return null != s && s.trim().length() > 0;
    }

    /**
     * Has access to email account.
     */
    private boolean accessEmailAccount;


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
    public String getUserQuery() {
        return userQuery;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param userQuery
     *            the name-sake field to set
     */
    public void setUserQuery(String userQuery) {
        this.userQuery = userQuery;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public Boolean isUsePrimaryEmail() {
        return usePrimaryEmail;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param usePrimaryEmail
     *            the name-sake field to set
     */
    public void setUsePrimaryEmail(Boolean usePrimaryEmail) {
        this.usePrimaryEmail = usePrimaryEmail;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public UserDTO getUserDTO() {
        return userDTO;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param userDTO
     *            the name-sake field to set
     */
    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public boolean isAccessEmailAccount() {
        return accessEmailAccount;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param accessEmailAccount
     *            the name-sake field to set
     */
    public void setAccessEmailAccount(boolean accessEmailAccount) {
        this.accessEmailAccount = accessEmailAccount;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public EmailSetting getEmailSetting() {
        return emailSetting;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param emailSetting
     *            the name-sake field to set
     */
    public void setEmailSetting(EmailSetting emailSetting) {
        this.emailSetting = emailSetting;
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

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public int getEmailStatus() {
        return emailStatus;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param emailStatus
     *            the name-sake field to set
     */
    public void setEmailStatus(int emailStatus) {
        this.emailStatus = emailStatus;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public int getReSendBtnDelay() {
        return reSendBtnDelay;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param reSendBtnDelay
     *            the name-sake field to set
     */
    public void setReSendBtnDelay(int reSendBtnDelay) {
        this.reSendBtnDelay = reSendBtnDelay;
    }

    /**
     * Getter of the name-sake field.
     *
     * @return the value of name-sake field.
     */
    public int getExpireTime() {
        return expireTime;
    }

    /**
     * Setter of the name-sake field.
     *
     * @param expireTime
     *            the name-sake field to set
     */
    public void setExpireTime(int expireTime) {
        this.expireTime = expireTime;
    }
}
