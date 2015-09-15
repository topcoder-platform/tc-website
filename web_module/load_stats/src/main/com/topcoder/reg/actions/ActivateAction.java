/*
 * Copyright (C) 2013 - 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import org.apache.struts2.ServletActionContext;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.config.ConfigurationException;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.AlreadyActivatedException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.ApplicationServer;

import com.topcoder.reg.EmailSetting;

/**
 * <p>
 * This method would validate the activation code and then activate the the account if nothing wrong detected.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe as its parent is not thread safe. But
 * Struts2 framework only uses it in thread-safe manner.
 * </p>
 * <p>
 * Change in v1.1 (F2F - TopCoder Reg2 - Send Email After user activation)
 * <ol>
 * <li>Add new property <code>emailSetting</code> to hold the Welcome message email settings.</li>
 * <li>Add setter for the new properties</li>
 * <li>Add checkConfiguration() to validate welcomeEmailMessageTitle, emailBodyTemplateFile, replyToAddress
 * and senderName</li>
 * <li>Add a call to <code>{@link RegistrationHelper#sendEmailAfterActivation()}</code>
 * for sending an email for greeting a new user.</li>
 * <ol>
 * </p>
 * <p>
 * Change in 1.2 (FIRST2FINISH : TopCoder Reg2 - Auto Logon After User Activiation).
 *  <ol>
 *  <li>log in the user after activation. </li>
 *  </ol>
 * </p>
 * @author leo_lol, ecnu_haozi, TCSDEVELOPER
 * @version 1.2
 * @since 1.0
 */
public class ActivateAction extends BaseAction {

    /**
     * Generated serial number.
     */
    private static final long serialVersionUID = 7216018769686756492L;

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = ActivateAction.class.getName();

    /**
     * Session key to hold user handle.
     */
    private static final String USER_HANDLE_KEY = "user_handle";

    /**
     * Represents the activation code.
     */
    private String code;


    private String destination;

    /**
     * Represents the Welcome email messages settings.
     * @since 1.1
     */
    private EmailSetting emailSetting;

    private static final Logger logger = Logger.getLogger(ActivateAction.class);

    /**
     * <p>
     * This method would validate activation code and activate the account if there is no error.
     * </p>
     * <p>
     * Updated in version 1.1 to send a Welcome email after activation.
     * </p>
     * @throws Exception
     *             If there is any error.
     * @return The result code.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);

        if (null == code || code.trim().length() == 0) {
            addActionError("Empty activation code");
        }

        UserDTO userDTO = null;
        try {
            userService.activate(code);
            long userId = StringUtils.getCoderId(code);
            userDTO = userService.getUserByUserId(userId);
            ServletActionContext.getRequest().setAttribute(USER_HANDLE_KEY, userDTO.getHandle());
            
            String handle = userDTO.getHandle();

            userDTO.setPassword(userService.getPasswordByUserId(userId));
            String password = userDTO.getPassword();
            
            String [] result = new String [2];

            login(handle, password, false, logger, signature, result);

        } catch (PersistenceException e) {
            addActionError(e.getMessage());
            logger.error(e);
            throw e;
        } catch (AlreadyActivatedException e) {
            return SUCCESS;
        }

        // send the Welcome Email messages
        try {
            RegistrationHelper.sendEmailAfterActivation(emailSetting.getEmailSubject(),
                userDTO.getHandle(), emailSetting.getEmailBodyTemplateFile(),
                userDTO.getEmail(), emailSetting.getEmailFromAddress(),
                emailSetting.getSenderName());
        } catch (Exception e) {
            // just log the error and let strut handle the error.
            addActionError(e.getMessage());
            logger.error(e);
        }

        if (getDestination() != null && getDestination().trim().length() > 0) {
            return "redirect";
        } else {
            return SUCCESS;
        }
    }

    /**
     * Sets the activation code.
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * Set the Welcome email messages settings.
     * @param emailSetting the Welcome email message settting to set
     * @since 1.1
     */
    public void setEmailSetting(EmailSetting emailSetting) {
        this.emailSetting = emailSetting;
    }

    /**
     * This method checks success of IoC.
     *
     * @throws ConfigurationException
     *             if there is any configuration error.
     * @since 1.1
     */
    @PostConstruct
    public void checkConfiguration() throws ConfigurationException {
        super.checkConfiguration();
        RegistrationHelper.checkNotNull("emailSetting", emailSetting, ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("emailBodyTemplateFile",
            emailSetting.getEmailBodyTemplateFile(), ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("emailSubject",
            emailSetting.getEmailSubject(), ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("emailFromAddress",
            emailSetting.getEmailFromAddress(), ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("senderName",
            emailSetting.getSenderName(), ConfigurationException.class);
    }


    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }
}
