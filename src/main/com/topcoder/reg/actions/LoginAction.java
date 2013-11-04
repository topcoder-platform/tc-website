/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.RegistrationHelper;
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
import com.topcoder.shared.util.logging.Logger;

/**
 * This action will be used to perform user authentication given user-name, password and remember me flag(all are
 * assumed to be available from HttpServletRequest).
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * <p>
 * Change in v1.1 (Release Assembly - TopCoder Website Social Login)
 * <ol>
 * <li>Deal the login successful result and fail result separately.</li>
 * <ol>
 * <p>
 * @author sampath01, leo_lol, ecnu_haozi
 * @version 1.1
 * @since 1.0
 */
public class LoginAction extends BaseAction {
    /**
     * Generated serial.
     */
    private static final long serialVersionUID = -260621758949488141L;

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = LoginAction.class.getName();
	
	private static final Logger logger = Logger.getLogger(LoginAction.class);
    
    /**
     * The struts result page to go if the login failed.
     * @since 1.1
     */
    private static final String LOGIN_FAIL = "loginfail";

    /**
     * Field to store user name from front-end.
     */
    private String handle;

    /**
     * Field to store password from front-end.
     */
    private String password;

    /**
     * Field to store the remember me check-box from front-end.
     */
    private boolean rememberMe;

    /**
     * Message to store login result.
     */
    private String message;

    /**
     * Next page to go after logging in successfully;
     */
    private String nextPage;

    /**
     * This method logs user in.
     * 
     * @return Result code.
     * @throws Exception
     *             If there is any error.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);
        TCSubject tcSubject = null;
        try {
            LoginRemote login = (LoginRemote) Constants.createEJB(LoginRemote.class);
            tcSubject = login.login(handle, password, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            message = "handle or password is wrong, or email is inactive.";
            logger.error(signature+e);
            return LOGIN_FAIL;
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
                message = "Your email is inactive";
                //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
                return LOGIN_FAIL;
            }
            
            authentication.login(new SimpleUser(0, handle, password), rememberMe);

            session.setAttribute(userSessionKey, authentication.getActiveUser());
            session.setAttribute(userHandleSessionKey, handle);
            session.setAttribute(authenticationSessionKey, authentication);

            nextPage = (String) session.getAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY);
            if (null != nextPage) {
                session.removeAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY);
            }
            message = "OK";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return SUCCESS;
        }

        authentication.logout();
        if (Arrays.binarySearch(WebConstants.INACTIVE_STATI, info.getUserStatus()) > 0) {
            message = "Account is inactive";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return LOGIN_FAIL;
        }

        if (Arrays.binarySearch(WebConstants.UNACTIVE_STATI, info.getUserStatus()) > 0) {
            message = "Account is not activated after registeration step one";
            //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
            return LOGIN_FAIL;
        }
        message = "System Internal Error";
        //LoggingWrapperUtility.logExit(logger, signature, new String[] { ERROR });
        return ERROR;
    }

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
    public boolean isRememberMe() {
        return rememberMe;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param rememberMe
     *            the name-sake field to set
     */
    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getMessage() {
        return message;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param message
     *            the name-sake field to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public String getNextPage() {
        return nextPage;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param nextPage
     *            the name-sake field to set
     */
    public void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }

}
