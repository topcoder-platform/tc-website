/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.dto.SessionSocialAccount;
import com.topcoder.reg.dto.SocialAccount;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.SocialAccountException;
import com.topcoder.shared.util.logging.Logger;

/**
 * <p>
 * When the social account is authenticated by Auth0, it will call a callback URL which corresponds to this action.
 * More specifically, The callback URL come with a code which can be used to get social account info, and a state
 * value which is the redirect page. If the social account binds to some TC account, then login it automatically;
 * else guide the user to registration page.
 * </p>
 *
 * <p>
 *     Version 1.1 (BUGR-10169) changes:
 *     <ul>
 *         <li>Change on {@link #execute()} to support enterprise ldap login </li>
 *     </ul>
 * </p>
 *
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only
 * uses this class in thread-safe manner.
 * 
 * @author ecnu_haozi
 * @version 1.1
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class CallbackAction extends BaseAction {
    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 4203052658734758476L;

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = CallbackAction.class.getName();
	
	private static final Logger logger = Logger.getLogger(CallbackAction.class);

    /**
     * The struts result page to go if the social account doesn't bind to a TC account.
     */
    private static final String REGISTER = "register";

    /**
     * The struts result page to go if the social account binds to a TC account.
     */
    private static final String LOGIN = "login";

    /**
     * The struts result page for success enterprise login.
     * @since 1.1
     */
    private static final String ENTERPRISE_SUCCESS_LOGIN = "enterprise_login";
    /**
     * The struts result page to go if abnormal situation happens.
     */
    private static final String FAIL = "callbackfail";
	
	private String regUrl;

    /**
     * The social account information.
     */
    private SocialAccount social;

    /**
     * Field to store user name from front-end.
     */
    private String handle;

    /**
     * Field to store password from front-end.
     */
    private String password;

    /**
     * The code value which come from the callback URL.
     */
    private String code;

    /**
     * The state value which come from the callback URL.
     */
    private String state;

    /**
     * Validation messages for front-end to display.
     */
    private List<String> messages;

    /**
     * This method would handle and redirect the callback request from Auth0.com.
     * 
     * @throws Exception
     *             If there is any error.
     * @return result code.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);
		
		HttpServletRequest req = ServletActionContext.getRequest();

        if (null == messages) {
            messages = new ArrayList<String>();
        }

        // set this action's data fields.
        try {
            // retrieve social data according to the code value.
            social = socialService.getSocialAccount(code);

            SessionSocialAccount socialAccountInSession = new SessionSocialAccount(social, false);
            
            HttpSession session = req.getSession();
            session.setAttribute(RegistrationHelper.SOCIAL_ACCOUNT_SESSION_KEY, socialAccountInSession);

            // If this is login from Auth0 LDAP integration
            if (social.isEnterpriseLogin()){
                UserDTO user = userService.getUserByHandle(social.getName());
                handle = user.getHandle();
                user.setPassword(userService.getPasswordByUserId(user.getUserId()));
                password = user.getPassword();

                // store the page to redirect after login successfully into session.
                session.setAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY, state);
                //LoggingWrapperUtility.logExit(logger, signature, new String[] {LOGIN});

                return LOGIN;
            }            
            
            Long userIdBoundWithSocialAccount = socialService.findUserBySocialAccount(social);

            // If the social account binds to a TC account.
            if (userIdBoundWithSocialAccount != null) {
                UserDTO user = userService.getUserByUserId(userIdBoundWithSocialAccount);
                handle = user.getHandle();
                
                user.setPassword(userService.getPasswordByUserId(userIdBoundWithSocialAccount));
                password = user.getPassword();
                // store the page to redirect after login successfully into session.
                session.setAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY, state);
                //LoggingWrapperUtility.logExit(logger, signature, new String[] {LOGIN});

                return LOGIN;
            }

        } catch (PersistenceException e) {
            //LoggingWrapperUtility.logException(logger, signature, e);
			logger.error(signature+e);
            messages.add(e.getMessage());
            return FAIL;
        } catch (SocialAccountException e) {
            //LoggingWrapperUtility.logException(logger, signature, e);
			logger.error(signature+e);
            messages.add(e.getMessage());
            return FAIL;
        } catch (Exception e) {
            //LoggingWrapperUtility.logException(logger, signature, e);
			logger.error(signature+e);
            messages.add(e.getMessage());
            return FAIL;
        }

        //LoggingWrapperUtility.logExit(logger, signature, new String[] {REGISTER});
		//regUrl = "https://" + req.getServerName() + "/reg2/showRegister.action";
		regUrl = "http://www.topcoder.com/?action=callback#access_token="+social.getAccessToken()+"&id_token="+social.getJsonWebToken()+"&token_type=bearer&state=http%3A%2F%2Fwww.topcoder.com";
        return REGISTER;
    }

    /**
     * <p>
     * The getter method for field social.
     * </p>
     * 
     * @return the social
     */
    public SocialAccount getSocial() {
        return social;
    }

    /**
     * <p>
     * The setter method for field social.
     * </p>
     * 
     * @param social
     *            the social to set
     */
    public void setSocial(SocialAccount social) {
        this.social = social;
    }

    /**
     * <p>
     * The getter method for field handle.
     * </p>
     * 
     * @return the handle
     */
    public String getHandle() {
        return handle;
    }

    /**
     * <p>
     * The setter method for field handle.
     * </p>
     * 
     * @param handle
     *            the handle to set
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * <p>
     * The getter method for field password.
     * </p>
     * 
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * <p>
     * The setter method for field password.
     * </p>
     * 
     * @param password
     *            the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * <p>
     * The getter method for field code.
     * </p>
     * 
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * <p>
     * The setter method for field code.
     * </p>
     * 
     * @param code
     *            the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * <p>
     * The getter method for field state.
     * </p>
     * 
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * <p>
     * The setter method for field state.
     * </p>
     * 
     * @param state
     *            the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * <p>
     * The getter method for field messages.
     * </p>
     * 
     * @return the messages
     */
    public List<String> getMessages() {
        return messages;
    }

    /**
     * <p>
     * The setter method for field messages.
     * </p>
     * 
     * @param messages
     *            the messages to set
     */
    public void setMessages(List<String> messages) {
        this.messages = messages;
    }
	
	public String getRegUrl() {
        return regUrl;
    }


    public void setRegUrl(String regUrl) {
        this.regUrl = regUrl;
    }

}
