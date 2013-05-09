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
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.PasswordRecoveryService;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.util.DataProvider;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.model.SecretQuestion;

/**
 * This action will be used to send reset password email notification given handle, first name, last name , email,
 * secrete question and answer are all provided correctly.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
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

    /**
     * Handle
     */
    private String handle;

    /**
     * First name.
     */
    private String firstName;

    /**
     * Last name.
     */
    private String lastName;

    /**
     * Email address.
     */
    private String email;

    /**
     * Secret question.
     */
    private String secretQuestion;

    /**
     * Secret answer.
     */
    private String secretAnswer;

    /**
     * Message to serialize.
     */
    private String msg;

    /**
     * Instance of {@link PasswordRecoveryService}, it'll be injected by Spring.
     */
    private PasswordRecoveryService passwordRecoveryService;

    /**
     * Email settings to send reset-password email notification. It'll be injected by Spring.
     */
    private EmailSetting emailSetting;

    /**
     * Session key to hold secret question.
     */
    private static final String SECRET_QUESTION_SESSION_KEY = "secret_question_session_key";

    /**
     * Session key to hold userDTO.
     */
    private static final String USER_DTO_SESSION_KEY = "userDTO_session_key";

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
        LoggingWrapperUtility.logEntrance(logger, signature, null, null);
        HttpSession session = ServletActionContext.getRequest().getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute(USER_DTO_SESSION_KEY);
        SecretQuestion sq = (SecretQuestion) session.getAttribute(SECRET_QUESTION_SESSION_KEY);
        if (null == sq || null == userDTO) {
            msg = "Internal error";
        }

        if (null == msg && !sq.getResponse().equals(secretAnswer)) {
            msg = "Secret answer incorrect";
        }

        if (null == msg) {
         // build the reset password URL.
            String url = ApplicationServer.SERVER_NAME + "/"+ regSource + "/password-reset.jsp";
            RegistrationHelper.sendResetPasswordEmail(userDTO, emailSetting, passwordRecoveryService, url);
            msg = "OK";
        }

        LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
        return SUCCESS;
    }

    /**
     * This method prepares recovering password data and retrieves security question from DB.
     * 
     * @return Execution result.
     * @throws Exception
     *             If there is any service level error.
     */
    public String ajaxSecretQuestion() throws Exception {
        final String signature = CLASS_NAME + "#ajaxSecretQuestion()";
        LoggingWrapperUtility.logEntrance(logger, signature, null, null);
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        SecretQuestion sq = null;
        UserDTO userDTO = null;
        try {
            if (isNonEmpty(handle)) {
                userDTO = userService.getUserByHandle(handle);
            } else if (isNonEmpty(email)) {
                userDTO = userService.getUserByEmail(email);
            }

            if (null == userDTO) {
                msg = "Invalid handle or email";
            } else {
                msg = "OK";
            }

            sq = DataProvider.getSecretQuestionByHandle(userDTO.getHandle());
            session.setAttribute(USER_DTO_SESSION_KEY, userDTO);
            session.setAttribute(SECRET_QUESTION_SESSION_KEY, sq);
            secretQuestion = sq.getQuestion();
        } catch (PersistenceException e) {
            LoggingWrapperUtility.logException(logger, signature, e);
            msg = "Invalid handle or email";
        }
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
    public String getHandle() {
        return handle;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param handle
     *            the name-sake field to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param firstName
     *            the name-sake field to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param lastName
     *            the name-sake field to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param email
     *            the name-sake field to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getSecretQuestion() {
        return secretQuestion;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param secretQuestion
     *            the name-sake field to set
     */
    public void setSecretQuestion(String secretQuestion) {
        this.secretQuestion = secretQuestion;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getSecretAnswer() {
        return secretAnswer;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param secretAnswer
     *            the name-sake field to set
     */
    public void setSecretAnswer(String secretAnswer) {
        this.secretAnswer = secretAnswer;
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
