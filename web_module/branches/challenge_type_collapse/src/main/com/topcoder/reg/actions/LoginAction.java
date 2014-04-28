/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import com.topcoder.security.login.UserUnactivatedException;
import com.topcoder.web.tc.Constants;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.topcoder.reg.RegistrationHelper;
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
 * <p>
 * Change in 1.2 (FIRST2FINISH : TopCoder Reg2 - Auto Logon After User Activiation).
 *  <ol>
 *  <li>refactor out the login common code into BaseAction login() method.</li>
 *  </ol>
 * </p>
 * @author sampath01, leo_lol, ecnu_haozi
 * @version 1.2
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
     * The struts result page to go if the login user is unactivated..
     */
    private static final String UNACTIVATED = "unactivated";

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

        String [] result = new String [2];
        try {
            login(handle, password, rememberMe, logger, signature, result);
        } catch (UserUnactivatedException e) {
            message = "OK";
            nextPage = Constants.UNACTIVATED_USER_REDIRECT_URL;

            if (nextPage == null || nextPage.trim().length() == 0) {
                nextPage = "http://www.topcoder.com/account-inactive/";
            }
            return UNACTIVATED;
        }

        message = result[1];
        if(result[0] == ERROR) {
            return LOGIN_FAIL;
        } else if(result[0] == SUCCESS){
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpServletResponse response = ServletActionContext.getResponse();

            HttpSession session = request.getSession();

            nextPage = (String) session.getAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY);
            if (null != nextPage) {
                session.removeAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY);
            }
            return SUCCESS;
        } else {
            return ERROR;
        }
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
