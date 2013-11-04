/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import javax.annotation.PostConstruct;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.SocialAccountService;
import com.topcoder.reg.services.UserService;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogFactory;
import com.topcoder.shared.util.logging.Logger;

/**
 * This action is responsible for holding common data like logger. It implements checkConfiguration method which will be
 * check member logger instance. All subclasses of this action should override this method to check additional
 * configuration.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * <p>
 * Change in v1.1 (Release Assembly - TopCoder Website Social Login)
 * <ol>
 * <li>Add SocialAccountService instance to support social account single sign-in related operations.</li>
 * <ol>
 * <p>
 * @author sampath01, leo_lol, ecnu_haozi
 * @version 1.1
 * @since 1.0
 */
public class BaseAction extends ActionSupport {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 3875108178316767336L;

    /**
     * It has getter/setter and will be injected by Spring.
     */
    protected UserService userService;

    /**
     * It has getter/setter and will be injected by Spring.
     * @since 1.1
     */
    protected SocialAccountService socialService;

    /**
     * {@link Log} instance, which will be injected by Spring. Not null after IoC.
     */
    //protected Log logger;
	
	private static final Logger logger = Logger.getLogger(BaseAction.class);

    /**
     * Key used to store user into session. It'll be injected by Spring.
     */
    protected String userSessionKey;

    /**
     * Key used to store user handle into session. It'll be injected by Spring.
     */
    protected String userHandleSessionKey;

    /**
     * Key used to store authentication instance into session. It'll be injected by Spring.
     */
    protected String authenticationSessionKey;

    /**
     * Default session key for captcha word.
     */
    private static final String CAPTCHA_WORD_SESSION_KEY = "capword";

    /**
     * Captcha word session key. It's injected by Spring. It has a default value.
     */
    protected String captchaWordSessionKey = CAPTCHA_WORD_SESSION_KEY;

    /**
     * Dump user ID for security operation.
     */
    protected long dumpUserId = 132456;

    /**
     * Registration source.
     */
    protected String regSource = "reg2";

    /**
     * This method is to check if {{@link #logger} and {{@link #userDAO} are successfully injected.
     * 
     * @throws ConfigurationException
     *             If injection fails, namely, there is some error in spring configuration file.
     */
    @PostConstruct
    public void checkConfiguration() throws ConfigurationException {
        //logger = LogFactory.getInstance().getLog("BaseAction");
        RegistrationHelper.checkNotNull("logger", logger, ConfigurationException.class);

        RegistrationHelper.checkNotNullOrEmpty("userSessionKey", userSessionKey, ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("userHandleSessionKey", userHandleSessionKey,
                ConfigurationException.class);
        RegistrationHelper.checkNotNullOrEmpty("authenticationSessionKey", authenticationSessionKey,
                ConfigurationException.class);
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getUserSessionKey() {
        return userSessionKey;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param userSessionKey
     *            the name-sake field to set
     */
    public void setUserSessionKey(String userSessionKey) {
        this.userSessionKey = userSessionKey;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getUserHandleSessionKey() {
        return userHandleSessionKey;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param userHandleSessionKey
     *            the name-sake field to set
     */
    public void setUserHandleSessionKey(String userHandleSessionKey) {
        this.userHandleSessionKey = userHandleSessionKey;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getAuthenticationSessionKey() {
        return authenticationSessionKey;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param authenticationSessionKey
     *            the name-sake field to set
     */
    public void setAuthenticationSessionKey(String authenticationSessionKey) {
        this.authenticationSessionKey = authenticationSessionKey;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getCaptchaWordSessionKey() {
        return captchaWordSessionKey;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param captchaWordSessionKey
     *            the name-sake field to set
     */
    public void setCaptchaWordSessionKey(String captchaWordSessionKey) {
        this.captchaWordSessionKey = captchaWordSessionKey;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param userService
     *            the name-sake field to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public long getDumpUserId() {
        return dumpUserId;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param dumpUserId
     *            the name-sake field to set
     */
    public void setDumpUserId(long dumpUserId) {
        this.dumpUserId = dumpUserId;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getRegSource() {
        return regSource;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param regSource
     *            the name-sake field to set
     */
    public void setRegSource(String regSource) {
        this.regSource = regSource;
    }

    /**
     * <p>
     * The getter method for field socialService.
     * </p>
     * @since 1.1
     * @return the socialService
     */
    public SocialAccountService getSocialService() {
        return socialService;
    }

    /**
     * <p>
     * The setter method for field socialService.
     * </p>
     * @since 1.1
     * @param socialService
     *            the socialService to set
     */
    public void setSocialService(SocialAccountService socialService) {
        this.socialService = socialService;
    }

}
