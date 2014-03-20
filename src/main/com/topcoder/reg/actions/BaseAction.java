/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import javax.annotation.PostConstruct;
import java.util.Arrays;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.reg.services.SocialAccountService;
import com.topcoder.reg.services.UserService;
import com.topcoder.security.login.UserUnactivatedException;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogFactory;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.reg.dto.UserInfoDTO;
import com.topcoder.reg.util.DataProvider;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.SimpleRequest;
import com.topcoder.web.common.SimpleResponse;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.SessionPersistor;


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
* <p>
 * Change in 1.2 (FIRST2FINISH : TopCoder Reg2 - Auto Logon After User Activiation).
 *  <ol>
 *  <li>refactor out common code into login() method</li>
 *  </ol>
 * </p>
 * @author sampath01, leo_lol, ecnu_haozi
 * @version 1.2
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
     * Log in the user.
     * @param handle the user handle.
     * @param password the user password.
     * @param rememberMe indicate whether to remember the user.
     * @param logger to log the exception.
     * @param signature the caller method's signature.
     * @param result the string of return value. result[0] is the login status: ERROR , NONE or SUCCESS; result[1] is the details.
     * @throws Exception if any exception occurs.
     * @since 1.2
     */
    public void login(String handle, String password, boolean rememberMe, Logger logger, String signature, String [] result)throws Exception{
        TCSubject tcSubject = null;
        try {
            LoginRemote login = (LoginRemote) Constants.createEJB(LoginRemote.class);
            tcSubject = login.login(handle, password, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } catch (UserUnactivatedException e) {
            logger.error(signature+e);
            throw e;
        } catch (Exception e) {
            result[0] = ERROR;
            result[1] = "handle or password is wrong, or email is inactive.";
            logger.error(signature+e);
            return;
        }

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();

        BasicAuthentication authentication = new BasicAuthentication(new SessionPersistor(session), new SimpleRequest(
                request), new SimpleResponse(response), BasicAuthentication.MAIN_SITE, DBMS.JTS_OLTP_DATASOURCE_NAME);
        UserInfoDTO info = DataProvider.getUserStatusByHandle(handle);
        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, info.getUserStatus()) > 0) {
            if (info.getEmailStatus() != WebConstants.ACTIVE_EMAIL_STATUS) {
                authentication.logout();
                
                result[0] = ERROR;
                result[1] = "Your email is inactive";
                return ;
            }
            
            authentication.login(new SimpleUser(0, handle, password), rememberMe);

            session.setAttribute(userSessionKey, authentication.getActiveUser());
            session.setAttribute(userHandleSessionKey, handle);
            session.setAttribute(authenticationSessionKey, authentication);

            result[0] = SUCCESS;
            result[1] = "OK";
            return;
        }

        authentication.logout();
        if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, info.getUserStatus()) > 0) {
            result[0] = ERROR;
            result[1] = "Account is inactive";
            return;
        }

        if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, info.getUserStatus()) > 0) {
            result[0] = ERROR;
            result[1] = "Account is not activated after registeration step one";
            return;
        }

        result[0] = NONE;
        result[1] = "System Intenal error.";
        return;
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
